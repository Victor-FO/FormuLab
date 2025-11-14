import 'dart:math';

/// Value Object que representa el resultado del cálculo de la distancia entre dos puntos.
class ResultadoDistanciaPuntos {
  final double x1, y1, x2, y2;
  final double distancia;
  final String descripcion;

  const ResultadoDistanciaPuntos({
    required this.x1,
    required this.y1,
    required this.x2,
    required this.y2,
    required this.distancia,
    required this.descripcion,
  });
}

/// Caso de uso para resolver la distancia entre dos puntos.
class ResolverDistanciaPuntosUseCase {
  const ResolverDistanciaPuntosUseCase();

  String _format(double n) => n.toStringAsFixed(2).replaceAll('.', ',');

  /// Ejecuta el cálculo de la distancia entre dos puntos.
  ResultadoDistanciaPuntos ejecutar({
    required double x1,
    required double y1,
    required double x2,
    required double y2,
  }) {
    final deltaX = x2 - x1;
    final deltaY = y2 - y1;
    final distancia = sqrt(pow(deltaX, 2) + pow(deltaY, 2));

    return ResultadoDistanciaPuntos(
      x1: x1, y1: y1, x2: x2, y2: y2,
      distancia: distancia,
      descripcion: 'd = √[(${_format(x2)} - ${_format(x1)})² + (${_format(y2)} - ${_format(y1)})²] = ${_format(distancia)} cm',
    );
  }
}
