import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonverse/Commons/CommonColors.dart';
import 'package:salonverse/UI/Bookings/AppointmentProcess/bookingReview.dart';
import 'package:salonverse/UI/Category/ServiceCategoryByGender/Model/SalonDetailsModel.dart';

import '../../../Data/Services/SalonServices/ServiceController.dart';

class Bookappointment extends StatefulWidget {
  final SalonDetails salonDetails;
  const Bookappointment({super.key, required this.salonDetails});

  @override
  State<Bookappointment> createState() => _BookappointmentState();
}

class _BookappointmentState extends State<Bookappointment> {

  final controller = Get.find<ServiceController>();
  DateTime? selectedDate;

  Future<void> _selectDateForAppointment() async {
    final DateTime? pickedDate = await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2030), initialDate: DateTime.now());

    if(pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
      controller.selectDate(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {

    final size = Size.square(MediaQuery.of(context).size.shortestSide);
    final halfsizewidth = size.width / 2;
    final onefourthwidth = size.width / 4;
    final List<String> timeSlotsforThisSalon = widget.salonDetails.timeSlots;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.brownColorApp,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          padding: const EdgeInsets.only(top: 50, left: 8, right: 8),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: AppColors.appbarTextColor,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Book Appointment",
                  style: GoogleFonts.kavoon(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.appbarTextColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(15),
              Container(
                width: Get.size.width,
                height: Get.size.height*0.05,
                //margin: EdgeInsets.symmetric(horizontal: Get.size.width*0.05),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10),
                  //border: Border.all(color: selectedDate != null ? Colors.green : AppColors.brownColorApp.withOpacity(0.4),),
                ),
                child: Center(
                  child: Text(
                    selectedDate != null
                        ?
                    " ${selectedDate!.day} / ${selectedDate!.month} / ${selectedDate!.year}"
                        :
                    "No Date Selected",
                    style: TextStyle(
                        color: selectedDate != null ? Colors.green : Colors.grey,
                    ),
                  ),
                ),
              ),

              const Gap(15),
              OutlinedButton(
                onPressed: _selectDateForAppointment,
                style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(
                  color: Colors.grey, // border color
                ),

                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),),
                foregroundColor: Colors.grey,
                ),
                child: const Text("Select Date"),
              ),

              const Gap(35),
              Text("Available Time Slots", style: GoogleFonts.kavoon(
                fontWeight: FontWeight.bold,
                color: AppColors.brownColorApp,),),

              const Gap(10),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisSpacing: 6,
                  crossAxisCount: 3,
                  childAspectRatio: 2.9,
                  mainAxisSpacing: 15,
                  shrinkWrap: true,
                  children: List.generate(
                      timeSlotsforThisSalon.length, (index){
                    final timeSlot = timeSlotsforThisSalon[index];
                    return InkWell(
                      onTap: (){
                        controller.selectTimeSlot(timeSlot); // NEW
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: controller.selectedTimeSlot.value == timeSlot
                                ? Colors.green // highlight selected
                                : AppColors.brownColorApp,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            timeSlot,
                            style: TextStyle(
                              color:
                              controller.selectedTimeSlot.value == timeSlot
                                  ? Colors.green
                                  : AppColors.brownColorApp,
                            ),
                          ),
                        ),

                      ),
                    );
                  }
                  ),
                ),
              ),
            ],
          ),

          const Gap(10),

          TextButton(
            onPressed: () {
              Get.to(() => BookingReviewScreen());
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
                  "Book Now",
                  style: TextStyle(color: AppColors.brownColorApp),
                ),
              ),
            ),
          ),

          const Gap(5),
        ],
      ),
    );
  }
}
