import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/config/constants/theme_constants.dart';
import 'package:gym_app/presentation/providers/activity/acitivity_providers.dart';
import 'package:gym_app/presentation/providers/user/auth_provider.dart';
import 'package:gym_app/presentation/screens/widgets/activity/activity_grid_view.dart';

class UserActivitiesView extends ConsumerWidget {
  const UserActivitiesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).user;
    final activities = ref.watch(userActivitiesProvider(user?.id ?? 0));
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: primaryVerticalPadding, horizontal: primaryHorizontalPadding),
        child: ActivityGridView(activities: activities),
      )
    );
  }
}