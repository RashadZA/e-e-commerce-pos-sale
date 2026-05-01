import 'package:e_commerce_pos_sale/core/API/Service/api_repositories.dart';
import 'package:e_commerce_pos_sale/core/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AuthMode { signIn, signUp }

class AuthController extends GetxController {

  final APIRepository apiRepository = Get.find<APIRepository>();
  final ThemeController themeController = Get.find<ThemeController>();

  final Rx<AuthMode> mode = AuthMode.signIn.obs;

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  final RxBool obscurePassword = true.obs;
  final RxBool agree = true.obs;
  final RxBool rememberMe = true.obs;
  final RxBool isSubmitting = false.obs;

  bool get isSignUp => mode.value == AuthMode.signUp;

  void setMode(AuthMode m) => mode.value = m;
  void toggleMode() =>
      mode.value = isSignUp ? AuthMode.signIn : AuthMode.signUp;

  void togglePassword() => obscurePassword.value = !obscurePassword.value;
  void toggleAgree() => agree.value = !agree.value;
  void toggleRemember() => rememberMe.value = !rememberMe.value;

  Future<void> submit() async {
    if (isSubmitting.value) return;
    isSubmitting.value = true;
    // TODO: hook up your real auth (Firebase, Supabase, REST, etc.).
    await Future.delayed(const Duration(milliseconds: 800));
    isSubmitting.value = false;
    Get.snackbar(
      isSignUp ? 'Account created' : 'Welcome back',
      'Signed in as ${emailCtrl.text.isEmpty ? "demo@m-daddy.app" : emailCtrl.text}',
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      borderRadius: 16,
    );
  }

  Future<void> signInWithGoogle() async {
    Get.snackbar('Google Sign-In', 'Hook up google_sign_in here.',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20));
  }

  Future<void> signInWithApple() async {
    Get.snackbar('Apple Sign-In', 'Hook up sign_in_with_apple here.',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20));
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.onClose();
  }
}
