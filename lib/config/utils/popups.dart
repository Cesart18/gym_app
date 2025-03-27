

import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/presentation/screens/widgets/custom_toast.dart';

class Popups {

  static void showToast(BuildContext context, String message){
    FToast fToast = FToast();
    fToast.init(context);

    fToast.removeCustomToast();

    fToast.showToast(
      child: AnimatedToast(child: CustomToast(message: message)),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

  static Flushbar<dynamic>? _activeFlushbar;

  static void showErrorFlush(BuildContext context, String message){
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

     _activeFlushbar?.dismiss();

    _activeFlushbar = Flushbar(
      messageText: Text(message ,style: textStyle.bodyMedium?.copyWith(fontWeight: FontWeight.w500),),
      flushbarPosition: FlushbarPosition.BOTTOM,
      reverseAnimationCurve: Curves.decelerate,
      backgroundColor: colors.surface,
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      isDismissible: true,
      duration: const Duration(seconds: 10),
      borderColor: colors.tertiary,
      padding: const EdgeInsets.all(32),
      borderRadius: BorderRadius.circular(4),
      icon: Icon(Icons.error,color: colors.error, size: 50,),
      shouldIconPulse: false,
      mainButton: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.clear)),
      boxShadows: [
            BoxShadow(
              color: colors.onSurface.withValues(alpha: 0.07),
              blurRadius: 3,
                spreadRadius: 1,
              offset: const Offset(-1, -1)
            ),
            BoxShadow(
              color: colors.onSurface.withValues(alpha: 0.07),
              blurRadius: 10,
                spreadRadius: 2,
              offset: const Offset(2, 2)
            ),
          ],
    );
    _activeFlushbar?.show(context);
  }

  static void showCustomAlertDialog(BuildContext context, {required String content, required String confirmText, Function()? confirmAction}){
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;
    showDialog( barrierDismissible: false,
        barrierColor: colors.onSurface.withValues(alpha: 0.2),
        context: context, builder: (context) {
          return AlertDialog(
          actionsPadding: const EdgeInsets.all(8),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4)
          ),
          content: Text(content,
          style: textStyle.bodyMedium,
          textAlign: TextAlign.center,),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            ActionChip.elevated(label: Text('Cancelar',
            style: textStyle.bodyMedium,),
            onPressed: (){
              context.pop();
            },),
            ActionChip.elevated(label: Text(confirmText,
            style: textStyle.bodyMedium?.copyWith(
              color: colors.surface,
              fontWeight: FontWeight.bold
            ),),
            color: WidgetStatePropertyAll(colors.onSurface),
            onPressed: confirmAction),
          ],
          );
        },);
  }

}