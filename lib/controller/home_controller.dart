import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_shopping/services/api_service.dart';

import '../model/product_model.dart';
import '../utils/constants.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var tabPosition = 0.obs;
  var productList = List<Data>.empty(growable: true);
  var mensFashion = List<Data>.empty(growable: true);
  var womensFashion = List<Data>.empty(growable: true);
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    // TODO: implement onInit
    getProduct();
    super.onInit();
  }

  Future<void> updatetabPosition(int value) async {
    tabPosition.value = value;
    scrollController.animateTo(0,
        duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
    update();
  }

  void getProduct() async {
    isLoading.value = true;
    await ApiServices().getApi(urlGetProducts).then((value) {
      ProductsModel productModel = ProductsModel.fromJson(value);
      productModel.data!.forEach((element) {
        productList.add(element);
      });
      isLoading.value = false;
    }).catchError((onError) {
      // Get.snackbar("Oops", "Something went wrong. Please try again",
      //     backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
      throw onError;
    });
    update();
  }
}
