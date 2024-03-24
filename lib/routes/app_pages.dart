import 'package:fitness_app/page/challenge_page.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPage {
  static final routes = [
    GetPage(
      name: AppRoutes.challengePage,
      page: () => const ChallengePage(),
    ),
  ];
}
