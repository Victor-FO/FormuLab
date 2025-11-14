import 'package:testcalc/domain/entities/formula.dart';
import 'package:testcalc/domain/repositories/formula_repository.dart';
import 'package:testcalc/infrastructure/data_sources/formula_data_source.dart';

/// Implementación concreta del repositorio de fórmulas (adaptador en arquitectura hexagonal)
class FormulaRepositoryImpl implements FormulaRepository {
  final FormulaDataSource dataSource;

  const FormulaRepositoryImpl(this.dataSource);

  @override
  Future<List<Formula>> obtenerTodas() async {
    return await dataSource.obtenerTodas();
  }

  @override
  Future<Formula?> obtenerPorId(String id) async {
    return await dataSource.obtenerPorId(id);
  }

  @override
  Future<List<Formula>> obtenerPorCategoria(String categoria) async {
    final todas = await obtenerTodas();
    return todas.where((f) => f.categoria == categoria).toList();
  }

  @override
  Future<List<Formula>> obtenerPorTema(String tema) async {
    final todas = await obtenerTodas();
    return todas.where((f) => f.tema == tema).toList();
  }

  @override
  Future<List<Formula>> buscar(String termino) async {
    final todas = await obtenerTodas();
    final terminoLower = termino.toLowerCase();
    return todas.where((f) {
      return f.nombre.toLowerCase().contains(terminoLower) ||
          f.descripcion.toLowerCase().contains(terminoLower) ||
          f.tema.toLowerCase().contains(terminoLower);
    }).toList();
  }
}

