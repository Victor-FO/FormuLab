import 'dart:math';

/// Value Object que representa el resultado del cálculo del Teorema de Pitágoras.
class ResultadoPitagoras {
  /// El nombre de la variable que se ha calculado ('a', 'b' o 'c').
  final String variableCalculada;
  /// El valor numérico del resultado.
  final double valorCalculado;
  /// Una descripción detallada del cálculo realizado.
  final String descripcion;

  const ResultadoPitagoras({
    required this.variableCalculada,
    required this.valorCalculado,
    required this.descripcion,
  });
}

/// Caso de uso para resolver el Teorema de Pitágoras.
class ResolverPitagorasUseCase {
  const ResolverPitagorasUseCase();

  String _format(double n) => n.toStringAsFixed(2).replaceAll('.', ',');

  /// Ejecuta el cálculo del Teorema de Pitágoras.
  ///
  /// Se deben proporcionar dos de los tres lados, dejando como nulo el que se
  /// desea calcular.
  ResultadoPitagoras ejecutar({double? a, double? b, double? c}) {
    // Validar que se hayan proporcionado exactamente dos lados
    final ladosProporcionados = [a, b, c].where((lado) => lado != null).length;
    if (ladosProporcionados != 2) {
      throw ArgumentError('Debes proporcionar exactamente dos de los tres lados.');
    }

    // Calcular la hipotenusa (c)
    if (c == null) {
      if (a! <= 0 || b! <= 0) {
        throw ArgumentError('Los catetos deben ser números positivos.');
      }
      final cCalculado = sqrt(a * a + b * b);
      return ResultadoPitagoras(
        variableCalculada: 'c',
        valorCalculado: cCalculado,
        descripcion: 'c = √(a² + b²) = √(${_format(a)}² + ${_format(b)}²) = ${_format(cCalculado)} cm',
      );
    }

    // Calcular el cateto (a)
    if (a == null) {
      if (b! <= 0 || c <= 0) {
        throw ArgumentError('El cateto y la hipotenusa deben ser números positivos.');
      }
      if (c <= b) {
        throw ArgumentError('La hipotenusa (c) debe ser mayor que el cateto (b).');
      }
      final aCalculado = sqrt(c * c - b * b);
      return ResultadoPitagoras(
        variableCalculada: 'a',
        valorCalculado: aCalculado,
        descripcion: 'a = √(c² - b²) = √(${_format(c)}² - ${_format(b)}²) = ${_format(aCalculado)} cm',
      );
    }

    // Calcular el cateto (b)
    if (b == null) {
      if (a <= 0 || c <= 0) {
        throw ArgumentError('El cateto y la hipotenusa deben ser números positivos.');
      }
      if (c <= a) {
        throw ArgumentError('La hipotenusa (c) debe ser mayor que el cateto (a).');
      }
      final bCalculado = sqrt(c * c - a * a);
      return ResultadoPitagoras(
        variableCalculada: 'b',
        valorCalculado: bCalculado,
        descripcion: 'b = √(c² - a²) = √(${_format(c)}² - ${_format(a)}²) = ${_format(bCalculado)} cm',
      );
    }

    // Este caso no debería ocurrir debido a la validación inicial
    throw StateError('Ha ocurrido un error inesperado durante el cálculo.');
  }
}
