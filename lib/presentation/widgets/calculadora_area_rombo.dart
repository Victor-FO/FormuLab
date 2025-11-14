import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testcalc/domain/usecases/resolver_area_rombo_usecase.dart';

class CalculadoraAreaRombo extends StatefulWidget {
  const CalculadoraAreaRombo({super.key});

  @override
  State<CalculadoraAreaRombo> createState() => _CalculadoraAreaRomboState();
}

class _CalculadoraAreaRomboState extends State<CalculadoraAreaRombo> {
  final _formKey = GlobalKey<FormState>();
  final _DController = TextEditingController();
  final _dController = TextEditingController();
  final _resolverUseCase = const ResolverAreaRomboUseCase();

  ResultadoAreaRombo? _resultado;
  String? _error;

  String _format(double n) => n.toStringAsFixed(2).replaceAll('.', ',');

  @override
  void dispose() {
    _DController.dispose();
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
      final D = double.parse(_DController.text.replaceAll(',', '.'));
      final d = double.parse(_dController.text.replaceAll(',', '.'));
      final resultado = _resolverUseCase.ejecutar(D: D, d: d);
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
    _DController.clear();
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
                'Calcular Área de un Rombo',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Introduce las diagonales del rombo.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 24),
              _buildTextFormField(_DController, 'Diagonal Mayor (D)'),
              const SizedBox(height: 16),
              _buildTextFormField(_dController, 'Diagonal Menor (d)'),
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

  Widget _buildTextFormField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*[,.]?\d*'))],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Ingresa un valor';
        }
        if (double.tryParse(value.replaceAll(',', '.')) == null) {
          return 'Número inválido';
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
              'A = ${_format(_resultado!.area)} cm²',
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
