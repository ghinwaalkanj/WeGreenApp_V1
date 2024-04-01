import 'dart:io';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class CalenderData {
  Crud crud;

  CalenderData(this.crud);

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

  addDate(
      String usersid,
      String title,
      String type,
      String date,
      String time,
      ) async {
    var response = await crud.postData(
      AppLink.adddate,
      {
        "usersid": usersid,
        "title": title,
        "type": type,
        "date": date,
        "time": time,
      },
      {},
    );
    return response.fold((l) => l, (r) => r);
  }
}
