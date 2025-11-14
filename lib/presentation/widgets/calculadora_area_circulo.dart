import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testcalc/domain/usecases/resolver_area_circulo_usecase.dart';

import '../../l10n/app_localizations.dart';


class CalculadoraAreaCirculo extends StatefulWidget {
  const CalculadoraAreaCirculo({super.key});

  @override
  State<CalculadoraAreaCirculo> createState() => _CalculadoraAreaCirculoState();
}

class _CalculadoraAreaCirculoState extends State<CalculadoraAreaCirculo> {
  final _formKey = GlobalKey<FormState>();
  final _rController = TextEditingController();
  final _resolverUseCase = const ResolverAreaCirculoUseCase();

  ResultadoAreaCirculo? _resultado;
  String? _error;

  String _format(double n) => n.toStringAsFixed(2).replaceAll('.', ',');

  @override
  void dispose() {
    _rController.dispose();
    super.dispose();
  }

  void _calcular() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _resultado = null;
      _error = null;
    });

    try {
      final r = double.parse(_rController.text.replaceAll(',', '.'));
      final resultado = _resolverUseCase.ejecutar(r: r);
      setState(() {
        _resultado = resultado;
      });
    } catch (e) {
      setState(() {
        _error = e.toString().replaceFirst('Exception: ', '').replaceFirst('ArgumentError: ', '');
      });
    }
  }

  void _limpiar() {
    _rController.clear();
    setState(() {
      _resultado = null;
      _error = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.circulo_title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.circulo_subtitle,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _rController,
                decoration: InputDecoration(
                  labelText: l10n.circulo_var_r,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*[,.]?\d*'))],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.calculator_error_enter_value;
                  }
                  if (double.tryParse(value.replaceAll(',', '.')) == null) {
                    return l10n.calculator_error_invalid_number;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              _buildBotones(l10n),
              if (_error != null) _buildErrorWidget(context, _error!),
              if (_resultado != null) _buildResultadoWidget(context, _resultado!),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBotones(AppLocalizations l10n) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: _calcular,
            icon: const Icon(Icons.calculate),
            label: Text(l10n.calculator_calculate_button),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: _limpiar,
            icon: const Icon(Icons.clear),
            label: Text(l10n.calculator_clear_button),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorWidget(BuildContext context, String error) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.errorContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.error_outline, color: Theme.of(context).colorScheme.onErrorContainer),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                error,
                style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultadoWidget(BuildContext context, ResultadoAreaCirculo resultado) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.calculator_result_title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimaryContainer)),
            const SizedBox(height: 16),
            Text(
              'A = ${_format(resultado.area)} cm²',
               style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontFamily: 'monospace',
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.calculator_calculation_title, style: Theme.of(context).textTheme.labelMedium),
                  const SizedBox(height: 4),
                  Text(
                    resultado.descripcion,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: 'monospace'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
