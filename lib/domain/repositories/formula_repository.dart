import 'package:testcalc/domain/entities/formula.dart';

/// Interfaz del repositorio de fórmulas (puerto en arquitectura hexagonal)
abstract class FormulaRepository {
  /// Obtiene todas las fórmulas disponibles
  Future<List<Formula>> obtenerTodas();

  /// Obtiene una fórmula por su ID
  Future<Formula?> obtenerPorId(String id);

  /// Obtiene fórmulas por categoría (ESO, Bachillerato)
  Future<List<Formula>> obtenerPorCategoria(String categoria);

  /// Obtiene fórmulas por tema (Álgebra, Geometría, etc.)
  Future<List<Formula>> obtenerPorTema(String tema);

  /// Busca fórmulas por nombre o descripción
  Future<List<Formula>> buscar(String termino);
}

