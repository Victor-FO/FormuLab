import 'dart:math';

/// Value Object que representa el resultado del cálculo del área de un polígono regular.
class ResultadoAreaPoligonoRegular {
  final int numLados;
  final double longitudLado;
  final double apotema;
  final double area;
  final double perimetro;
  final String descripcion;

  const ResultadoAreaPoligonoRegular({
    required this.numLados,
    required this.longitudLado,
    required this.apotema,
    required this.area,
    required this.perimetro,
    required this.descripcion,
  });
}

/// Caso de uso para resolver el área de un polígono regular.
class ResolverAreaPoligonoRegularUseCase {
  const ResolverAreaPoligonoRegularUseCase();

  String _format(double n) => n.toStringAsFixed(2).replaceAll('.', ',');

  ResultadoAreaPoligonoRegular ejecutar({
    required int n,
    required double l,
    required double ap,
  }) {
    if (n < 3) {
      throw ArgumentError('El número de lados (n) debe ser 3 o mayor.');
    }
    if (l <= 0 || ap <= 0) {
      throw ArgumentError('La longitud del lado (l) y la apotema (ap) deben ser números positivos.');
    }

    final perimetro = n * l;
    final area = (perimetro * ap) / 2;
    
    return ResultadoAreaPoligonoRegular(
      numLados: n,
      longitudLado: l,
      apotema: ap,
      perimetro: perimetro,
      area: area,
      descripcion: 'A = (P × ap) / 2 = (${_format(perimetro)} cm × ${_format(ap)} cm) / 2 = ${_format(area)} cm²',
    );
  }
}
