import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:testcalc/domain/entities/formula.dart';
import 'package:testcalc/presentation/utils/localization_utils.dart';
import 'package:testcalc/presentation/widgets/calculadora_ecuacion_segundo_grado.dart';
import 'package:testcalc/presentation/widgets/calculadora_pitagoras.dart';
import 'package:testcalc/presentation/widgets/calculadora_area_circulo.dart';
import 'package:testcalc/presentation/widgets/calculadora_volumen_esfera.dart';
import 'package:testcalc/presentation/widgets/calculadora_distancia_puntos.dart';
import 'package:testcalc/presentation/widgets/calculadora_tales.dart';
import 'package:testcalc/presentation/widgets/calculadora_area_triangulo.dart';
import 'package:testcalc/presentation/widgets/calculadora_area_poligono_regular.dart';
import 'package:testcalc/presentation/widgets/calculadora_area_rombo.dart';

import '../../l10n/app_localizations.dart';


class FormulaDetailPage extends StatelessWidget {
  final Formula formula;

  const FormulaDetailPage({super.key, required this.formula});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr(context, formula.nombre)),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _FormulaInfoCard(formula: formula),
            const SizedBox(height: 24),
            _FormulaCalculadora(formulaId: formula.id),
          ],
        ),
      ),
    );
  }
}

class _FormulaInfoCard extends StatelessWidget {
  const _FormulaInfoCard({required this.formula});

  final Formula formula;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final categoryDisplayName = formula.categoria == 'ESO' 
        ? l10n.formulas_categoryESO 
        : l10n.formulas_categoryBachillerato;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    tr(context, formula.nombre),
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: formula.categoria == 'ESO'
                        ? Colors.blue.shade100
                        : Colors.purple.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    categoryDisplayName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: formula.categoria == 'ESO'
                          ? Colors.blue.shade900
                          : Colors.purple.shade900,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    l10n.formula_formula_title,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                  ),
                  const SizedBox(height: 8),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Math.tex(
                      formula.formula,
                      textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              tr(context, formula.descripcion),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if (formula.explicacion != null && formula.explicacion!.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                l10n.formula_explanation_title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                tr(context, formula.explicacion!),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
            if (formula.ejemplo != null && formula.ejemplo!.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                l10n.formula_example_title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        tr(context, formula.ejemplo!),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  Icons.category,
                  size: 20,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Text(
                  '${l10n.formula_topic_title}: ${formula.tema}', 
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FormulaCalculadora extends StatelessWidget {
  final String formulaId;

  const _FormulaCalculadora({required this.formulaId});

  @override
  Widget build(BuildContext context) {
    switch (formulaId) {
      case 'ecuacion_segundo_grado':
        return const CalculadoraEcuacionSegundoGrado();
      case 'teorema_pitagoras':
        return const CalculadoraPitagoras();
      case 'area_circulo':
        return const CalculadoraAreaCirculo();
      case 'area_triangulo':
        return const CalculadoraAreaTriangulo();
      case 'area_poligono_regular':
        return const CalculadoraAreaPoligonoRegular();
      case 'area_rombo':
        return const CalculadoraAreaRombo();
      case 'volumen_esfera':
        return const CalculadoraVolumenEsfera();
      case 'distancia_dos_puntos':
        return const CalculadoraDistanciaPuntos();
      case 'teorema_tales':
        return const CalculadoraTales();
      default:
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Icon(
                  Icons.construction,
                  size: 48,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(height: 16),
                Text(
                  'Calculadora en desarrollo', //TODO: Translate
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'La calculadora para esta fórmula estará disponible próximamente', //TODO: Translate
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
    }
  }
}
