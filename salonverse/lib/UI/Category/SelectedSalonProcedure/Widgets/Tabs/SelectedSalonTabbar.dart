import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salonverse/Commons/CommonColors.dart';
import 'package:salonverse/UI/Category/SelectedSalonProcedure/Widgets/Tabs/TabFourSections/aboutSection.dart';
import 'package:salonverse/UI/Category/SelectedSalonProcedure/Widgets/Tabs/TabFourSections/productsSection.dart';
import 'package:salonverse/UI/Category/SelectedSalonProcedure/Widgets/Tabs/TabFourSections/serviceSection.dart';
import 'package:salonverse/UI/Category/SelectedSalonProcedure/Widgets/Tabs/TabFourSections/stylistSection.dart';
import 'package:salonverse/UI/Category/ServiceCategoryByGender/Model/SalonDetailsModel.dart';

import '../../../../../Commons/SalonsModel.dart';

class Selectedsalontabbar extends StatefulWidget {
  final Salon salon;
  const Selectedsalontabbar({super.key, required this.salon});

  @override
  State<Selectedsalontabbar> createState() => _SelectedsalontabbarState();
}

class _SelectedsalontabbarState extends State<Selectedsalontabbar> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int? tabNumber;
  late SalonDetails matchingSalonDetails;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_tabController = TabController(vsync: this, length: 4);
    tabNumber = 0;
    print('tabNumber :$tabNumber ');
    _tabController = TabController(length: 4, vsync: this);

    // Find the matching SalonDetails for the selected salon.
    // Ensure that the names match or use a unique identifier.
    matchingSalonDetails = salonDetailsList.firstWhere(
          (detail) => detail.name == widget.salon.name,
      orElse: () => SalonDetails(
        name: widget.salon.name,
        description: "No description available.",
        operatingHours: "Not specified",
        address: "Not specified",
        contactNumber: "Not specified",
        stylists: [],
        products: [],
        productsPrices: [],
        timeSlots: [],
      ),
    );

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedSalon = widget.salon;

    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            ///==================== Tabs ======================///
            TabBar(
              controller: _tabController,
              physics: const ClampingScrollPhysics(),
              // isScrollable: false,
              // dragStartBehavior: DragStartBehavior.down,
              onTap: (tabNumberx) async {
                print("tabNumber :$tabNumberx");

                setState(() {
                  tabNumber = tabNumberx;
                  print("tabNumber : $tabNumber");
                  if (tabNumber == 0) {
                    print("Details page calling ...");
                  } else if (tabNumber == 1) {
                  } else if (tabNumber == 2) {
                  } else {}
                });
              },
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              indicatorColor: AppColors.brownAppBarFaded,
              tabs: const [
                Tab(text: "About"),
                Tab(text: "Services"),
                Tab(text: "Stylist"),
                Tab(text: "Products"),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                clipBehavior: Clip.none,
                children: [
                  Aboutsection(salonDetails: matchingSalonDetails, salon: selectedSalon, tabController: _tabController,),
                  // Tab 2: Services
                  Servicesection(salonDetails: matchingSalonDetails, salon: selectedSalon, tabController: _tabController,),
                  // Tab 3: Stylist
                  Stylistsection(salonDetails: matchingSalonDetails, tabController: _tabController),
                  // Tab 4: Products
                  ProductSection(salonDetails: matchingSalonDetails, tabController: _tabController,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
