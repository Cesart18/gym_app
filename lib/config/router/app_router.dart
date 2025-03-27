


import 'package:go_router/go_router.dart';
import 'package:gym_app/presentation/screens/activity/activity_screen.dart';
import 'package:gym_app/presentation/screens/activity/gym_activities_view.dart';
import 'package:gym_app/presentation/screens/activity/user_activities_view.dart';
import 'package:gym_app/presentation/screens/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/activities',
  routes: [

    StatefulShellRoute.indexedStack(
      
      builder: (context, state, navigationShell) {
        return HomeScreen(navigationShell: navigationShell,);
      },

      branches: [
      StatefulShellBranch(routes: [
        GoRoute(path: '/activities',
        builder: (context, state) => const GymActivitiesView(),)
      ]),

      StatefulShellBranch(routes: [
        GoRoute(path: '/user-activities',
        builder: (context, state) => const UserActivitiesView(),)
      ]),
    ]),


    GoRoute(path: '/activity/:id',
    builder: (context, state) {
      
      final activityStringID = state.pathParameters['id'] as String;
      final activityID = int.parse(activityStringID);

      final extra = state.extra as Map<String, dynamic>;
      final trainerID = extra['trainer_id'];

      return ActivityScreen(activityID: activityID, trainerID: trainerID,);
    },)
  ]);