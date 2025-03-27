import 'package:flutter/material.dart';
import 'package:gym_app/domain/entities/activity.dart';
import 'package:gym_app/presentation/screens/widgets/activity/grid_activity_card.dart';

class ActivityGridView extends StatelessWidget {
  final List<Activity> activities;
  const ActivityGridView({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: activities.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8), itemBuilder: (context, index) {
        final activity = activities[index];
        return GridActivityCard(activity: activity,);
      },);
  }
}