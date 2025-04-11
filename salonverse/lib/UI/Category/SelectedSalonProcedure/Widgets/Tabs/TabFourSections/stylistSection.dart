import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:salonverse/Commons/CommonColors.dart';
import 'package:salonverse/Data/Services/SalonServices/ServiceController.dart';
import 'package:salonverse/UI/Category/ServiceCategoryByGender/Model/SalonDetailsModel.dart';

class Stylistsection extends StatefulWidget {
  final SalonDetails salonDetails;
  final TabController tabController;
  const Stylistsection({required this.salonDetails,super.key, required this.tabController});

  @override
  State<Stylistsection> createState() => _StylistsectionState();
}

class _StylistsectionState extends State<Stylistsection> {

  late List<bool> isCheckedList;
  final stylistController = Get.find<ServiceController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final stylists = widget.salonDetails.stylists;
    isCheckedList = List.generate(stylists.length, (index) => stylistController.selectedStylists.contains(stylists[index]),);

  }

  @override
  Widget build(BuildContext context) {

    final size = Size.square(MediaQuery.of(context).size.shortestSide);
    final halfsizewidth = size.width / 2;
    final onefourthwidth = size.width / 4;
    final thisSalonStylists = widget.salonDetails.stylists;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: thisSalonStylists.length,
            itemBuilder: (BuildContext context, int index) {

              String singleStylist = thisSalonStylists[index];

              String stylistName = thisSalonStylists[index];
              
              return CheckboxListTile(
                title: Text(stylistName),
                value: isCheckedList[index],
                onChanged: (value) {
                  setState(() {
                    isCheckedList[index] = value!;
                    stylistController.toggleStylist(stylistName, value);
                  });
                },
                activeColor: Colors.transparent,
                checkColor: AppColors.brownColorApp,
              );
            },
          ),
        ),
        const Gap(10),
        TextButton(
          onPressed: () {
            stylistController.filterDetailsBySelectedSalon(widget.salonDetails.name);
            widget.tabController.animateTo(3);
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: onefourthwidth / 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side:
              const BorderSide(width: 0.5, color: AppColors.brownColorApp),
            ),
          ),
          child: const SizedBox(
            width: double.infinity,
            child: Center(
              child: Text(
                "Next",
                style: TextStyle(color: AppColors.brownColorApp),
              ),
            ),
          ),
        )
      ],
    );
  }
}
