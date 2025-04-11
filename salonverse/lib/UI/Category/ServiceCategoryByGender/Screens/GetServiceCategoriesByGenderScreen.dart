import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonverse/Commons/CommonColors.dart';
import 'package:salonverse/UI/Category/ServiceCategoryByGender/Controller/GetServiceCategoryByGenderController.dart';
import '../../../../Commons/CommonAppbar.dart';
import '../../../../Commons/CommonAssets.dart';
import '../../../../Commons/TextStyles.dart';
import '../../../Home/Screens/Widgets/SearchbarWidget.dart';

class Getservicecategoriesbygenderscreen extends StatefulWidget {
  final String? category;
  final String? gender;

  const Getservicecategoriesbygenderscreen({
    required this.category,
    required this.gender,
    super.key,
  });

  @override
  State<Getservicecategoriesbygenderscreen> createState() => _GetservicecategoriesbygenderscreenState();
}

class _GetservicecategoriesbygenderscreenState extends State<Getservicecategoriesbygenderscreen> {

  final GetServiceCategoryByGenderController _getServiceCategoryByGenderCoObj = Get.put(GetServiceCategoryByGenderController());
  late List<String> serviceTitles;
  late List<AssetImage> serviceIcons;

  @override
  void initState() {
    super.initState();
    _getServiceCategoryByGenderCoObj.getServiceCategoryController(widget.gender);
    if (widget.category == "Men") {
      serviceTitles = mensServiceCategoryTitles;
      serviceIcons = mensServiceCategoryIcons;
    } else if (widget.category == "Women") {
      serviceTitles = womensServiceCategoryTitles;
      serviceIcons = womensServiceCategoryIcons;
    } else {
      serviceTitles = [];
      serviceIcons = [];
    }
    setState(() {

    });
  }


  AssetImage _getIconForCategory(String categoryName) {
    int index = serviceTitles.indexOf(categoryName);
    if (index != -1 && index < serviceIcons.length) {
      return serviceIcons[index];
    }
    return const AssetImage('assets/default_icon.png');
  }

  @override
  Widget build(BuildContext context) {
    final size = Size.square(MediaQuery.of(context).size.shortestSide);
    final primarySize = size.shortestSide / 20;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.height * 0.10),
        child: CommonAppbar(
          title: Text(
            "Categories",
            style: FontStyles.w400_20_white,
          ),
          actions: [
            IconButton(
              onPressed: Get.back,
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.appbarTextColor,
              ),
            ),
          ],
        ),
      ),
      body: Obx(
            () {
          if (_getServiceCategoryByGenderCoObj.loading.value) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.appbarTextColor,
              ),
            );
          }
          final categories = _getServiceCategoryByGenderCoObj.oldResponse.value.data;
          if (categories == null || categories.isEmpty) {
            return Center(
              child: Text(
                _getServiceCategoryByGenderCoObj.oldResponse.value.message ??
                    "No categories found",
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(primarySize),
                  child: Text("${widget.category}'s Category"),
                ),
                SizedBox(height: Get.height * 0.05),
                Searchbarwidget(),
                SizedBox(height: Get.height * 0.05),
                Padding(
                  padding: EdgeInsets.only(
                    left: primarySize,
                    right: primarySize,
                    top: 2 * primarySize,
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 35,
                      mainAxisSpacing: 25,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return GestureDetector(
                        // onTap: () {
                        //   String selectedService = category.name.toString();
                        //   Get.find<ShowServiceController>().filterSalonsByService(selectedService);
                        //   if (widget.category == "Men") {
                        //     Get.to(() => Menssalonlistforselectedservice(service: selectedService));
                        //   } else if (widget.category == "Women") {
                        //     Get.to(() => Womenssalonlistforselectedservice(service: selectedService));
                        //   }
                        // },
                        child: Column(
                          children: [
                            Container(
                              height: 65,
                              width: 65,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: serviceCategoryColors[index % serviceCategoryColors.length],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: _getIconForCategory(category.name.toString()),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              category.name.toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mulish(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
