import 'dart:io';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class SignInData {
  Crud crud;

  SignInData(this.crud);

  signin(
      String email,
      String password,
      ) async {
    var response = await crud.postData(
      AppLink.signIn,
      {
        "email": email,
        "password": password,
      },
      {},
    );
    return response.fold((l) => l, (r) => r);
  }
}
