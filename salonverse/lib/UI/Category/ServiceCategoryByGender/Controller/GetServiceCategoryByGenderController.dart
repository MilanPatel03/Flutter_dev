
import 'package:get/get.dart';
import 'package:salonverse/Data/Services/ApiServices/ApiServices.dart';
import 'package:salonverse/UI/Category/ServiceCategoryByGender/Model/GetServiceCategoryByGenderModel.dart';

class GetServiceCategoryByGenderController extends GetxController {

  var loading = false.obs;
  var oldResponse =GetServicesCategoryByGenderModel().obs;

  RxList<Data> allCategoriesInList = <Data>[].obs;

  Future<void> getServiceCategoryController(String? genderType) async {

    try{
      loading(true);
      final newResponse = await ApiServices().getServicesCategory(genderType);

      if(newResponse.responseCode == 1){
        oldResponse.value = newResponse;
        allCategoriesInList.clear();
        allCategoriesInList.addAll(newResponse.data ?? []);
        if (allCategoriesInList.isNotEmpty) {
          print("id: ${allCategoriesInList[0].id}");
        }
      } else {
        oldResponse.value = newResponse;
        Get.snackbar("Services Category", newResponse.message ?? "Unknown error");
      }

    } catch(e) {
      print("Error fetching categories: $e");
      oldResponse.value = GetServicesCategoryByGenderModel(
          responseCode: 0,
          message: "Failed to load: $e",
          data: [],
      );
      Get.snackbar("Error", "Failed to load categories: $e");
    } finally{
      loading(false);
    }
  }
}