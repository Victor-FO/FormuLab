/// Representa una solución irracional de la forma (-b ± sqrt(D)) / 2a
class SolucionIrracional {
  final int b;
  final int discriminante;
  final int a;

  const SolucionIrracional({
    required this.b,
    required this.discriminante,
    required this.a,
  });

  String get x1 => '(-${b} + √${discriminante}) / ${2 * a}';
  String get x2 => '(-${b} - √${discriminante}) / ${2 * a}';
}
