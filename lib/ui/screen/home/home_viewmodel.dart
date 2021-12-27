import 'package:demo/model/user.dart';
import 'package:demo/service/api_service.dart';
import 'package:demo/service/storage_service.dart';
import 'package:demo/ui/nav.dart';
import 'package:demo/ui/scaffold.dart';
import 'package:demo/ui/base.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel({
    required StorageService storageService,
    required ApiService apiService,
  })  : _storageService = storageService,
        _apiService = apiService {
    _init();
  }

  final StorageService _storageService;
  final ApiService _apiService;

  late User _user;
  User get user => _user;

  Future<void> _init() async {
    setBusy(true);
    try {
      final token = await _storageService.get(StorageKey.token);
      if (token == null) {
        throw Exception('User not logged in');
      }
      _user = await _apiService.userInfo(token);
    } on Exception catch (e) {
      print('Error retrieving user: $e');
      showErrorSnackbar('User not logged in');
      navigate(
        (navigator) => navigator.pushReplacementNamed(Routes.login.name),
      );
    } finally {
      setBusy(false);
    }
  }

  Future<void> logout() async {
    setBusy(true);
    try {
      await _storageService.delete(StorageKey.token);
    } on Exception catch (e) {
      print('Error logging out: $e');
    } finally {
      navigate(
        (navigator) => navigator.pushReplacementNamed(Routes.login.name),
      );
      setBusy(false);
    }
  }
}
