import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testcalc/domain/usecases/resolver_area_poligono_regular_usecase.dart';

class CalculadoraAreaPoligonoRegular extends StatefulWidget {
  const CalculadoraAreaPoligonoRegular({super.key});

  @override
  State<CalculadoraAreaPoligonoRegular> createState() => _CalculadoraAreaPoligonoRegularState();
}

class _CalculadoraAreaPoligonoRegularState extends State<CalculadoraAreaPoligonoRegular> {
  final _formKey = GlobalKey<FormState>();
  final _nController = TextEditingController();
  final _lController = TextEditingController();
  final _apController = TextEditingController();
  final _resolverUseCase = const ResolverAreaPoligonoRegularUseCase();

  ResultadoAreaPoligonoRegular? _resultado;
  String? _error;

  String _format(double n) => n.toStringAsFixed(2).replaceAll('.', ',');

  @override
  void dispose() {
    _nController.dispose();
    _lController.dispose();
    _apController.dispose();
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
      final n = int.parse(_nController.text);
      final l = double.parse(_lController.text.replaceAll(',', '.'));
      final ap = double.parse(_apController.text.replaceAll(',', '.'));
      final resultado = _resolverUseCase.ejecutar(n: n, l: l, ap: ap);
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
    _nController.clear();
    _lController.clear();
    _apController.clear();
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
                'Calcular Área de Polígono Regular',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Introduce los datos del polígono.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 24),
              _buildTextFormField(
                _nController, 
                'Número de lados (n)',
                isInteger: true,
              ),
              const SizedBox(height: 16),
              _buildTextFormField(
                _lController, 
                'Longitud de un lado (l)',
              ),
              const SizedBox(height: 16),
              _buildTextFormField(
                _apController, 
                'Apotema (ap)',
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

  Widget _buildTextFormField(TextEditingController controller, String label, {bool isInteger = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      keyboardType: isInteger 
          ? const TextInputType.numberWithOptions(signed: false, decimal: false) 
          : const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: isInteger
          ? [FilteringTextInputFormatter.digitsOnly]
          : [FilteringTextInputFormatter.allow(RegExp(r'^\d*[,.]?\d*'))],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Ingresa un valor';
        }
        if (isInteger) {
          if (int.tryParse(value) == null) return 'Número entero inválido';
        } else {
          if (double.tryParse(value.replaceAll(',', '.')) == null) return 'Número inválido';
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
              'Área = ${_format(_resultado!.area)} cm²',
               style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontFamily: 'monospace',
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 8),
             Text(
              'Perímetro = ${_format(_resultado!.perimetro)} cm',
               style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontFamily: 'monospace',
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
