import 'dart:io';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class GoalData {
  Crud crud;

  GoalData(this.crud);

  addGoal(
      String usersid,
      String waste,
      String amount,
      String procedure,
      String category,
      String deadline,
      ) async {
    var response = await crud.postData(
      AppLink.addgoal,
      {
        "usersid": usersid,
        "waste": waste,
        "amount": amount,
        "procedure": procedure,
        "category": category,
        "deadline": deadline,
        "status": "1",
      },
      {},
    );
    return response.fold((l) => l, (r) => r);
  }

  Achieved(
      String usersid,
      ) async {
    var response = await crud.postData(
      AppLink.Achieved,
      {
        "usersid": usersid,
      },
      {},
    );
    return response.fold((l) => l, (r) => r);
  }

  Achieve(
      String goalsid,
      ) async {
    var response = await crud.postData(
      AppLink.achive,
      {
        "goals_id": goalsid,
      },
      {},
    );
    return response.fold((l) => l, (r) => r);
  }

  InProgress(
      String usersid,
      ) async {
    var response = await crud.postData(
      AppLink.InProgress,
      {
        "usersid": usersid,
      },
      {},
    );
    return response.fold((l) => l, (r) => r);
  }
}
