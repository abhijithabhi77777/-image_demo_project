import 'package:get/get.dart';
import 'package:test1/api/api_manager.dart';
import 'package:test1/src/home/home_screen.dart';

class LoginController extends GetxController {
  final _isLoadingLogin = false.obs;
  final _isLoginSuccess = false.obs;

  Future<void> loginToTheApp(
      {required String username, required String password}) async {
    _isLoadingLogin.value = true;
    bool? isLogin =
        await APIManager.loginUser(username: username, password: password);
    if (isLogin ?? false) {
      _isLoginSuccess.value = true;
    } else {
      _isLoginSuccess.value = false;
    }
    _isLoadingLogin.value = false;
  }

  bool get isLoading => _isLoadingLogin.value;
  bool get isLoginSuccess => _isLoginSuccess.value;
}
