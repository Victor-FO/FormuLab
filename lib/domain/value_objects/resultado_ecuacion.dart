/// Value Object que representa el resultado de resolver una ecuación
abstract class ResultadoEcuacion {
  final double discriminante;

  const ResultadoEcuacion({required this.discriminante});

  /// Resultado con dos soluciones reales
  factory ResultadoEcuacion.dosSoluciones({
    required double solucion1,
    required double solucion2,
    required double discriminante,
  }) = ResultadoDosSoluciones;

  /// Resultado con una solución real (raíz doble)
  factory ResultadoEcuacion.unaSolucion({
    required double solucion,
    required double discriminante,
  }) = ResultadoUnaSolucion;

  /// Resultado sin soluciones reales
  factory ResultadoEcuacion.sinSolucionesReales({
    required double discriminante,
  }) = ResultadoSinSoluciones;
}

class ResultadoDosSoluciones extends ResultadoEcuacion {
  final double solucion1;
  final double solucion2;

  const ResultadoDosSoluciones({
    required this.solucion1,
    required this.solucion2,
    required super.discriminante,
  });

  @override
  String toString() {
    return 'x₁ = ${solucion1.toStringAsFixed(4)}, x₂ = ${solucion2.toStringAsFixed(4)}';
  }
}

class ResultadoUnaSolucion extends ResultadoEcuacion {
  final double solucion;

  const ResultadoUnaSolucion({
    required this.solucion,
    required super.discriminante,
  });

  @override
  String toString() {
    return 'x = ${solucion.toStringAsFixed(4)} (raíz doble)';
  }
}

class ResultadoSinSoluciones extends ResultadoEcuacion {
  const ResultadoSinSoluciones({required super.discriminante});

  @override
  String toString() {
    return 'No tiene soluciones reales (Δ < 0)';
  }
}
