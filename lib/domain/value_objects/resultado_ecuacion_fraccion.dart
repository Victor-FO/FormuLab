import 'package:testcalc/domain/entities/ecuacion_segundo_grado_fraccion.dart';
import 'package:testcalc/domain/value_objects/resultado_ecuacion.dart';

/// Value Object que representa el resultado de una ecuación con formato fraccionario
class ResultadoEcuacionFraccion {
  final SolucionFraccion solucionFraccion;
  final ResultadoEcuacion? resultadoDecimal;
  final num a, b, c;

  const ResultadoEcuacionFraccion({
    required this.solucionFraccion,
    this.resultadoDecimal,
    required this.a,
    required this.b,
    required this.c,
  });

  /// Obtiene el resultado como texto detallado con fracciones
  String obtenerTextoDetallado() {
    return solucionFraccion.toStringDetallado();
  }

  /// Obtiene información sobre el discriminante, mostrando el cálculo
  String obtenerInfoDiscriminante() {
    final delta = solucionFraccion.discriminante;
    final bCuadrado = b * b;
    final cuatroAC = 4 * a * c;
    
    final bStr = '($b)';
    final aStr = a.toString();
    final cStr = c < 0 ? '($c)' : c.toString();

    final calculo = 'Δ = $bStr² - 4($aStr)($cStr) = $bCuadrado - $cuatroAC = $delta';

    final raiz = solucionFraccion.raizDiscriminante;
    if (delta > 0 && raiz != null && raiz * raiz == delta) {
      return '$calculo = $raiz²';
    }
    
    return calculo;
  }

  bool get tieneSoluciones => solucionFraccion.tieneSoluciones;
  bool get tieneDosSoluciones => solucionFraccion.tieneDosSoluciones;
}
