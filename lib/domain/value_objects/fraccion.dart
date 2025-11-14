import 'dart:math' as math;

/// Value Object que representa una fracción
class Fraccion {
  final int numerador;
  final int denominador;

  const Fraccion({
    required this.numerador,
    required this.denominador,
  }) : assert(denominador != 0, 'El denominador no puede ser cero');

  /// Crea una fracción a partir de un número decimal
  /// Intenta convertir el decimal a fracción exacta si es posible
  factory Fraccion.fromDouble(double valor, {double tolerancia = 0.0001}) {
    if (valor.isInfinite || valor.isNaN) {
      throw ArgumentError('No se puede convertir un valor infinito o NaN a fracción');
    }

    // Si es un entero
    if ((valor - valor.roundToDouble()).abs() < tolerancia) {
      return Fraccion(numerador: valor.round(), denominador: 1).simplificar();
    }

    // Intentar encontrar una fracción aproximada
    final signo = valor < 0 ? -1 : 1;
    final valorAbs = valor.abs();
    
    // Buscar denominadores comunes
    for (int den = 1; den <= 10000; den++) {
      final num = (valorAbs * den).round();
      if ((valorAbs - num / den).abs() < tolerancia) {
        return Fraccion(numerador: signo * num, denominador: den).simplificar();
      }
    }

    // Si no se encuentra una fracción exacta, usar el decimal como fracción aproximada
    final partes = valor.toString().split('.');
    if (partes.length == 2) {
      final decimales = partes[1].length;
      final factor = math.pow(10, decimales).toInt();
      return Fraccion(
        numerador: signo * (valor * factor).round(),
        denominador: factor,
      ).simplificar();
    }

    return Fraccion(numerador: valor.round(), denominador: 1);
  }

  /// Crea una fracción directamente desde numerador y denominador
  factory Fraccion.fromEnteros(int num, int den) {
    return Fraccion(numerador: num, denominador: den).simplificar();
  }

  /// Calcula el máximo común divisor (MCD) usando el algoritmo de Euclides
  static int _mcd(int a, int b) {
    a = a.abs();
    b = b.abs();
    while (b != 0) {
      final temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }

  /// Simplifica la fracción al máximo
  Fraccion simplificar() {
    if (numerador == 0) {
      return const Fraccion(numerador: 0, denominador: 1);
    }

    final mcd = _mcd(numerador, denominador);
    var num = numerador ~/ mcd;
    var den = denominador ~/ mcd;

    // Asegurar que el denominador sea positivo
    if (den < 0) {
      num = -num;
      den = -den;
    }

    return Fraccion(numerador: num, denominador: den);
  }

  /// Convierte la fracción a número decimal
  double toDouble() {
    return numerador / denominador;
  }

  /// Verifica si la fracción representa un número entero
  bool esEntero() {
    return denominador == 1 || (numerador % denominador == 0);
  }

  /// Obtiene el valor entero si la fracción representa un entero
  int? toInt() {
    if (esEntero()) {
      return numerador ~/ denominador;
    }
    return null;
  }

  /// Representación en cadena de la fracción
  @override
  String toString() {
    if (denominador == 1) {
      return numerador.toString();
    }
    return '$numerador/$denominador';
  }

  /// Representación detallada mostrando la fracción y su equivalente decimal
  String toStringDetallado() {
    final simplificada = simplificar();
    final decimal = simplificada.toDouble();
    
    if (simplificada.esEntero()) {
      return simplificada.toInt().toString();
    }
    
    // Verificar si el decimal es "limpio" (sin muchos decimales)
    final decimalStr = decimal.toStringAsFixed(6);
    final partes = decimalStr.split('.');
    if (partes.length == 2) {
      final decimales = partes[1].replaceAll(RegExp(r'0+$'), '');
      if (decimales.isEmpty) {
        return simplificada.toInt().toString();
      }
    }
    
    return '${simplificada.toString()} = ${decimal.toStringAsFixed(4).replaceAll(RegExp(r'0+$'), '').replaceAll(RegExp(r'\.$'), '')}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Fraccion &&
          runtimeType == other.runtimeType &&
          numerador * other.denominador == other.numerador * denominador;

  @override
  int get hashCode => (numerador / denominador).hashCode;
}
