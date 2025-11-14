
/// Value Object que representa el resultado del cálculo del área de un triángulo.
class ResultadoAreaTriangulo {
  final double base;
  final double altura;
  final double area;
  final String descripcion;

  const ResultadoAreaTriangulo({
    required this.base,
    required this.altura,
    required this.area,
    required this.descripcion,
  });
}

/// Caso de uso para resolver el área de un triángulo.
class ResolverAreaTrianguloUseCase {
  const ResolverAreaTrianguloUseCase();

  String _format(double n) => n.toStringAsFixed(2).replaceAll('.', ',');

  ResultadoAreaTriangulo ejecutar({required double b, required double h}) {
    if (b <= 0 || h <= 0) {
      throw ArgumentError('La base y la altura deben ser números positivos.');
    }

    final area = (b * h) / 2;
    
    return ResultadoAreaTriangulo(
      base: b,
      altura: h,
      area: area,
      descripcion: 'A = (b × h) / 2 = (${_format(b)} cm × ${_format(h)} cm) / 2 = ${_format(area)} cm²',
    );
  }
}
