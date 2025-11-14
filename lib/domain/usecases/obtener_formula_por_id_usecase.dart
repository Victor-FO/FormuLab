import 'package:testcalc/domain/entities/formula.dart';
import 'package:testcalc/domain/repositories/formula_repository.dart';

/// Caso de uso para obtener una fórmula por su ID
class ObtenerFormulaPorIdUseCase {
  final FormulaRepository repository;

  const ObtenerFormulaPorIdUseCase(this.repository);

  Future<Formula?> ejecutar(String id) async {
    return await repository.obtenerPorId(id);
  }
}

