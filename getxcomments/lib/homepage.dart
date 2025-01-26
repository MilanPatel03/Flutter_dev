import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getxcomments/firebase_auth_service.dart';
import 'package:getxcomments/loginSignup.dart';

import 'ApiService.dart';
import 'CommentsModel.dart';

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


  final FirebaseAuthService _authService = FirebaseAuthService();
  String? userEmail; // Store the signed-in user's email here

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

  Future<void> _signOut() async {
    try {
      await _authService.signOut();
      // Navigate back to the login screen or show a confirmation
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Loginsignup()));  // Adjust the route to your login screen
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error signing out: $e')));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchedData();
    // Listen for authentication state changes
    _authService.authStateChanges.listen((user) {
      if (user != null) {
        setState(() {
          userEmail = user.email; // Get and store the user's email
        });
      } else {
        // If the user is signed out, navigate to login screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Loginsignup()),
        );
      }
    });

  }

  @override
  Widget build(BuildContext context) {

    sortComments();

    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
        centerTitle: true,
        leading: IconButton(onPressed:  (){
          // Show the settings menu when the settings icon is clicked
          showMenu(
            context: context,
            position: RelativeRect.fromLTRB(0, 0, 0, 50), // Customize the position if necessary
            items: [
              const PopupMenuItem<String>(
                value: 'signout',
                child: Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(width: 8),
                    Text("Sign Out"),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'about',
                  child: Row(
                    children: [
                      Icon(Icons.info),
                      Text("About"),
                    ],
                  ),
              ),
            ],
            elevation: 8.0,
          ).then((value) {
            if (value == 'signout') {
              _signOut();
            } else if(value == 'about') {
              _showAboutDialog(context);
            }
          });
        }, icon: Icon(Icons.settings)),

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
      body: dispcomments.isEmpty ? const Center(child: CircularProgressIndicator(),)
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

  // Show the About dialog with user details
  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("About"),
          content: userEmail != null
              ? Text("User Email: $userEmail")  // Display the user's email
              : const Text("No user signed in."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
