import 'package:geetaproject/models/geetachaptermodel.dart';
import 'package:geetaproject/models/geetaslokmodel.dart';
import 'package:geetaproject/services/geetaservices.dart';

class GeetaRepository {

  final GeetaServices _geetaServices;
  GeetaRepository(this._geetaServices);

  Future<GeetaSlokModel> fetchSlok(int chapter, int verse) => _geetaServices.fetchSlok(chapter,verse);

  Future<List<GeetaChapterModel>> fetchChapter() => _geetaServices.fetchChapter();

}