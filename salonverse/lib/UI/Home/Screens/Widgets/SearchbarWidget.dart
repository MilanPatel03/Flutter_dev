import 'package:flutter/material.dart';

class Searchbarwidget extends StatelessWidget {
  Searchbarwidget({super.key});

  bool isDark = false;

  @override
  Widget build(BuildContext context) {

    final ThemeData themeData = ThemeData(useMaterial3: true, brightness: isDark ? Brightness.dark : Brightness.light);


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
          padding: const WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 8)),

          side: WidgetStateProperty.all(
            const BorderSide(
              color: Color(0xFFAF7F1F),
              width: 1.5,
            ),
          ),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
          ),

          hintText: "Search Services..",
          leading: const Icon(Icons.search),
          onTap: () {
            controller.openView();
            themeData;
          },
          onChanged: (_) {
            controller.openView();
          },
          onTapOutside: (_) {
            FocusScope.of(context).unfocus();
          },
          onSubmitted: (_) {},
          elevation: const WidgetStatePropertyAll(0),
        );
      }, suggestionsBuilder: (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'item $index';
          return ListTile(
            title: Text(item),
            onTap: () {},
          );
        });
      }),
    );
  }
}
