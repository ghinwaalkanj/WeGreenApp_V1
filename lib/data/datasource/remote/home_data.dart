import 'dart:io';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  upcoming() async {
    var response = await crud.getData(AppLink.upcoming, {});
    return response.fold((l) => l, (r) => r);
  }
}
