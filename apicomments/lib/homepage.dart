import 'package:apicomments/ApiService.dart';
import 'package:apicomments/CommentsModel.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  List<Comments> dispcomments = [];
  List<Comments> originalComments = [];
  String sortOrder = "Ascending";
  String filterOption = "Show all comments";

  // List of positive words
  final List<String> positiveWords = [
    "excellent", "nice", "wow", "amazing", "awesome", "great", "fantastic"
  ];

  //make function to store it in dispcomments
  void fetchedData() async {
    CommentsModel fetchedComments = await ApiService().fetchComments();
    setState(() {
      originalComments = fetchedComments.comments ?? [];
      dispcomments = fetchedComments.comments ?? [];
      applyFilter();
    });
  }

  // Apply filter based on the filterOption
  void applyFilter() {
    if (filterOption == "Show positive comments only") {
      dispcomments = originalComments.where((comment) {
        return positiveWords.any((word) => comment.body?.toLowerCase().contains(word) ?? false);
      }).toList();
    } else {
      // Show all comments if "Show all comments" is selected
      dispcomments = List.from(originalComments);  // <-- Reset to the original list
    }
  }


  //dispcomments.sort((a,b) => (b.likes ?? 0).compareTo(a.likes ?? 0));
  void sortComments() {
    if(sortOrder =="Ascending"){
      dispcomments.sort((a,b) => (a.likes ?? 0).compareTo(b.likes ?? 0));
    } else {
      dispcomments.sort((a,b) => (b.likes ?? 0).compareTo(a.likes ?? 0));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchedData();
  }

  @override
  Widget build(BuildContext context) {

    sortComments();

    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
        centerTitle: true,
        actions: [
          //Dropdown
          DropdownButton<String>(
            /*value is what is currently selected in the dropdown.
            sortOrder is a variable that holds the current choice
            (either "Ascending" or "Descending").
            */
            value: sortOrder,
            /* items: ['Ascending', 'Descending'] gives us two choices in the dropdown menu.
             map((String value) {...}) turns each of these choices into a clickable item
             for the user to select. */
            items: ['Ascending', 'Descending'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // setState() to refresh the screen and apply the new sort order.
              setState(() {
                sortOrder = newValue!;
                sortComments(); // Re-sort after selection
              });
            },
          ),

          // Popup menu to choose filter options
          PopupMenuButton<String>(
            onSelected: (String selectedOption) {
              setState(() {
                filterOption = selectedOption;
                applyFilter();  // Re-apply the filter when selection changes
              });
            },
            itemBuilder: (BuildContext context) {
              return ['Show all comments', 'Show positive comments only']
                  .map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),

        ],


      ),
      body: dispcomments.isEmpty ? Center(child: CircularProgressIndicator(),)
          :
      ListView.builder(
          itemCount: dispcomments.length,
          itemBuilder: (context, index){

            Comments individualComment = dispcomments[index];

            return Card(
              child: ListTile(
                leading: Text("Likes: ${individualComment.likes ?? 0}" "Likes"),
                title: Text(individualComment.body ?? "Nothing"),
                subtitle: Text(individualComment.user?.username ?? "User"),
              ),
            );
      }),
    );
  }
}
