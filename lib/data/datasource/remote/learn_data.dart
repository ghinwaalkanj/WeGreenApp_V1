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
}
