import 'package:flutter/material.dart';

/// Widget que muestra una fracción de forma visual
class FraccionWidget extends StatelessWidget {
  final int numerador;
  final int denominador;
  final TextStyle? style;
  final Color? color;

  const FraccionWidget({
    super.key,
    required this.numerador,
    required this.denominador,
    this.style,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = style ??
        Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontFamily: 'monospace',
            ) ??
        const TextStyle(fontFamily: 'monospace');
    final textColor = color ?? textStyle.color;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          numerador.toString(),
          style: textStyle.copyWith(color: textColor),
        ),
        Container(
          width: (numerador.toString().length * 8.0).clamp(20.0, 60.0),
          height: 1,
          color: textColor,
        ),
        Text(
          denominador.toString(),
          style: textStyle.copyWith(color: textColor),
        ),
      ],
    );
  }
}

