import 'dart:math';
import 'package:testcalc/domain/entities/ecuacion_segundo_grado_fraccion.dart';
import 'package:testcalc/domain/entities/solucion_irracional.dart';
import 'package:testcalc/domain/value_objects/resultado_ecuacion_fraccion.dart';
import 'package:testcalc/domain/value_objects/resultado_ecuacion_irracional.dart';

class ResolverEcuacionSegundoGradoFraccionUseCase {
  const ResolverEcuacionSegundoGradoFraccionUseCase();

  dynamic ejecutar({
    required double a,
    required double b,
    required double c,
  }) {
    if (!_esEntero(a) || !_esEntero(b) || !_esEntero(c)) {
      return null;
    }

    final aInt = a.round();
    final bInt = b.round();
    final cInt = c.round();
    final discriminante = bInt * bInt - 4 * aInt * cInt;

    if (discriminante >= 0) {
      final raizDiscriminante = sqrt(discriminante);
      if (raizDiscriminante == raizDiscriminante.floor()) {
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
      } else {
        return ResultadoEcuacionIrracional(
          solucion: SolucionIrracional(
            b: bInt,
            discriminante: discriminante,
            a: aInt,
          ),
          discriminante: discriminante,
        );
      }
    } else {
      final ecuacion = EcuacionSegundoGradoFraccion(a: aInt, b: bInt, c: cInt);
      final solucion = ecuacion.resolver();
      return ResultadoEcuacionFraccion(
        solucionFraccion: solucion,
        a: aInt,
        b: bInt,
        c: cInt,
      );
    }
  }

  bool _esEntero(double valor) {
    return (valor - valor.roundToDouble()).abs() < 0.0001;
  }
}
