import 'package:flutter/material.dart';
import 'package:gym_app/domain/entities/activity.dart';
import 'package:gym_app/presentation/screens/widgets/activity/list_activity_card.dart';

class ActivitiesListView extends StatelessWidget {
  final List<Activity> activities;
  const ActivitiesListView({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (context, index) {
        final activity = activities[index];
        return ActivityCard(activity: activity);
    },);
  }
}