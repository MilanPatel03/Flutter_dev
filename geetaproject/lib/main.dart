import 'package:flutter/material.dart';
import 'package:geetaproject/models/autherscontentmodel.dart';
import 'package:geetaproject/models/geetachaptermodel.dart';
import 'package:geetaproject/models/geetaslokmodel.dart';
import 'package:geetaproject/models/savelistmodel.dart';
import 'package:geetaproject/providers/geetaProvider.dart';
import 'package:geetaproject/repositories/geetarepository.dart';
import 'package:geetaproject/services/geetaservices.dart';
import 'package:geetaproject/ui/views/homepage.dart';
import 'package:geetaproject/ui/views/homepagechg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(GeetaSlokModelAdapter());
  Hive.registerAdapter(AuthorContentAdapter());
  Hive.registerAdapter(GeetaChapterModelAdapter());
  Hive.registerAdapter(MeaningAdapter());
  Hive.registerAdapter(SavelistModelAdapter());

  await Hive.openBox('slokBox');
  await Hive.openBox('chapterBox');
  await Hive.openBox('savelistBox');

  // await Hive.box('slokBox').clear(); // Clear the box to remove corrupted data (temporary for testing)
  // await Hive.box('chapterBox').clear();

  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => GeetaProvider(GeetaRepository(GeetaServices()))..loadChapters(),),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Homepagechg(),
    );
  }
}

