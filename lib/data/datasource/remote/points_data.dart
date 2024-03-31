import 'dart:io';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class PointsData {
  Crud crud;

  PointsData(this.crud);

  catigory() async {
    var response = await crud.getData(AppLink.catigory, {});
    return response.fold((l) => l, (r) => r);
  }

  points(
      String categoryid,
      ) async {
    var response = await crud.postData(
      AppLink.points,
      {
        "categoryid": categoryid,
      },
      {},
    );
    return response.fold((l) => l, (r) => r);
  }
}
