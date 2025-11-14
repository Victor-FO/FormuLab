import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testcalc/domain/usecases/resolver_ecuacion_segundo_grado_usecase.dart';
import 'package:testcalc/domain/usecases/resolver_ecuacion_segundo_grado_fraccion_usecase.dart';
import 'package:testcalc/domain/value_objects/resultado_ecuacion.dart';
import 'package:testcalc/domain/value_objects/resultado_ecuacion_fraccion.dart';

/// Widget que implementa la calculadora de ecuaciones de segundo grado
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
          _error = 'El coeficiente "a" no puede ser cero';
        });
        return;
      }

      // Intentar primero resolver con fracciones (si los coeficientes son enteros)
      final resultadoFraccion = _resolverFraccionUseCase.ejecutar(a: a, b: b, c: c);
      
      if (resultadoFraccion != null && resultadoFraccion.tieneSoluciones) {
        setState(() {
          _resultadoFraccion = resultadoFraccion;
        });
      } else {
        // Si no se puede resolver con fracciones, usar el método decimal
        final resultado = _resolverUseCase.ejecutar(a: a, b: b, c: c);
        setState(() {
          _resultado = resultado;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error al calcular: ${e.toString()}';
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
                    'Calculadora',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Ingresa los coeficientes de la ecuación ax² + bx + c = 0',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 24),
              // Campo para coeficiente a
              TextFormField(
                controller: _aController,
                decoration: InputDecoration(
                  labelText: 'Coeficiente a',
                  hintText: 'Ej: 2',
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
                    return 'Ingresa el coeficiente a';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Ingresa un número válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Campo para coeficiente b
              TextFormField(
                controller: _bController,
                decoration: InputDecoration(
                  labelText: 'Coeficiente b',
                  hintText: 'Ej: 5',
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
                    return 'Ingresa el coeficiente b';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Ingresa un número válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Campo para coeficiente c
              TextFormField(
                controller: _cController,
                decoration: InputDecoration(
                  labelText: 'Coeficiente c',
                  hintText: 'Ej: -3',
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
                    return 'Ingresa el coeficiente c';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Ingresa un número válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              // Botones
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _calcular,
                      icon: const Icon(Icons.calculate),
                      label: const Text('Calcular'),
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
                      label: const Text('Limpiar'),
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
              // Resultado o error
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
              // Mostrar resultado con fracciones
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
                            'Resultado',
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
                              'Discriminante (Δ)',
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
              // Mostrar resultado con decimales (fallback)
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
                            'Resultado',
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
                        _resultado!.toString(),
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
                                'Discriminante (Δ)',
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
    final solucion = resultado.solucionFraccion;
    final textStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontFamily: 'monospace',
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        );

    if (!solucion.tieneSoluciones) {
      return Text(
        'No tiene soluciones reales (Δ = ${solucion.discriminante} < 0)',
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

    // Una solución (raíz doble)
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
            '(raíz doble)',
            style: textStyle?.copyWith(
              fontStyle: FontStyle.italic,
              fontSize: textStyle.fontSize! * 0.9,
            ),
          ),
        ],
      );
    }

    // Fallback
    return Text(
      solucion.toStringDetallado(),
      style: textStyle,
    );
  }
}
