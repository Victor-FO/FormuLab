import 'dart:math' as math;
import 'package:testcalc/domain/value_objects/resultado_ecuacion.dart';

/// Entidad que representa una ecuación de segundo grado
class EcuacionSegundoGrado {
  final double a;
  final double b;
  final double c;

  const EcuacionSegundoGrado({
    required this.a,
    required this.b,
    required this.c,
  });

  /// Valida que la ecuación sea de segundo grado (a != 0)
  bool get esValida => a != 0;

  /// Calcula el discriminante: b² - 4ac
  double get discriminante => (b * b) - (4 * a * c);

  /// Determina el tipo de solución según el discriminante
  TipoSolucion get tipoSolucion {
    if (discriminante > 0) {
      return TipoSolucion.dosSolucionesReales;
    } else if (discriminante == 0) {
      return TipoSolucion.unaSolucionReal;
    } else {
      return TipoSolucion.sinSolucionesReales;
    }
  }

  /// Resuelve la ecuación y retorna el resultado
  ResultadoEcuacion resolver() {
    if (!esValida) {
      throw ArgumentError('El coeficiente "a" no puede ser cero');
    }

    if (tipoSolucion == TipoSolucion.sinSolucionesReales) {
      return ResultadoEcuacion.sinSolucionesReales(
        discriminante: discriminante,
      );
    }

    final raizDiscriminante = math.sqrt(discriminante);
    final dosA = 2 * a;

    if (tipoSolucion == TipoSolucion.unaSolucionReal) {
      final solucion = -b / dosA;
      return ResultadoEcuacion.unaSolucion(
        solucion: solucion,
        discriminante: discriminante,
      );
    }

    // Dos soluciones reales
    final solucion1 = (-b + raizDiscriminante) / dosA;
    final solucion2 = (-b - raizDiscriminante) / dosA;

    return ResultadoEcuacion.dosSoluciones(
      solucion1: solucion1,
      solucion2: solucion2,
      discriminante: discriminante,
    );
  }
}

/// Enum que representa el tipo de solución de una ecuación
enum TipoSolucion {
  dosSolucionesReales,
  unaSolucionReal,
  sinSolucionesReales,
}
