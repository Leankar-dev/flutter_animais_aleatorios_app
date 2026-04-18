import 'package:flutter/material.dart';

class GradientElevatedButton extends StatelessWidget {
  const GradientElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.darkColor = const Color(0xFF1A237E),
    this.lightColor = const Color(0xFF90CAF9),
    this.textStyle,
    this.borderRadius = 12.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
  });

  final String label;
  final VoidCallback? onPressed;
  final Color darkColor;
  final Color lightColor;
  final TextStyle? textStyle;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDisabled
              ? [Colors.grey.shade400, Colors.grey.shade200]
              : [darkColor, lightColor],
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: isDisabled
            ? null
            : [
                BoxShadow(
                  color: darkColor.withValues(alpha: 0.4),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          label,
          style: textStyle ??
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
        ),
      ),
    );
  }
}
