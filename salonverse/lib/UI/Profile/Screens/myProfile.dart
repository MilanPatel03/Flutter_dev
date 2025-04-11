import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../Controller/EditProfileProfileController.dart';
import '../Controller/GetProfileController.dart';
import 'editProfile.dart';

class MyProfileScreen extends StatelessWidget {
  MyProfileScreen({super.key});

  final GetProfileController getProfileController = Get.put(GetProfileController());
  final EditProfileController editProfileController = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (getProfileController.loading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        final profile = getProfileController.oldResponse.value.data;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: profile?.profile != null && profile!.profile!.isNotEmpty
                    ? NetworkImage(profile.profile!)
                    : const AssetImage("assets/images/user.png") as ImageProvider,
              ),
              const SizedBox(height: 16),
              Text("${profile?.firstName ?? ''} ${profile?.lastName ?? ''}",
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text("${profile?.email ?? ''}", style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text("+91 ${profile?.mobileNumber ?? ''}", style: const TextStyle(fontSize: 16)),

              const SizedBox(height: 24),
              ProfileTile(label: "Gender", value: profile?.gender ?? "-"),
              ProfileTile(label: "Date of Birth", value: profile?.birthDate ?? "-"),
              ProfileTile(label: "Pincode", value: profile?.pincode ?? "-"),
              ProfileTile(label: "Address", value: profile?.address ?? "-"),

              const SizedBox(height: 32),

              ElevatedButton(
                onPressed: () {
                  Get.to(() => EditProfileScreen());
                },
                child: const Text("Edit Profile"),
              ),
            ],
          ),
        );
      }),
    );
  }
}
