import 'package:flutter/material.dart';
import 'package:flutter_animais_aleatorios_app/caes_aleatorios/controllers/dogs_color_controller.dart';
import 'package:provider/provider.dart';

class GradientFAB extends StatelessWidget {
  const GradientFAB({
    super.key,
    required this.onPressed,
    required this.icon,
    this.size = 56.0,
    this.iconColor = Colors.black,
    this.elevation = 6.0,
  });

  final VoidCallback? onPressed;
  final IconData icon;
  final double size;
  final Color iconColor;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null;
    final mainColor = context.watch<DogsColorController>().mainColor;
    final lightColor = Color.lerp(mainColor, Colors.white, 0.4)!;

    return PhysicalShape(
      clipper: const ShapeBorderClipper(shape: CircleBorder()),
      elevation: isDisabled ? 0 : elevation,
      color: Colors.transparent,
      shadowColor: mainColor.withValues(alpha: 0.5),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDisabled
                ? [Colors.grey.shade400, Colors.grey.shade300]
                : [lightColor, mainColor],
          ),
        ),
        child: Material(
          color: Colors.transparent,
          shape: const CircleBorder(),
          child: InkWell(
            onTap: onPressed,
            customBorder: const CircleBorder(),
            splashColor: Colors.white24,
            child: SizedBox(
              width: size,
              height: size,
              child: Icon(
                icon,
                color: isDisabled ? Colors.white54 : iconColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
