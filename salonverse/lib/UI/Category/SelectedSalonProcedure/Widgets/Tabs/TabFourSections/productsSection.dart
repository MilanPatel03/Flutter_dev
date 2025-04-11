import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:salonverse/Commons/CommonColors.dart';
import 'package:salonverse/Data/Services/SalonServices/ServiceController.dart';
import 'package:salonverse/UI/Bookings/AppointmentProcess/bookAppointment.dart';
import 'package:salonverse/UI/Category/ServiceCategoryByGender/Model/SalonDetailsModel.dart';

class ProductSection extends StatefulWidget {
  final SalonDetails salonDetails;
  final TabController tabController;
  const ProductSection({super.key, required this.salonDetails, required this.tabController});

  @override
  State<ProductSection> createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {
  final controller = Get.find<ServiceController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final oneFourthWidth = size.width / 4;

    final products = widget.salonDetails.products;
    final prices = widget.salonDetails.productsPrices;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select a Package',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Gap(20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                final price = prices[index];

                return Obx(() {
                  final isSelected = controller.selectedProductName.value == product;

                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: isSelected ? AppColors.brownAppBarFaded : Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      leading: const Icon(Icons.spa, color: Colors.brown),
                      title: Text(product),
                      subtitle: Text(price),
                      trailing: isSelected
                          ? const Icon(Icons.check_circle, color: AppColors.brownColorApp)
                          : const Icon(Icons.radio_button_off, color: Colors.grey),
                      onTap: () {
                        controller.selectProduct(product, price);
                      },
                    ),
                  );
                });
              },
            ),
          ],
        ),

        const Gap(10),
        Obx(() => TextButton(
          onPressed: controller.selectedProductName.value.isEmpty
              ? null
              : () {
            Get.to(Bookappointment(salonDetails: widget.salonDetails,));
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: oneFourthWidth / 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(width: 0.5, color: AppColors.brownColorApp),
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
        ))

      ],
    );
  }
}
