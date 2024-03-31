import 'dart:io';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class LearnData {
  Crud crud;

  LearnData(this.crud);

  posts() async {
    var response = await crud.getData(AppLink.posts, {});
    return response.fold((l) => l, (r) => r);
  }

  myposts(
      String usersid,
      ) async {
    var response = await crud.postData(
      AppLink.myposts,
      {
        "usersid": usersid,
      },
      {},
    );
    return response.fold((l) => l, (r) => r);
  }

  addPost(
      String usersid,
      String title,
      String tagline,
      String addtags,
      String content,
      {File? file}
      ) async {
    Map<String, dynamic> postData = {
      "usersid": usersid,
      "title": title,
      "tagline": tagline,
      "addtags": addtags,
      "content": content,
    };

    var response;
    if (file != null) {
      response = await crud.postFileAndData(
        AppLink.addPost,
        postData,
        {},
        file,
      );
    } else {
      response = await crud.postData(
        AppLink.addPost,
        postData,
        {},
      );
    }

    return response.fold((l) => l, (r) => r);
  }


}
