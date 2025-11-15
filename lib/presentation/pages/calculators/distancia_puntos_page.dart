import 'package:flutter/material.dart';
import 'package:testcalc/l10n/app_localizations.dart';
import 'package:testcalc/presentation/widgets/calculadora_distancia_puntos.dart';

class DistanciaPuntosPage extends StatelessWidget {
  const DistanciaPuntosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.puntos_title),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: CalculadoraDistanciaPuntos(),
      ),
    );
  }
}
