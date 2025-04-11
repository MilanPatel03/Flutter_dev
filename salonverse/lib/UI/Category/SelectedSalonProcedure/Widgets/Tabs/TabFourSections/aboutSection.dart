import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:salonverse/Commons/CommonAssets.dart';
import 'package:salonverse/UI/Category/ServiceCategoryByGender/Model/SalonDetailsModel.dart';
import '../../../../../../Commons/CommonColors.dart';
import '../../../../../../Commons/SalonsModel.dart';

class Aboutsection extends StatelessWidget {
  final SalonDetails salonDetails;
  final Salon salon;
  final TabController tabController;

  const Aboutsection({super.key, required this.salonDetails, required this.salon, required this.tabController});

  @override
  Widget build(BuildContext context) {

    final size = Size.square(MediaQuery.of(context).size.shortestSide);
    final halfsizewidth = size.width/2;
    final onefourthwidth = size.width/4;

    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(10),
                const Text(
                  "Description",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const Gap(5),
                Text(
                  salonDetails.description,
                  style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
                ),
                const Gap(10),
                const Text(
                  "Operating Hours",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const Gap(5),
                Text(
                  salonDetails.operatingHours,
                  style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
                ),
                const Gap(5),
                divider,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height*0.15,
                      width: halfsizewidth,
                      child: Text(
                        salonDetails.address,
                        style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
                      ),
                    ),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.near_me_rounded))
                  ],
                ),
                const Gap(5),
                divider,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: halfsizewidth,
                      child: Text(
                        salonDetails.contactNumber,
                        style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
                      ),
                    ),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.call)),
                  ],
                ),
              ],
            ),
          ),
          TextButton(onPressed: (){tabController.animateTo(1);},style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: onefourthwidth/6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(width: 0.5, color: AppColors.brownColorApp),
            ),
          ), child: const SizedBox(width: double.infinity,child: Center(child: Text("Next", style: TextStyle(color: AppColors.brownColorApp),))))
        ],
      ),
    );
  }
}
