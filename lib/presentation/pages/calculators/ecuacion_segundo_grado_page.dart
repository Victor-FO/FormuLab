import 'package:flutter/material.dart';
import 'package:testcalc/l10n/app_localizations.dart';
import 'package:testcalc/presentation/widgets/calculadora_ecuacion_segundo_grado.dart';

class EcuacionSegundoGradoPage extends StatelessWidget {
  const EcuacionSegundoGradoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.formula_ecuacion_segundo_grado_name),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: CalculadoraEcuacionSegundoGrado(),
      ),
    );
  }
}
