import 'dart:io';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class MeetData {
  Crud crud;

  MeetData(this.crud);

  meets() async {
    var response = await crud.getData(AppLink.meet, {});
    return response.fold((l) => l, (r) => r);
  }


  addMeet(
      String usersid,
      String title,
      String tagline,
      String date,
      String content,
      {File? file}
      ) async {
    Map<String, dynamic> postData = {
      "usersid": usersid,
      "title": title,
      "tagline": tagline,
      "date": date,
      "content": content,
    };

    var response;
    if (file != null) {
      response = await crud.postFileAndData(
        AppLink.addMeet,
        postData,
        {},
        file,
      );
    } else {
      response = await crud.postData(
        AppLink.addMeet,
        postData,
        {},
      );
    }

    return response.fold((l) => l, (r) => r);
  }


}
