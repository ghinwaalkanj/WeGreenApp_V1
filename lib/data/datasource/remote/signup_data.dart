import 'dart:io';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class SignUpData {
  Crud crud;

  SignUpData(this.crud);

  signup(
      String name,
      String email,
      String password,
      ) async {
    var response = await crud.postData(
      AppLink.signUp,
      {
        "username": name,
        "email": email,
        "password": password,
        "phone": email,
      },
      {},
    );
    return response.fold((l) => l, (r) => r);
  }
}
