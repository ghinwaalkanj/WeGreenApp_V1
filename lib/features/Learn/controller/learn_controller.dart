import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/features/Learn/screens/learn_screen.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/services/handingdatacontroller.dart';
import '../../../core/services/services.dart';
import 'dart:io';
import '../../../data/datasource/remote/learn_data.dart';

abstract class LearnController extends GetxController {}

class LearnControllerImp extends LearnController {
  LearnData learnData = LearnData(Get.find());
  TextEditingController title = TextEditingController();
  TextEditingController tagline = TextEditingController();
  TextEditingController addtags = TextEditingController();
  TextEditingController content = TextEditingController();
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> form = GlobalKey<FormState>();
  File? Imagefile;
  RxInt cat = 1.obs;
  List posts = [];
  List myposts = [];

  void pickImage(ImageSource source) async {
    XFile? image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      Imagefile = File(image.path);
      print(Imagefile);
      update();
    } else {
      Get.defaultDialog(middleText: 'يجب اختيار صورة ');
    }
  }



  void updatecat(int num){
    cat.value = num;
    update();
  }

  getPosts() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await learnData.posts();
    if (StatusRequest.success == handlingData(response)) {
      Map mapData = {};
      mapData.addAll(response);
      if (mapData["status"] == true) {
        posts = [];
        posts = mapData['data'];
        statusRequest = StatusRequest.success;
        update();
        return true;
      } else {
        posts = [];
        statusRequest = StatusRequest.success;
        update();
      }
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return Get.snackbar("فشل", "you are not online please check on it");
    } else if (statusRequest == StatusRequest.serverfailure) {}
  }

  myPosts() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await learnData.myposts(
      '${myServices.sharedPreferences.getInt("users_id")}',
    );
    if (StatusRequest.success == handlingData(response)) {
      Map mapData = {};
      mapData.addAll(response);
      if (mapData["status"] == true) {
        myposts = [];
        myposts = mapData['data'];
        statusRequest = StatusRequest.success;
        update();
        return true;
      } else {
        myposts = [];
        statusRequest = StatusRequest.success;
        update();
      }
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return Get.snackbar("فشل", "you are not online please check on it");
    } else if (statusRequest == StatusRequest.serverfailure) {}
  }


  addPost(BuildContext context) async {
    statusRequest = StatusRequest.loading;
    update();
    if (form.currentState!.validate()) {
      var response = await learnData.addPost(
        '${myServices.sharedPreferences.getInt("users_id")}',
        title.text,
        tagline.text,
        addtags.text,
        content.text,
        file: Imagefile,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == true) {
          statusRequest = StatusRequest.success;
          update();
          BuildContext context = Get.context!;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Post successful ",
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 9.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DMSans',
                    ),
                  ),
                ],
              ),
              duration: Duration(seconds: 2),
            ),
          );

          Get.offAll(() => LearnScreen());
          getPosts();
        } else if (response['status'] == false) {
          statusRequest = StatusRequest.success;
          update();
          BuildContext context = Get.context!;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Post Failed",
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 9.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ElMessiri',
                    ),
                  ),
                ],
              ),
              duration: Duration(seconds: 2),
            ),
          );
          statusRequest = StatusRequest.none;
          update();
        }
      } else if (statusRequest != StatusRequest.success) {
        statusRequest = handlingData(response);
        if (StatusRequest.failure == statusRequest) {
          if (response['status'] == false) {
            statusRequest = StatusRequest.none;
            update();
          }
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    getPosts();
    myPosts();
    super.onInit();
  }

  @override
  void dispose() {
    getPosts();
    myPosts();
    super.dispose();
  }
}
