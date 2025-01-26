import 'package:apistoscreen/RecipesModel.dart';
import 'package:flutter/material.dart';

import 'apiservice.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Recipes> _allRecipes = [];
  List<Recipes> _pakistaniRecipes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadRecipes();
  }

  Future<void> loadRecipes() async {
    try {
      final recipeModel = await ApiService.fetchRecipes();

      setState(() {
        _allRecipes = recipeModel.recipes!;
        _pakistaniRecipes = filterPakistaniCuisines(recipeModel.recipes!);
      });
    } catch (e) {
      print("Error fetching $e");
    }
  }

  List<Recipes> filterPakistaniCuisines(List<Recipes> recipes) {
    return recipes.where((recipe) => recipe.cuisine == "Pakistani").toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delicious Recipes'),
      ),
      body: _allRecipes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                buildSectionTitle("All Recipes"),
                buildRecipesList(_allRecipes),
                buildSectionTitle("Pakistani Recipes"),
                buildRecipesList(_pakistaniRecipes),
              ],
            ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  Widget buildRecipesList(List<Recipes> recipes) {
    return ListView.builder(
        itemCount: recipes.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var recipe = recipes[index];

          return Card(
            child: ExpansionTile(
              leading: recipe.image != null
                  ? Image.network(recipe.image!)
                  : const Icon(Icons.food_bank),
              title: Text(recipe.name ?? "No name"),
              subtitle: Text("Prep time: ${recipe.prepTimeMinutes} minutes"),
              children: [
                //Ingredients Section
                ListTile(
                  title: GestureDetector(
                    child: const Text(
                      "Ingredients",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              (recipe.ingredients != null &&
                                      recipe.ingredients is List)
                                  ? (recipe.ingredients as List).join(",")
                                  : "No Ingredients Available",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w200, fontSize: 16),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),

                //Instructions Section
                ListTile(
                  title: GestureDetector(
                    child: const Text(
                      "Instructions",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              (recipe.instructions != null &&
                                      recipe.instructions is List)
                                  ? (recipe.instructions as List).join(",")
                                  : "No Instructions Available",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w200),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
