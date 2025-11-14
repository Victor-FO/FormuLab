import 'package:testcalc/domain/entities/formula.dart';
import 'package:testcalc/domain/repositories/formula_repository.dart';

/// Caso de uso para obtener todas las fórmulas
class ObtenerFormulasUseCase {
  final FormulaRepository repository;

  const ObtenerFormulasUseCase(this.repository);

  Future<List<Formula>> ejecutar() async {
    return await repository.obtenerTodas();
  }
}

