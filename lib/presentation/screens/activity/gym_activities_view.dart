import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/config/constants/theme_constants.dart';
import 'package:gym_app/presentation/providers/activity/acitivity_providers.dart';
import 'package:gym_app/presentation/screens/widgets/activity/activities_list_view.dart';

class GymActivitiesView extends ConsumerWidget {
  const GymActivitiesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activities = ref.watch(activitiesProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: primaryVerticalPadding, horizontal: primaryHorizontalPadding),
        child: ActivitiesListView(activities: activities),
      )
      );
  }
}
