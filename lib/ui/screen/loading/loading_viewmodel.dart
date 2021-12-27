import 'package:demo/service/storage_service.dart';
import 'package:demo/ui/nav.dart';
import 'package:demo/ui/scaffold.dart';
import 'package:demo/ui/base.dart';

class LoadingViewModel extends BaseViewModel {
  LoadingViewModel({
    required StorageService storageService,
  }) : _storageService = storageService;

  final StorageService _storageService;

  Future<void> init() async {
    try {
      final token = await _storageService.get(StorageKey.token);
      if (token == null) {
        navigate(
          (navigator) => navigator.pushReplacementNamed(Routes.login.name),
        );
      } else {
        navigate(
          (navigator) => navigator.pushReplacementNamed(Routes.home.name),
        );
      }
    } on Exception catch (e) {
      print('Error loading user: $e');
      showErrorSnackbar('Error retrieving current user');
      navigate(
        (navigator) => navigator.pushReplacementNamed(Routes.login.name),
      );
    }
  }
}
