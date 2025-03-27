import 'package:flutter/material.dart';


class AnimatedToast extends StatefulWidget {
  final Widget child;
  final Duration visibleDuration;
  final Duration animationDuration;

  const AnimatedToast({
    super.key,
    required this.child,
    this.visibleDuration = const Duration(seconds: 3),
    this.animationDuration = const Duration(milliseconds: 300),
  });

  @override
  AnimatedToastState createState() => AnimatedToastState();
}

class AnimatedToastState extends State<AnimatedToast>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    // Se configura el controlador para la animación de entrada y salida.
    _controller = AnimationController(
      duration: widget.animationDuration,
      reverseDuration: widget.animationDuration,
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 2.0), // Comienza fuera de la pantalla (abajo)
      end: const Offset(0, 0),     // Se detiene en su posición final
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    // Inicia la animación de entrada
    _controller.forward();

    // Programa la animación de salida antes de que finalice el tiempo total visible.
    Future.delayed(
      widget.visibleDuration - widget.animationDuration,
      () {
        if (mounted) {
          _controller.reverse();
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: widget.child,
    );
  }
}


class CustomToast extends StatelessWidget {
  final String message;
  const CustomToast({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;
    return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      border: Border.all(
        color: colors.tertiary
      ),
      borderRadius: BorderRadius.circular(8),
      color: colors.surface,
      boxShadow: [
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
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.check_circle, color: Colors.greenAccent), // Ícono de éxito
        const SizedBox(width: 12.0),
        Flexible(
          child: Text(
            message,
            style: textStyle.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500
            ),
          ),
        ),
      ],
    ),
  );
  }
}
