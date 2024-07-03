import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/core.dart';
import '../../../di_container.dart';
import '../abstractions/auth_data_source.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final BaseDio dioClient;

  AuthDataSourceImpl({required this.dioClient});
  @override
  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    final response = await dioClient.post(
      '/Auth/Login',
      data: {
        'userName': username,
        'password': password,
      },
    );
    log(
      '${response.data}:::::::::login',
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> register({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String phone,
    required String password,
  }) async {
    final response = await dioClient.post(
      "/Patient",
      data: {
        'firstName': firstName,
        'lastName': lastName,
        'userName': username,
        'email': email,
        'phoneNumber': phone,
        'password': password,
      },
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> changePassword(
      {required String currentPassword, required String newPassword}) async {
    try {
      final response = await dioClient.put(
        '/Auth/ChangePassword',
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization":
                "Bearer ${preferences.getString(SharedKeys.accessToken)}",
          },
        ),
        data: {
          'currentPassword': currentPassword,
          'newPassword': newPassword,
          'userId': preferences.getString(SharedKeys.userId),
        },
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
