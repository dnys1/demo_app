import 'dart:convert';

import 'package:demo/service/api_service.dart';
import 'package:demo/service/storage_service.dart';
import 'package:demo/ui/nav.dart';
import 'package:demo/ui/scaffold.dart';
import 'package:demo/ui/base.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseViewModel {
  LoginViewModel({
    required StorageService storageService,
    required ApiService apiService,
  })  : _apiService = apiService,
        _storageService = storageService;

  final StorageService _storageService;
  final ApiService _apiService;

  final TextEditingController _usernameController = TextEditingController();
  TextEditingController get usernameController => _usernameController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  Future<void> login() async {
    setBusy(true);
    try {
      final token = await _apiService.login(
        _usernameController.text,
        _passwordController.text,
      );
      await _storageService.put(StorageKey.token, token);
      navigate(
        (navigator) => navigator.pushReplacementNamed(Routes.home.name),
      );
      showSuccessSnackbar('Successfully logged in');
    } on Exception catch (e) {
      print('Error logging in: $e');
      showErrorSnackbar('Could not login');
    } finally {
      setBusy(false);
    }
  }
}
