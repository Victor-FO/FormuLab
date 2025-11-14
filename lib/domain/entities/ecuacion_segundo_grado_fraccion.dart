import 'dart:math' as math;
import 'package:testcalc/domain/value_objects/fraccion.dart';

/// Entidad que representa una ecuación de segundo grado trabajando con fracciones
class EcuacionSegundoGradoFraccion {
  final int a;
  final int b;
  final int c;

  const EcuacionSegundoGradoFraccion({
    required this.a,
    required this.b,
    required this.c,
  });

  /// Valida que la ecuación sea de segundo grado (a != 0)
  bool get esValida => a != 0;

  /// Calcula el discriminante: b² - 4ac
  int get discriminante => (b * b) - (4 * a * c);

  /// Determina si el discriminante es un cuadrado perfecto
  bool get discriminanteEsCuadradoPerfecto {
    if (discriminante < 0) return false;
    final raiz = math.sqrt(discriminante);
    return (raiz - raiz.roundToDouble()).abs() < 0.0001;
  }

  /// Obtiene la raíz cuadrada del discriminante como entero (si es cuadrado perfecto)
  int? get raizDiscriminante {
    if (!discriminanteEsCuadradoPerfecto) return null;
    return math.sqrt(discriminante).round();
  }

  /// Resuelve la ecuación retornando fracciones exactas
  SolucionFraccion resolver() {
    if (!esValida) {
      throw ArgumentError('El coeficiente "a" no puede ser cero');
    }

    final delta = discriminante;

    if (delta < 0) {
      return SolucionFraccion.sinSoluciones(discriminante: delta);
    }

    final dosA = 2 * a;

    if (delta == 0) {
      // Una solución (raíz doble)
      final numerador = -b;
      final fraccion = Fraccion.fromEnteros(numerador, dosA);
      return SolucionFraccion.unaSolucion(
        fraccion: fraccion,
        numeradorSinSimplificar: numerador,
        denominador: dosA,
        discriminante: delta,
      );
    }

    // Dos soluciones
    final raizDelta = raizDiscriminante;
    
    if (raizDelta == null) {
      // El discriminante no es un cuadrado perfecto, no podemos representar exactamente
      // como fracción simple, pero podemos mostrar la expresión
      throw ArgumentError('El discriminante no es un cuadrado perfecto. Use el método de resolución con decimales.');
    }

    // Calcular numeradores: x = (-b ± √Δ) / (2a)
    final numerador1 = -b + raizDelta;
    final numerador2 = -b - raizDelta;

    final fraccion1 = Fraccion.fromEnteros(numerador1, dosA);
    final fraccion2 = Fraccion.fromEnteros(numerador2, dosA);

    // Ordenar soluciones: x₁ es la mayor, x₂ es la menor
    final sol1 = fraccion1.simplificar();
    final sol2 = fraccion2.simplificar();
    final valor1 = sol1.toDouble();
    final valor2 = sol2.toDouble();
    
    // Asegurar que x₁ >= x₂ (x₁ es la mayor solución)
    final int num1, num2;
    final Fraccion frac1, frac2;
    
    if (valor1 >= valor2) {
      num1 = numerador1;
      num2 = numerador2;
      frac1 = sol1;
      frac2 = sol2;
    } else {
      num1 = numerador2;
      num2 = numerador1;
      frac1 = sol2;
      frac2 = sol1;
    }

    return SolucionFraccion.dosSoluciones(
      fraccion1: frac1,
      fraccion2: frac2,
      numerador1SinSimplificar: num1,
      numerador2SinSimplificar: num2,
      denominador: dosA,
      discriminante: delta,
      raizDiscriminante: raizDelta,
    );
  }
}

/// Clase que representa la solución de una ecuación en formato fraccionario
class SolucionFraccion {
  final int discriminante;
  final Fraccion? fraccion1;
  final Fraccion? fraccion2;
  final int? numerador1SinSimplificar;
  final int? numerador2SinSimplificar;
  final int? denominador;
  final int? raizDiscriminante;

  const SolucionFraccion._({
    required this.discriminante,
    this.fraccion1,
    this.fraccion2,
    this.numerador1SinSimplificar,
    this.numerador2SinSimplificar,
    this.denominador,
    this.raizDiscriminante,
  });

  factory SolucionFraccion.dosSoluciones({
    required Fraccion fraccion1,
    required Fraccion fraccion2,
    required int numerador1SinSimplificar,
    required int numerador2SinSimplificar,
    required int denominador,
    required int discriminante,
    required int raizDiscriminante,
  }) {
    return SolucionFraccion._(
      fraccion1: fraccion1,
      fraccion2: fraccion2,
      numerador1SinSimplificar: numerador1SinSimplificar,
      numerador2SinSimplificar: numerador2SinSimplificar,
      denominador: denominador,
      discriminante: discriminante,
      raizDiscriminante: raizDiscriminante,
    );
  }

  factory SolucionFraccion.unaSolucion({
    required Fraccion fraccion,
    required int numeradorSinSimplificar,
    required int denominador,
    required int discriminante,
  }) {
    return SolucionFraccion._(
      fraccion1: fraccion,
      numerador1SinSimplificar: numeradorSinSimplificar,
      denominador: denominador,
      discriminante: discriminante,
    );
  }

  factory SolucionFraccion.sinSoluciones({required int discriminante}) {
    return SolucionFraccion._(discriminante: discriminante);
  }

  bool get tieneSoluciones => fraccion1 != null;
  bool get tieneDosSoluciones => fraccion1 != null && fraccion2 != null;

  /// Formatea la solución mostrando el proceso paso a paso
  String toStringDetallado() {
    if (!tieneSoluciones) {
      return 'No tiene soluciones reales (Δ = $discriminante < 0)';
    }

    if (tieneDosSoluciones) {
      final x1Str = 'x = ${fraccion1!.toString()}';
      final x2Str = 'x = ${fraccion2!.toString()}';
      return '$x1Str\n$x2Str';
    }

    if (fraccion1 != null) {
      final xStr = 'x = ${fraccion1!.toString()}';
      return '$xStr (raíz doble)';
    }

    return 'Solución no válida';
  }
}
