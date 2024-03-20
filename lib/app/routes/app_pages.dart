import 'package:get/get.dart';
import '../modules/dashboard/home/services/bindings/services_binding.dart';
import '../modules/dashboard/home/services/views/services_view.dart';
import '../modules/new_password/bindings/new_password_binding.dart';
import '../modules/location_select/bindings/location_select_binding.dart';
import '../modules/location_select/views/location_select_view.dart';
import '../modules/new_password/views/new_password_view.dart';
import '../modules/signup/bindings/sign_up_binding.dart';
import '../modules/signup/views/sign_up_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/calender/bindings/calender_binding.dart';
import '../modules/dashboard/calender/views/calender_view.dart';
import '../modules/dashboard/home/bindings/home_binding.dart';
import '../modules/dashboard/home/views/home_view.dart';
import '../modules/dashboard/notification/bindings/notification_binding.dart';
import '../modules/dashboard/notification/views/notification_view.dart';
import '../modules/dashboard/setting/bindings/setting_binding.dart';
import '../modules/dashboard/setting/views/setting_view.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/intro/bindings/intro_binding.dart';
import '../modules/intro/views/intro_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/agreement/bindings/agreement_binding.dart';
import '../modules/agreement/views/agreement_view.dart';
import '../modules/verification/bindings/verification_binding.dart';
import '../modules/verification/views/verification_view.dart';
import '../splash/bindings/splash_binding.dart';
import '../splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.SPLASH,
      transition: Transition.leftToRight,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.INTRO,
      page: () => const IntroductionView(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.LOCATION_SELECTION,
      page: () => const LocationSelectView(),
      binding: LocationSelectBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.AGREEMENT,
      page: () => const AgreementView(),
      binding: AgreementBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.VERIFICATION,
      page: () => const VerificationView(),
      binding: VerificationBinding(),
    ),
    GetPage(
      name: _Paths.NEW_PASSWORD,
      page: () => const NewPasswordView(),
      binding: NewPasswordBinding(),
    ),
    GetPage(
      name: _Paths.SERVICES,
      page: () => const ServicesView(),
      binding: ServicesBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
      children: [
        GetPage(
          name: _Paths.CALENDER,
          page: () => const CalenderView(),
          binding: CalenderBinding(),
        ),
        GetPage(
          name: _Paths.NOTIFICATION,
          page: () => const NotificationView(),
          binding: NotificationBinding(),
        ),
        GetPage(
          name: _Paths.SETTING,
          page: () => const SettingView(),
          binding: SettingBinding(),
        ),
      ],
    ),
  ];
}
