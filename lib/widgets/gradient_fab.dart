import 'package:flutter/material.dart';

class GradientFAB extends StatelessWidget {
  const GradientFAB({
    super.key,
    required this.onPressed,
    required this.icon,
    this.darkColor = Colors.blue,
    this.lightColor = Colors.blueAccent,
    this.size = 56.0,
    this.iconColor = Colors.black,
    this.elevation = 6.0,
  });

  final VoidCallback? onPressed;
  final IconData icon;
  final Color darkColor;
  final Color lightColor;
  final double size;
  final Color iconColor;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null;

    return PhysicalShape(
      clipper: const ShapeBorderClipper(shape: CircleBorder()),
      elevation: isDisabled ? 0 : elevation,
      color: Colors.transparent,
      shadowColor: darkColor.withValues(alpha: 0.5),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDisabled
                ? [Colors.grey.shade400, Colors.grey.shade300]
                : [lightColor, darkColor],
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
