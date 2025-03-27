import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/domain/entities/activity.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  const ActivityCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => context.push('/activity/${activity.id}',
      extra: {
        'trainer_id': activity.trainerID
      }),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(6)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4)
              ),
              child: Image.asset(activity.imageURL, fit: BoxFit.cover,)),
      
            Text(activity.name,
            style: textStyle.titleMedium?.copyWith(
              fontWeight: FontWeight.bold
            ),),
      
            Row(
              spacing: 12,
              children: [
                Text(activity.daySchedule),
                Text(activity.hourSchedule),
              ],
            ),
      
            Text(activity.description,
            style: textStyle.bodyMedium,),
          ],
        ),
      ),
    );
  }
}