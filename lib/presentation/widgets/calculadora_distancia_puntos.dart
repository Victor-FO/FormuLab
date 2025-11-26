import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testcalc/domain/usecases/resolver_distancia_puntos_usecase.dart';
import '../../l10n/app_localizations.dart';

class CalculadoraDistanciaPuntos extends StatefulWidget {
  const CalculadoraDistanciaPuntos({super.key});

  @override
  State<CalculadoraDistanciaPuntos> createState() => _CalculadoraDistanciaPuntosState();
}

class _CalculadoraDistanciaPuntosState extends State<CalculadoraDistanciaPuntos> {
  final _formKey = GlobalKey<FormState>();
  final _x1Controller = TextEditingController();
  final _y1Controller = TextEditingController();
  final _x2Controller = TextEditingController();
  final _y2Controller = TextEditingController();
  final _resolverUseCase = const ResolverDistanciaPuntosUseCase();

  ResultadoDistanciaPuntos? _resultado;
  String? _error;

  String _format(double n) => n.toStringAsFixed(2).replaceAll('.', ',');

  @override
  void dispose() {
    _x1Controller.dispose();
    _y1Controller.dispose();
    _x2Controller.dispose();
    _y2Controller.dispose();
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
      final x1 = double.parse(_x1Controller.text.replaceAll(',', '.'));
      final y1 = double.parse(_y1Controller.text.replaceAll(',', '.'));
      final x2 = double.parse(_x2Controller.text.replaceAll(',', '.'));
      final y2 = double.parse(_y2Controller.text.replaceAll(',', '.'));
      
      final resultado = _resolverUseCase.ejecutar(x1: x1, y1: y1, x2: x2, y2: y2);
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
    _x1Controller.clear();
    _y1Controller.clear();
    _x2Controller.clear();
    _y2Controller.clear();
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
                l10n.puntos_title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.puntos_subtitle,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(child: _buildTextFormField(_x1Controller, l10n.puntos_subtitle, l10n)),
                  const SizedBox(width: 16),
                  Expanded(child: _buildTextFormField(_y1Controller, l10n.puntos_subtitle, l10n)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildTextFormField(_x2Controller, l10n.puntos_subtitle, l10n)),
                  const SizedBox(width: 16),
                  Expanded(child: _buildTextFormField(_y2Controller, l10n.puntos_subtitle, l10n)),
                ],
              ),
              const SizedBox(height: 24),
              _buildBotones(l10n),
              if (_error != null) _buildErrorWidget(context),
              if (_resultado != null) _buildResultadoWidget(context, l10n),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(TextEditingController controller, String label, AppLocalizations l10n) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^-?\d*[,.]?\d*'))],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return l10n.calculator_error_enter_value;
        }
        if (double.tryParse(value.replaceAll(',', '.')) == null) {
          return l10n.calculator_error_invalid_number;
        }
        return null;
      },
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Theme.of(context).colorScheme.outline, width: 1),
              ),
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

  Widget _buildErrorWidget(BuildContext context) {
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
                _error!,
                style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultadoWidget(BuildContext context, AppLocalizations l10n) {
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
              'd = ${_format(_resultado!.distancia)} cm',
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
                    _resultado!.descripcion,
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
