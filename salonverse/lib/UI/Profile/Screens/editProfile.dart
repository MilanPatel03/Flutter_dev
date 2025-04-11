import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../Controller/EditProfileProfileController.dart';

class ProfileTile extends StatelessWidget {
  final String label;
  final String value;

  const ProfileTile({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: Text("$label:", style: const TextStyle(fontWeight: FontWeight.w600))),
          Expanded(flex: 3, child: Text(value)),
        ],
      ),
    );
  }
}

class EditProfileScreen extends StatelessWidget {
  final EditProfileController controller = Get.find<EditProfileController>();

  EditProfileScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),
      body: Obx(() => controller.loading.value
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.firstName,
                decoration: const InputDecoration(labelText: 'First Name'),
              ),
              TextFormField(
                controller: controller.lastName,
                decoration: const InputDecoration(labelText: 'Last Name'),
              ),
              TextFormField(
                controller: controller.mobileNumber,
                decoration: const InputDecoration(labelText: 'Mobile Number'),
              ),
              TextFormField(
                controller: controller.email,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: controller.birthDate,
                decoration: const InputDecoration(labelText: 'Birth Date'),
              ),
              TextFormField(
                controller: controller.pinCode,
                decoration: const InputDecoration(labelText: 'Pincode'),
              ),
              TextFormField(
                controller: controller.address,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  // Dummy file just for testing
                  File profile = File("/path/to/your/profile.jpg");
                  await controller.editProfileController(
                    controller.firstName.text,
                    controller.lastName.text,
                    controller.mobileNumber.text,
                    controller.email.text,
                    controller.gender ?? '',
                    controller.birthDate.text,
                    controller.pinCode.text,
                    controller.address.text,
                    profile,
                  );
                  Get.back();
                },
                child: const Text("Save Changes"),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
