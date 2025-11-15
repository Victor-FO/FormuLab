import 'package:flutter/material.dart';
import 'package:testcalc/l10n/app_localizations.dart';
import 'package:testcalc/presentation/widgets/calculadora_area_poligono_regular.dart';

class AreaPoligonoRegularPage extends StatelessWidget {
  const AreaPoligonoRegularPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.poligono_title),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: CalculadoraAreaPoligonoRegular(),
      ),
    );
  }
}
