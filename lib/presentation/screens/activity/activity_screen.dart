import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/config/constants/theme_constants.dart';
import 'package:gym_app/config/utils/popups.dart';
import 'package:gym_app/presentation/providers/activity/acitivity_providers.dart';
import 'package:gym_app/presentation/providers/activity/activity_info_provider.dart';
import 'package:gym_app/presentation/providers/trainer/trainer_info_provider.dart';
import 'package:gym_app/presentation/providers/user/auth_provider.dart';

class ActivityScreen extends ConsumerStatefulWidget {
  final int activityID;
  final int trainerID;
  const ActivityScreen({super.key, required this.activityID, required this.trainerID});

  @override
  ConsumerState<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends ConsumerState<ActivityScreen> {

  @override
  void initState() {
    super.initState();
    ref.read(activityInfoProvider.notifier).loadActivity(widget.activityID);
    ref.read(trainerInfoProvider.notifier).loadTrainer(widget.trainerID);
  }

@override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final activity = ref.watch(activityInfoProvider)[widget.activityID];
    final trainer = ref.watch(trainerInfoProvider)[widget.trainerID];
    final user = ref.watch(authProvider).user;
    final titleLarge = Theme.of(context).textTheme.titleLarge?.copyWith(color: colors.onPrimary, fontWeight: FontWeight.bold);
    final titleMedium = Theme.of(context).textTheme.titleMedium?.copyWith(color: colors.onPrimary, fontWeight: FontWeight.bold);
    final bodyMedium = Theme.of(context).textTheme.bodyMedium?.copyWith(color: colors.onPrimary);
    final bodySmall = Theme.of(context).textTheme.bodySmall?.copyWith(color: colors.onPrimary);
    final suscribed = activity?.users.contains(user?.id) ?? false;
    if (activity == null){
      return Scaffold(
        backgroundColor: colors.primary,
        body: Center(child: CircularProgressIndicator(strokeWidth: 2, color: colors.onPrimary,)),
      );
    }
    return Scaffold(
      backgroundColor: colors.primary,
      appBar: AppBar(
        backgroundColor: colors.primary,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_back_ios_new_rounded, color: colors.onPrimary,)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: primaryHorizontalPadding, vertical: primaryVerticalPadding),
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(activity.imageURL, fit: BoxFit.fill,)),
              
              Text(activity.name, style: titleLarge,),

              Row(
              spacing: 8,
              children: [
              Text(activity.daySchedule,style: bodyMedium,),
      
              Text(activity.hourSchedule,style: bodyMedium,),
              ],
            ),

            Text(activity.description,style: bodySmall,),
        
              Text('Entrenador: ', style: titleLarge,),
        
              if(trainer != null)
              Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${trainer.firstName} ${trainer.lastName}', style: titleMedium,),
                  Text(trainer.resume,style: bodySmall,)
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        color: colors.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FilledButton(
              style: FilledButton.styleFrom(
                shape: BeveledRectangleBorder(
                  side: BorderSide(
                    color: colors.onPrimary,
                    width: 1.5
                  ),
                  borderRadius: BorderRadius.circular(2)
                )
              ),
              onPressed: suscribed 
              ? () => Popups.showCustomAlertDialog(
                context, content: '¿Desea cancelar la suscripción?', confirmText: 'confirmar',
                confirmAction: () {
                  try {
                    ref.read(activitiesProvider.notifier).deleteSuscription(activity.id, user?.id ?? 0);
                  } finally{
                    context.pop();
                    ref.read(activityInfoProvider.notifier).loadActivity(widget.activityID);
                  }
                },)
              : () {
                  final hasConflict = ref.read(activitiesProvider.notifier).checkConflict(activity.id, user?.id ?? 0);
                  if (!hasConflict){
                    Popups.showCustomAlertDialog(context, content: 'Confirmar suscripción', confirmText: 'confirmar',
                    confirmAction: () {
                      try {
                          ref.read(activitiesProvider.notifier).addSuscription(activity.id, user?.id ?? 0);
                        } finally{
                          context.pop();
                          ref.read(activityInfoProvider.notifier).loadActivity(widget.activityID);
                        }
                    },);
                  }
              } ,
               child: Text(suscribed ? 'Cancelar suscripción' : 'Suscribirse',
               style: bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
               ),))
          ],
        ),
      ),
    );
  }
}