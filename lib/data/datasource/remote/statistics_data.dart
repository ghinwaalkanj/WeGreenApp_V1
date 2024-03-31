import 'dart:io';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class StatisticsData {
  Crud crud;

  StatisticsData(this.crud);


  Statistics(
      String usersid,
      ) async {
    var response = await crud.postData(
      AppLink.statistics,
      {
        "usersid": usersid,
      },
      {},
    );
    return response.fold((l) => l, (r) => r);
  }
}
