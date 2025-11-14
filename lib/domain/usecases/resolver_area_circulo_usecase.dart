import 'dart:math';

/// Value Object que representa el resultado del cálculo del área de un círculo.
class ResultadoAreaCirculo {
  /// El valor del radio utilizado.
  final double radio;
  /// El área calculada.
  final double area;
  /// Una descripción detallada del cálculo realizado.
  final String descripcion;

  const ResultadoAreaCirculo({
    required this.radio,
    required this.area,
    required this.descripcion,
  });
}

/// Caso de uso para resolver el área de un círculo.
class ResolverAreaCirculoUseCase {
  const ResolverAreaCirculoUseCase();

  String _format(double n) => n.toStringAsFixed(2).replaceAll('.', ',');

  /// Ejecuta el cálculo del área de un círculo.
  ResultadoAreaCirculo ejecutar({required double r}) {
    if (r <= 0) {
      throw ArgumentError('El radio (r) debe ser un número positivo.');
    }

    final area = pi * r * r;
    
    return ResultadoAreaCirculo(
      radio: r,
      area: area,
      descripcion: 'A = π × r² = π × (${_format(r)} cm)² = ${_format(area)} cm²',
    );
  }
}
