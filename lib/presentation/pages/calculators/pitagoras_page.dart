import 'package:flutter/material.dart';
import 'package:testcalc/l10n/app_localizations.dart';
import 'package:testcalc/presentation/widgets/calculadora_pitagoras.dart';

class PitagorasPage extends StatelessWidget {
  const PitagorasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.pitagoras_title),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: CalculadoraPitagoras(),
      ),
    );
  }
}
