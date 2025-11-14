import 'package:testcalc/domain/entities/formula.dart';

/// DTO (Data Transfer Object) para transferir datos de fórmulas entre capas
class FormulaDto {
  final String id;
  final String nombre;
  final String descripcion;
  final String formula;
  final String categoria;
  final String tema;
  final List<String> variables;
  final String? ejemplo;
  final String? explicacion;

  const FormulaDto({
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

  /// Convierte una entidad Formula a DTO
  factory FormulaDto.fromEntity(Formula formula) {
    return FormulaDto(
      id: formula.id,
      nombre: formula.nombre,
      descripcion: formula.descripcion,
      formula: formula.formula,
      categoria: formula.categoria,
      tema: formula.tema,
      variables: formula.variables,
      ejemplo: formula.ejemplo,
      explicacion: formula.explicacion,
    );
  }

  /// Convierte el DTO a una entidad Formula
  Formula toEntity() {
    return Formula(
      id: id,
      nombre: nombre,
      descripcion: descripcion,
      formula: formula,
      categoria: categoria,
      tema: tema,
      variables: variables,
      ejemplo: ejemplo,
      explicacion: explicacion,
    );
  }
}

