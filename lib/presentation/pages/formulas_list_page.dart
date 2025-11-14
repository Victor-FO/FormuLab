import 'package:flutter/material.dart';
import 'package:testcalc/domain/entities/formula.dart';
import 'package:testcalc/domain/usecases/obtener_formulas_usecase.dart';
import 'package:testcalc/infrastructure/data_sources/formula_data_source.dart';
import 'package:testcalc/infrastructure/repositories/formula_repository_impl.dart';
import 'package:testcalc/presentation/pages/formula_detail_page.dart';
import 'package:testcalc/presentation/utils/localization_utils.dart';
import '../../l10n/app_localizations.dart';

class FormulasListPage extends StatefulWidget {
  const FormulasListPage({super.key});

  @override
  State<FormulasListPage> createState() => _FormulasListPageState();
}

class _FormulasListPageState extends State<FormulasListPage> {
  late final ObtenerFormulasUseCase _obtenerFormulasUseCase;
  List<Formula> _formulas = [];
  List<Formula> _formulasFiltradas = [];
  bool _isLoading = true;
  // Usamos el nombre interno/clave para el estado del filtro
  String _categoriaFiltro = 'Todas'; 
  String _busqueda = '';

  @override
  void initState() {
    super.initState();
    final dataSource = FormulaMemoryDataSource();
    final repository = FormulaRepositoryImpl(dataSource);
    _obtenerFormulasUseCase = ObtenerFormulasUseCase(repository);
    _cargarFormulas();
  }

  Future<void> _cargarFormulas() async {
    setState(() => _isLoading = true);
    try {
      final formulas = await _obtenerFormulasUseCase.ejecutar();
      setState(() {
        _formulas = formulas;
        _aplicarFiltros();
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar fórmulas: $e')),
        );
      }
    }
  }

  void _aplicarFiltros() {
    var filtradas = _formulas;

    // 1. Filtrar por categoría (usando el nombre interno)
    if (_categoriaFiltro != 'Todas') {
      filtradas = filtradas.where((f) => f.categoria == _categoriaFiltro).toList();
    }

    // 2. Filtrar por búsqueda (usando los textos traducidos)
    if (_busqueda.isNotEmpty) {
      final busquedaLower = _busqueda.toLowerCase();
      if (mounted) {
        filtradas = filtradas.where((f) {
          return tr(context, f.nombre).toLowerCase().contains(busquedaLower) ||
              tr(context, f.descripcion).toLowerCase().contains(busquedaLower) ||
              f.tema.toLowerCase().contains(busquedaLower);
        }).toList();
      }
    }

    setState(() => _formulasFiltradas = filtradas);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // Mapa de claves internas de categorías a sus nombres traducidos
    final categorias = {
      'Todas': l10n.formulas_categoryAll,
      'ESO': l10n.formulas_categoryESO,
      'Bachillerato': l10n.formulas_categoryBachillerato,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.homeFormulasButton),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 2,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: l10n.formulas_searchHint,
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _busqueda = value;
                  _aplicarFiltros();
                });
              },
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: categorias.entries.map((entry) {
                final internalName = entry.key;
                final displayName = entry.value;
                final isSelected = _categoriaFiltro == internalName;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FilterChip(
                    label: Text(displayName),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        // Actualizamos el estado con el nombre interno
                        _categoriaFiltro = internalName;
                        _aplicarFiltros();
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _formulasFiltradas.isEmpty
                    ? Center(
                        child: Text(l10n.formulas_noFormulasFound),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(16.0),
                        itemCount: _formulasFiltradas.length,
                        itemBuilder: (context, index) {
                          final formula = _formulasFiltradas[index];
                          return _buildFormulaCard(context, formula);
                        },
                      ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormulaCard(BuildContext context, Formula formula) {
    final l10n = AppLocalizations.of(context)!;
    // Obtenemos la traducción correcta de la categoría
    final categoryDisplayName = formula.categoria == 'ESO'
        ? l10n.formulas_categoryESO
        : l10n.formulas_categoryBachillerato;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormulaDetailPage(formula: formula),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      tr(context, formula.nombre), // Usar traducción
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: formula.categoria == 'ESO'
                          ? Colors.blue.shade100
                          : Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      categoryDisplayName, // Usar la traducción correcta
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: formula.categoria == 'ESO'
                            ? Colors.blue.shade900
                            : Colors.purple.shade900,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                tr(context, formula.descripcion), // Usar traducción
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.functions, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        formula.formula,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontFamily: 'monospace',
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
