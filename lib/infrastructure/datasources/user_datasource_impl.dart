

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gym_app/domain/datasources/user_datasource.dart';
import 'package:gym_app/domain/entities/user.dart';
import 'package:gym_app/infrastructure/errors/custom_error.dart';
import 'package:gym_app/infrastructure/mappers/user_mapper.dart';
import 'package:gym_app/infrastructure/models/user_model.dart';

class UserDatasourceImpl implements UserDatasource {
  @override
  Future<User> login() async {
    try {
      final resp = await rootBundle.loadString('assets/response_calls/list_members.json');
      final List<dynamic> data = json.decode(resp);
      final List<UserModel> usersModel = data.map((u) => UserModel.fromJson(u)).toList();
      return UserMapper.modelToEntity(usersModel.first);
    } catch (e) {
      throw CustomError(message: 'error al obtener usuario');
    }
  }
}