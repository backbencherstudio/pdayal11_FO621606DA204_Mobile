
import 'package:go_router/go_router.dart';
import 'package:pdayal1_mobile/src/core/routes/route_constant.dart';
import 'package:pdayal1_mobile/src/feature/screens/home_screen/presentation/home_screen.dart';

import '../../feature/screens/registration_screen/presentation/registration_screen.dart';
import '../../feature/screens/today_study_task/presentation/today_study_tasks_screen.dart';
import 'build_page_with_transition.dart';

class RouteConfig {
  GoRouter goRouter = GoRouter(
    initialLocation: RouteConst.todayStudyTasksScreen,

    /// Start at the splash screen
    routes: [
      // StatefulShellRoute.indexedStack(
      //   builder: (context, state, navigationShell) =>
      //       BottomNavBar(navigationShell: navigationShell),
      //   branches: [
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: RouteConst.homeScreen,
      //           builder: (context, state) => const HomeScreenViewer(),
      //         ),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: RouteConst.jobScreen,
      //           builder: (context, state) => const JobScreen(),
      //         ),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: RouteConst.mapScreen,
      //           builder: (context, state) => const MapScreen(),
      //         ),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: RouteConst.settingScreen,
      //           builder: (context, state) => const ProfileSettingScreen(),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),

      GoRoute(
        path: RouteConst.homeScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: HomeScreen(),
          );
        },
      ),

      GoRoute(
        path: RouteConst.registrationScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideBottomToTop,
            child: RegistrationScreen(),
          );
        },
      ),

      GoRoute(
        path: RouteConst.todayStudyTasksScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: TodayStudyTasksScreen(),
          );
        },
      ),

  //     GoRoute(
  //       path: RouteConst.otpVerificationScreen,
  //       pageBuilder: (context, state) {
  //         final otpParameterModel = state.extra as OtpParameterModel;
  //         return buildPageWithTransition(
  //           context: context,
  //           state: state,
  //           transitionType: PageTransitionType.slideRightToLeft,
  //           child: OtpScreen(otpParameterModel: otpParameterModel),
  //         );
  //       },
  //     ),

  //     GoRoute(
  //       path: RouteConst.passwordResetScreen,
  //       pageBuilder: (context, state) {
  //         final otpParameterModel = state.extra as OtpParameterModel;
  //         return buildPageWithTransition(
  //           context: context,
  //           state: state,
  //           transitionType: PageTransitionType.slideRightToLeft,
  //           child: PasswordResetScreen(otpParameterModel: otpParameterModel),
  //         );
  //       },
  //     ),

  //     GoRoute(
  //       path: RouteConst.successfulScreen,
  //       pageBuilder: (context, state) {
  //         final otpParameterModel = state.extra as OtpParameterModel;
  //         return buildPageWithTransition(
  //           context: context,
  //           state: state,
  //           transitionType: PageTransitionType.slideRightToLeft,
  //           child: SuccessfulScreen(otpParameterModel: otpParameterModel),
  //         );
  //       },
  //     ),

  //     GoRoute(
  //       path: RouteConst.signUpScreen,
  //       pageBuilder: (context, state) {
  //         return buildPageWithTransition(
  //           context: context,
  //           state: state,
  //           transitionType: PageTransitionType.slideBottomToTop,
  //           child: SignUpScreen(),
  //         );
  //       },
  //     ),

  //     GoRoute(
  //       path: RouteConst.inspectionScreen,
  //       pageBuilder: (context, state) {
  //         return buildPageWithTransition(
  //           context: context,
  //           state: state,
  //           transitionType: PageTransitionType.slideRightToLeft,
  //           child: InspectionScreen(),
  //         );
  //       },
  //     ),

  //     GoRoute(
  //       path: RouteConst.inspectionReport,
  //       pageBuilder: (context, state) {
  //         return buildPageWithTransition(
  //           context: context,
  //           state: state,
  //           transitionType: PageTransitionType.slideRightToLeft,
  //           child: InspectionReport(),
  //         );
  //       },
  //     ),

  //     GoRoute(
  //       path: RouteConst.notification,
  //       pageBuilder: (context, state) {
  //         return buildPageWithTransition(
  //           context: context,
  //           state: state,
  //           transitionType: PageTransitionType.slideRightToLeft,
  //           child: NotificationScreen(),
  //         );
  //       },
  //     ),

  //     GoRoute(
  //       path: RouteConst.editProfileScreen,
  //       pageBuilder: (context, state) {
  //         return buildPageWithTransition(
  //           context: context,
  //           state: state,
  //           transitionType: PageTransitionType.slideRightToLeft,
  //           child: EditProfileScreen(),
  //         );
  //       },
  //     ),

  //     GoRoute(
  //       path: RouteConst.changePasswordScreen,
  //       pageBuilder: (context, state) {
  //         return buildPageWithTransition(
  //           context: context,
  //           state: state,
  //           transitionType: PageTransitionType.slideRightToLeft,
  //           child: ChangePasswordScreen(),
  //         );
  //       },
  //     ),

  //     GoRoute(
  //       path: RouteConst.helpScreen,
  //       pageBuilder: (context, state) {
  //         return buildPageWithTransition(
  //           context: context,
  //           state: state,
  //           transitionType: PageTransitionType.slideRightToLeft,
  //           child: HelpScreen(),
  //         );
  //       },
  //     ),
    ],
  );
}
