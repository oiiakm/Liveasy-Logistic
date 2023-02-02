import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:liveasylogistic/pages/language.dart';
import 'package:liveasylogistic/pages/mobile.dart';
import 'package:liveasylogistic/pages/otp.dart';
import 'package:liveasylogistic/pages/profile.dart';
import 'package:liveasylogistic/routes/name.dart';

class MyAppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
          name: RouteName.languageRouteName,
          path: '/',
          pageBuilder: ((context, state) {
            return const MaterialPage(child: LanguagePage());
          })),
      GoRoute(
          name: RouteName.mobileRouteName,
          path: '/mobile',
          pageBuilder: ((context, state) {
            return const MaterialPage(child: MobilePage());
          })),
      GoRoute(
          name: RouteName.profileRouteName,
          path: '/profile',
          pageBuilder: ((context, state) {
            return const MaterialPage(child: ProfilePage());
          })),
      GoRoute(
          name: RouteName.otpRouteName,
          path: '/otp',
          pageBuilder: ((context, state) {
            return const MaterialPage(child: OTPPage());
          })),
    ],
  );
}
