
/// Value Object que representa el resultado del cálculo del área de un rombo.
class ResultadoAreaRombo {
  final double diagonalMayor;
  final double diagonalMenor;
  final double area;
  final String descripcion;

  const ResultadoAreaRombo({
    required this.diagonalMayor,
    required this.diagonalMenor,
    required this.area,
    required this.descripcion,
  });
}

/// Caso de uso para resolver el área de un rombo.
class ResolverAreaRomboUseCase {
  const ResolverAreaRomboUseCase();

  String _format(double n) => n.toStringAsFixed(2).replaceAll('.', ',');

  ResultadoAreaRombo ejecutar({required double D, required double d}) {
    if (D <= 0 || d <= 0) {
      throw ArgumentError('Las diagonales deben ser números positivos.');
    }
    if (d > D) {
      throw ArgumentError('La diagonal mayor (D) no puede ser más pequeña que la diagonal menor (d).');
    }

    final area = (D * d) / 2;
    
    return ResultadoAreaRombo(
      diagonalMayor: D,
      diagonalMenor: d,
      area: area,
      descripcion: 'A = (D × d) / 2 = (${_format(D)} cm × ${_format(d)} cm) / 2 = ${_format(area)} cm²',
    );
  }
}
