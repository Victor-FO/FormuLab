import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testcalc/domain/usecases/resolver_tales_usecase.dart';

class CalculadoraTales extends StatefulWidget {
  const CalculadoraTales({super.key});

  @override
  State<CalculadoraTales> createState() => _CalculadoraTalesState();
}

class _CalculadoraTalesState extends State<CalculadoraTales> {
  final _formKey = GlobalKey<FormState>();
  final _aController = TextEditingController();
  final _bController = TextEditingController();
  final _cController = TextEditingController();
  final _dController = TextEditingController();
  final _resolverUseCase = const ResolverTalesUseCase();

  String _variableACalcular = 'd';
  ResultadoTales? _resultado;
  String? _error;

  String _format(double n) => n.toStringAsFixed(2).replaceAll('.', ',');

  @override
  void dispose() {
    _aController.dispose();
    _bController.dispose();
    _cController.dispose();
    _dController.dispose();
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
      final a = _variableACalcular == 'a' ? null : double.tryParse(_aController.text.replaceAll(',', '.'));
      final b = _variableACalcular == 'b' ? null : double.tryParse(_bController.text.replaceAll(',', '.'));
      final c = _variableACalcular == 'c' ? null : double.tryParse(_cController.text.replaceAll(',', '.'));
      final d = _variableACalcular == 'd' ? null : double.tryParse(_dController.text.replaceAll(',', '.'));

      final resultado = _resolverUseCase.ejecutar(a: a, b: b, c: c, d: d);

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
    _aController.clear();
    _bController.clear();
    _cController.clear();
    _dController.clear();
    setState(() {
      _resultado = null;
      _error = null;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                'Calcular Teorema de Tales',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Introduce tres valores para calcular el cuarto.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 24),
              _buildSelectorVariable(context),
              const SizedBox(height: 24),
              _buildTextFormField(
                controller: _aController,
                label: 'Valor a',
                enabled: _variableACalcular != 'a',
              ),
              const SizedBox(height: 16),
              _buildTextFormField(
                controller: _bController,
                label: 'Valor b',
                enabled: _variableACalcular != 'b',
              ),
              const SizedBox(height: 16),
              _buildTextFormField(
                controller: _cController,
                label: 'Valor c',
                enabled: _variableACalcular != 'c',
              ),
               const SizedBox(height: 16),
              _buildTextFormField(
                controller: _dController,
                label: 'Valor d',
                enabled: _variableACalcular != 'd',
              ),
              const SizedBox(height: 24),
              _buildBotones(),
              if (_error != null) _buildErrorWidget(context),
              if (_resultado != null) _buildResultadoWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectorVariable(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quiero calcular:',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        SegmentedButton<String>(
          segments: const [
            ButtonSegment(value: 'a', label: Text('a')),
            ButtonSegment(value: 'b', label: Text('b')),
            ButtonSegment(value: 'c', label: Text('c')),
            ButtonSegment(value: 'd', label: Text('d')),
          ],
          selected: {_variableACalcular},
          onSelectionChanged: (Set<String> newSelection) {
            setState(() {
              _variableACalcular = newSelection.first;
               switch (_variableACalcular) {
                case 'a': _aController.clear(); break;
                case 'b': _bController.clear(); break;
                case 'c': _cController.clear(); break;
                case 'd': _dController.clear(); break;
              }
            });
          },
        ),
      ],
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required bool enabled,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: !enabled,
        fillColor: enabled ? null : Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.4),
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*[,.]?\d*'))],
      enabled: enabled,
      validator: (value) {
        if (enabled) {
          if (value == null || value.isEmpty) {
            return 'Ingresa un valor';
          }
          if (double.tryParse(value.replaceAll(',', '.')) == null) {
            return 'Número inválido';
          }
        }
        return null;
      },
    );
  }

  Widget _buildBotones() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: _calcular,
            icon: const Icon(Icons.calculate),
            label: const Text('Calcular'),
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
            label: const Text('Limpiar'),
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

  Widget _buildResultadoWidget(BuildContext context) {
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
            Text('Resultado', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimaryContainer)),
            const SizedBox(height: 16),
            Text(
              '${_resultado!.variableCalculada} = ${_format(_resultado!.valorCalculado)} cm',
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
                  Text('Cálculo Realizado', style: Theme.of(context).textTheme.labelMedium),
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
