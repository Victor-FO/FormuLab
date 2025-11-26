import 'package:testcalc/domain/entities/solucion_irracional.dart';

class ResultadoEcuacionIrracional {
  final SolucionIrracional solucion;
  final int discriminante;

  ResultadoEcuacionIrracional({
    required this.solucion,
    required this.discriminante,
  });
}
