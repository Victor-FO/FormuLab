import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testcalc/domain/usecases/resolver_ecuacion_segundo_grado_usecase.dart';
import 'package:testcalc/domain/usecases/resolver_ecuacion_segundo_grado_fraccion_usecase.dart';
import 'package:testcalc/domain/value_objects/resultado_ecuacion.dart';
import 'package:testcalc/domain/value_objects/resultado_ecuacion_fraccion.dart';
import '../../l10n/app_localizations.dart';

class CalculadoraEcuacionSegundoGrado extends StatefulWidget {
  const CalculadoraEcuacionSegundoGrado({super.key});

  @override
  State<CalculadoraEcuacionSegundoGrado> createState() =>
      _CalculadoraEcuacionSegundoGradoState();
}

class _CalculadoraEcuacionSegundoGradoState
    extends State<CalculadoraEcuacionSegundoGrado> {
  final _formKey = GlobalKey<FormState>();
  final _aController = TextEditingController();
  final _bController = TextEditingController();
  final _cController = TextEditingController();
  final _resolverUseCase = const ResolverEcuacionSegundoGradoUseCase();
  final _resolverFraccionUseCase = const ResolverEcuacionSegundoGradoFraccionUseCase();
  ResultadoEcuacion? _resultado;
  ResultadoEcuacionFraccion? _resultadoFraccion;
  String? _error;

  @override
  void dispose() {
    _aController.dispose();
    _bController.dispose();
    _cController.dispose();
    super.dispose();
  }

  void _calcular() {
    final l10n = AppLocalizations.of(context)!;
    setState(() {
      _resultado = null;
      _resultadoFraccion = null;
      _error = null;
    });

    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      final a = double.parse(_aController.text);
      final b = double.parse(_bController.text);
      final c = double.parse(_cController.text);

      if (a == 0) {
        setState(() {
          _error = l10n.ecuacion_segundo_grado_error_a_zero;
        });
        return;
      }

      final resultadoFraccion = _resolverFraccionUseCase.ejecutar(a: a, b: b, c: c);
      
      if (resultadoFraccion != null && resultadoFraccion.tieneSoluciones) {
        setState(() {
          _resultadoFraccion = resultadoFraccion;
        });
      } else {
        final resultado = _resolverUseCase.ejecutar(a: a, b: b, c: c);
        setState(() {
          _resultado = resultado;
        });
      }
    } catch (e) {
      setState(() {
        _error = l10n.ecuacion_segundo_grado_error_calculating;
      });
    }
  }

  void _limpiar() {
    _aController.clear();
    _bController.clear();
    _cController.clear();
    setState(() {
      _resultado = null;
      _resultadoFraccion = null;
      _error = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calculate,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    l10n.formula_ecuacion_segundo_grado_name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                l10n.formula_ecuacion_segundo_grado_desc,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _aController,
                decoration: InputDecoration(
                  labelText: l10n.ecuacion_segundo_grado_coef_a,
                  hintText: l10n.ecuacion_segundo_grado_ej_a,
                  prefixIcon: const Icon(Icons.numbers),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  signed: true,
                  decimal: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^-?\d*\.?\d*'),
                  ),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.ecuacion_segundo_grado_error_a;
                  }
                  if (double.tryParse(value) == null) {
                    return l10n.calculator_error_invalid_number;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _bController,
                decoration: InputDecoration(
                  labelText: l10n.ecuacion_segundo_grado_coef_b,
                  hintText: l10n.ecuacion_segundo_grado_ej_bb,
                  prefixIcon: const Icon(Icons.numbers),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  signed: true,
                  decimal: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^-?\d*\.?\d*'),
                  ),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.ecuacion_segundo_grado_error_b;
                  }
                  if (double.tryParse(value) == null) {
                    return l10n.calculator_error_invalid_number;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _cController,
                decoration: InputDecoration(
                  labelText: l10n.ecuacion_segundo_grado_coef_c,
                  hintText: l10n.ecuacion_segundo_grado_ej_c,
                  prefixIcon: const Icon(Icons.numbers),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  signed: true,
                  decimal: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^-?\d*\.?\d*'),
                  ),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.ecuacion_segundo_grado_error_c;
                  }
                  if (double.tryParse(value) == null) {
                    return l10n.calculator_error_invalid_number;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Row(
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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (_error != null) ...[
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.errorContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Theme.of(context).colorScheme.onErrorContainer,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _error!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onErrorContainer,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              if (_resultadoFraccion != null) ...[
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            l10n.calculator_result_title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildResultadoFraccion(context, _resultadoFraccion!),
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
                            Text(
                              l10n.ecuacion_segundo_grado_discriminante,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _resultadoFraccion!.obtenerInfoDiscriminante(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontFamily: 'monospace',
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              if (_resultado != null && _resultadoFraccion == null) ...[
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            l10n.calculator_result_title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _resultado!.toLocalizedString(l10n),
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                              fontFamily: 'monospace',
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                      ),
                      if (_resultado is ResultadoDosSoluciones ||
                          _resultado is ResultadoUnaSolucion) ...[
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
                              Text(
                                l10n.ecuacion_segundo_grado_discriminante,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant,
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Δ = ${_resultado!.discriminante.toStringAsFixed(4)}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontFamily: 'monospace',
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultadoFraccion(
    BuildContext context,
    ResultadoEcuacionFraccion resultado,
  ) {
    final l10n = AppLocalizations.of(context)!;
    final solucion = resultado.solucionFraccion;
    final textStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontFamily: 'monospace',
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        );

    if (!solucion.tieneSoluciones) {
      return Text(
        l10n.ecuacion_segundo_grado_no_real_solutions,
        style: textStyle,
      );
    }

    if (solucion.tieneDosSoluciones) {
      final fraccion1 = solucion.fraccion1!.simplificar();
      final fraccion2 = solucion.fraccion2!.simplificar();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'x = ${fraccion1.toString()}',
            style: textStyle,
          ),
          const SizedBox(height: 16),
          Text(
            'x = ${fraccion2.toString()}',
            style: textStyle,
          ),
        ],
      );
    }

    if (solucion.fraccion1 != null) {
      final fraccion = solucion.fraccion1!.simplificar();
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'x = ${fraccion.toString()}',
            style: textStyle,
          ),
          const SizedBox(width: 8),
          Text(
            l10n.ecuacion_segundo_grado_double_root,
            style: textStyle?.copyWith(
              fontStyle: FontStyle.italic,
              fontSize: textStyle.fontSize! * 0.9,
            ),
          ),
        ],
      );
    }

    return Text(
      solucion.toStringDetallado(),
      style: textStyle,
    );
  }
}
