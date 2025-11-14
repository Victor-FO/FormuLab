
/// Value Object que representa el resultado del cálculo del Teorema de Tales.
class ResultadoTales {
  final String variableCalculada;
  final double valorCalculado;
  final String descripcion;

  const ResultadoTales({
    required this.variableCalculada,
    required this.valorCalculado,
    required this.descripcion,
  });
}

/// Caso de uso para resolver el Teorema de Tales (a/b = c/d).
class ResolverTalesUseCase {
  const ResolverTalesUseCase();

  String _format(double n) => n.toStringAsFixed(2).replaceAll('.', ',');

  ResultadoTales ejecutar({double? a, double? b, double? c, double? d}) {
    final args = [a, b, c, d];
    if (args.where((arg) => arg == null).length != 1) {
      throw ArgumentError('Debes proporcionar exactamente tres de los cuatro valores.');
    }
    if (args.where((arg) => arg != null && arg <= 0).isNotEmpty) {
      throw ArgumentError('Los valores deben ser números positivos.');
    }

    // Calcular a
    if (a == null) {
      final valor = (b! * c!) / d!;
      return ResultadoTales(
        variableCalculada: 'a',
        valorCalculado: valor,
        descripcion: 'a = (b × c) / d = (${_format(b)} × ${_format(c)}) / ${_format(d)} = ${_format(valor)} cm',
      );
    }

    // Calcular b
    if (b == null) {
      final valor = (a * d!) / c!;
      return ResultadoTales(
        variableCalculada: 'b',
        valorCalculado: valor,
        descripcion: 'b = (a × d) / c = (${_format(a)} × ${_format(d)}) / ${_format(c)} = ${_format(valor)} cm',
      );
    }

    // Calcular c
    if (c == null) {
      final valor = (a * d!) / b;
      return ResultadoTales(
        variableCalculada: 'c',
        valorCalculado: valor,
        descripcion: 'c = (a × d) / b = (${_format(a)} × ${_format(d)}) / ${_format(b)} = ${_format(valor)} cm',
      );
    }

    // Calcular d
    if (d == null) {
      final valor = (b * c) / a;
      return ResultadoTales(
        variableCalculada: 'd',
        valorCalculado: valor,
        descripcion: 'd = (b × c) / a = (${_format(b)} × ${_format(c)}) / ${_format(a)} = ${_format(valor)} cm',
      );
    }
    
    throw StateError('Ha ocurrido un error inesperado.');
  }
}
