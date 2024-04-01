import 'dart:io';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  upcoming(
      String usersid,
      ) async {
    var response = await crud.postData(
      AppLink.upcoming,
      {
        "usersid": usersid,
      },
      {},
    );
    return response.fold((l) => l, (r) => r);
  }
}
