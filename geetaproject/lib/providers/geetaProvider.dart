
import 'package:flutter/cupertino.dart';
import 'package:geetaproject/models/geetachaptermodel.dart';
import 'package:geetaproject/models/geetaslokmodel.dart';
import 'package:geetaproject/repositories/geetarepository.dart';
import 'package:hive/hive.dart';

import '../models/savelistmodel.dart';

class GeetaProvider extends ChangeNotifier {

  final GeetaRepository _geetaRepository;
  GeetaProvider(this._geetaRepository) {_loadSavelists();}

  List<GeetaChapterModel> _chapters = [];
  List<GeetaChapterModel> get chapters => _chapters;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<GeetaSlokModel> fetchSlok(int chapterNumber, int slokNumber) async {
    // _isLoading = true;  // Set loading state to true when the fetch starts
    // notifyListeners();  // Notify listeners to update the UI

    final box = Hive.box('slokBox');
    final key = "$chapterNumber-$slokNumber";

    try {

      if (box.containsKey(key)) {
        final slok = box.get(key) as GeetaSlokModel?;
        if (slok == null || slok.id == null || slok.slok == null) {
          throw Exception("Invalid cached data for slok $key");
        }
        print("Retrieved cached slok $key: $slok"); // Debug log
        return slok;
      } else {
        final slok = await _geetaRepository.fetchSlok(chapterNumber, slokNumber);
        if (slok == null || slok.id == null || slok.slok == null) {
          throw Exception("Invalid slok data from API");
        }
        print("Fetched slok $key from API: $slok"); // Debug log
        return slok;
      }

    } catch (e) {
      throw Exception("Error fetching slok: $e");
    }
  }

  Future<void> downloadSlok(int chapterNumber, int slokNumber) async {
    _isLoading = true;
    notifyListeners();

    final box = Hive.box('slokBox');
    try {
      // _isLoading = true;
      final key = "$chapterNumber-$slokNumber";
      final slok = await _geetaRepository.fetchSlok(chapterNumber, slokNumber);

      if (slok == null || slok.id == null || slok.slok == null) {
        throw Exception("Invalid slok data for download");
      }
      print("Downloading slok $key: $slok"); // Debug log
      box.put(key, slok); // Store the object directly

    } catch (e) {
      throw Exception("Error downloading slok: $e");
    } finally {
      _isLoading = false;
      notifyListeners();  // ✅ Single call here
    }
  }

  Future<void> loadChapters() async {
    _isLoading = true;
    notifyListeners();

    final box = Hive.box('chapterBox');
    try {
      if (box.containsKey('chapters')) {
        final cachedChapters = box.get('chapters') as List<dynamic>?;
        if (cachedChapters != null) {
          _chapters = cachedChapters.cast<GeetaChapterModel>().toList();
          print("Retrieved cached chapters: $_chapters");
        } else {
          throw Exception("Invalid cached chapter data");
        }
      } else {
        _chapters = await _geetaRepository.fetchChapter();
        if (_chapters.isEmpty) {
          throw Exception("No chapters fetched from API");
        }
        box.put('chapters', _chapters);
        print("Saved chapters to Hive: $_chapters");
      }
    } catch (e) {
      print("Error loading chapters: $e");
      _chapters = [];
    }

    _isLoading = false;
    notifyListeners();
  }



  List<SavelistModel> _savelists = []; // Store savelists
  List<String> get savelists => _savelists.map((savelist) => savelist.name).toList();

  List<SavelistModel> get savelistModels => _savelists; // New getter for SavelistModel list

  Future<void> _loadSavelists() async {
    final box = Hive.box('savelistBox');
    try {
      if (box.isNotEmpty) {
        _savelists = box.values.cast<SavelistModel>().toList();
        print("Loaded savelists from Hive: ${_savelists.map((s) => s.name)}");
      }
    } catch (e) {
      print("Error loading savelists: $e");
      _savelists = [];
    }
    notifyListeners();
  }

  Future<void> createSavelist(String name) async {
    final box = Hive.box('savelistBox');
    if (!_savelists.any((savelist) => savelist.name == name)) {
      final newSavelist = SavelistModel(name: name, sloks: []);
      _savelists.add(newSavelist);
      await box.put(name, newSavelist);
      print("Created savelist: $name");
      notifyListeners();
    } else {
      throw Exception("Savelist '$name' already exists");
    }
  }

  Future<void> addSlokToSavelist(String savelistName, int chapterNumber, int slokNumber) async {
    final box = Hive.box('savelistBox');
    final savelistIndex = _savelists.indexWhere((savelist) => savelist.name == savelistName);
    if (savelistIndex != -1) {
      final savelist = _savelists[savelistIndex];
      if (!savelist.sloks.any((slok) => slok['chapter'] == chapterNumber && slok['slok'] == slokNumber)) {
        savelist.sloks.add({
          'chapter': chapterNumber,
          'slok': slokNumber,
        });
        await box.put(savelistName, savelist);
        print("Added slok $chapterNumber-$slokNumber to savelist: $savelistName");
        notifyListeners();
      } else {
        throw Exception("Slok already exists in savelist '$savelistName'");
      }
    } else {
      throw Exception("Savelist '$savelistName' not found");
    }
  }

}
