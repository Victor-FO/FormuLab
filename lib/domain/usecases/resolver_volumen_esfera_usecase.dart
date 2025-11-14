import 'dart:math';

/// Value Object que representa el resultado del cálculo del volumen de una esfera.
class ResultadoVolumenEsfera {
  /// El valor del radio utilizado.
  final double radio;
  /// El volumen calculado.
  final double volumen;
  /// Una descripción detallada del cálculo realizado.
  final String descripcion;

  const ResultadoVolumenEsfera({
    required this.radio,
    required this.volumen,
    required this.descripcion,
  });
}

/// Caso de uso para resolver el volumen de una esfera.
class ResolverVolumenEsferaUseCase {
  const ResolverVolumenEsferaUseCase();

  String _format(double n) => n.toStringAsFixed(2).replaceAll('.', ',');

  /// Ejecuta el cálculo del volumen de una esfera.
  ResultadoVolumenEsfera ejecutar({required double r}) {
    if (r <= 0) {
      throw ArgumentError('El radio (r) debe ser un número positivo.');
    }

    final volumen = (4 / 3) * pi * pow(r, 3);
    
    return ResultadoVolumenEsfera(
      radio: r,
      volumen: volumen,
      descripcion: 'V = (4/3)πr³ = (4/3)π(${_format(r)} cm)³ = ${_format(volumen)} cm³',
    );
  }
}
