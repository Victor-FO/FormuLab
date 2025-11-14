import 'package:testcalc/domain/entities/ecuacion_segundo_grado.dart';
import 'package:testcalc/domain/value_objects/resultado_ecuacion.dart';

/// Caso de uso para resolver una ecuación de segundo grado
class ResolverEcuacionSegundoGradoUseCase {
  const ResolverEcuacionSegundoGradoUseCase();

  ResultadoEcuacion ejecutar({
    required double a,
    required double b,
    required double c,
  }) {
    final ecuacion = EcuacionSegundoGrado(a: a, b: b, c: c);
    return ecuacion.resolver();
  }
}

