import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/domain/entities/activity.dart';

class GridActivityCard extends StatelessWidget {
  final Activity activity;
  const GridActivityCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    final title = Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold);
    final body = Theme.of(context).textTheme.bodySmall;
    return GestureDetector(
      onTap: () => context.push('/activity/${activity.id}',
      extra: {
        'trainer_id': activity.trainerID
      }),
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            width: 1.5
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            Text(activity.name,
            style: title,),
            Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(activity.daySchedule,style: body,),
      
              Text(activity.hourSchedule,style: body,),
              ],
            )
          ],
        ),
      ),
    );
  }
}