import 'dart:io';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class ProfileData {
  Crud crud;

  ProfileData(this.crud);

  upcoming() async {
    var response = await crud.getData(AppLink.upcoming, {});
    return response.fold((l) => l, (r) => r);
  }
}
