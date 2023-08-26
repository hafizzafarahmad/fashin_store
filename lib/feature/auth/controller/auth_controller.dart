import 'package:get/get.dart';
import 'package:fashion_store/feature/auth/presentation/login_page.dart';
import '../../../../core/route/route_constant.dart';

class AuthController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    checkUserSession();
  }


  void checkUserSession() async {
    Future.delayed(const Duration(seconds: 3), () => Get.to(const LoginPage()));
  }
}
