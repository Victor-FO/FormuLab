/// Entidad base que representa una fórmula matemática
class Formula {
  final String id;
  final String nombre;
  final String descripcion;
  final String formula;
  final String categoria; // ESO, Bachillerato
  final String tema; // Álgebra, Geometría, etc.
  final List<String> variables; // Variables que necesita la fórmula
  final String? ejemplo;
  final String? explicacion;

  const Formula({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.formula,
    required this.categoria,
    required this.tema,
    required this.variables,
    this.ejemplo,
    this.explicacion,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Formula &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}

