import 'package:testcalc/domain/entities/ecuacion_segundo_grado_fraccion.dart';
import 'package:testcalc/domain/value_objects/resultado_ecuacion_fraccion.dart';

/// Caso de uso para resolver una ecuación de segundo grado usando fracciones
class ResolverEcuacionSegundoGradoFraccionUseCase {
  const ResolverEcuacionSegundoGradoFraccionUseCase();

  /// Intenta resolver usando fracciones si los coeficientes son enteros
  /// Retorna null si no se puede resolver con fracciones exactas
  ResultadoEcuacionFraccion? ejecutar({
    required double a,
    required double b,
    required double c,
  }) {
    // Verificar si los coeficientes son enteros
    if (!_esEntero(a) || !_esEntero(b) || !_esEntero(c)) {
      return null;
    }

    try {
      final aInt = a.round();
      final bInt = b.round();
      final cInt = c.round();

      final ecuacion = EcuacionSegundoGradoFraccion(
        a: aInt,
        b: bInt,
        c: cInt,
      );

      final solucion = ecuacion.resolver();
      return ResultadoEcuacionFraccion(
        solucionFraccion: solucion,
        a: aInt,
        b: bInt,
        c: cInt,
      );
    } catch (e) {
      // Si no se puede resolver con fracciones exactas, retornar null
      return null;
    }
  }

  bool _esEntero(double valor) {
    return (valor - valor.roundToDouble()).abs() < 0.0001;
  }
}
