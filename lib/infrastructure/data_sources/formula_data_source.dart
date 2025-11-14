import 'package:testcalc/domain/entities/formula.dart';

/// Fuente de datos para fórmulas (puede ser memoria, base de datos, API, etc.)
abstract class FormulaDataSource {
  Future<List<Formula>> obtenerTodas();
  Future<Formula?> obtenerPorId(String id);
}

/// Implementación en memoria de la fuente de datos
class FormulaMemoryDataSource implements FormulaDataSource {
  final List<Formula> _formulas = [
    const Formula(
      id: 'ecuacion_segundo_grado',
      nombre: 'formula_ecuacion_segundo_grado_name', // Clave de traducción
      descripcion: 'formula_ecuacion_segundo_grado_desc',
      formula: 'ax² + bx + c = 0',
      categoria: 'Bachillerato',
      tema: 'Álgebra',
      variables: ['a', 'b', 'c'],
      ejemplo: 'formula_ecuacion_segundo_grado_example',
      explicacion: 'formula_ecuacion_segundo_grado_explanation',
    ),
    const Formula(
      id: 'teorema_pitagoras',
      nombre: 'formula_teorema_pitagoras_name',
      descripcion: 'formula_teorema_pitagoras_desc',
      formula: 'a² + b² = c²',
      categoria: 'ESO',
      tema: 'Geometría',
      variables: ['a', 'b', 'c'],
      ejemplo: 'formula_teorema_pitagoras_example',
      explicacion: 'formula_teorema_pitagoras_explanation',
    ),
    const Formula(
      id: 'area_circulo',
      nombre: 'formula_area_circulo_name',
      descripcion: 'formula_area_circulo_desc',
      formula: 'A = πr²',
      categoria: 'ESO',
      tema: 'Geometría',
      variables: ['r'],
      ejemplo: 'formula_area_circulo_example',
      explicacion: 'formula_area_circulo_explanation',
    ),
    const Formula(
      id: 'area_triangulo',
      nombre: 'formula_area_triangulo_name',
      descripcion: 'formula_area_triangulo_desc',
      formula: 'A = (b × h) / 2',
      categoria: 'ESO',
      tema: 'Geometría',
      variables: ['b', 'h'],
      ejemplo: 'formula_area_triangulo_example',
      explicacion: 'formula_area_triangulo_explanation',
    ),
    const Formula(
      id: 'area_rombo',
      nombre: 'formula_area_rombo_name',
      descripcion: 'formula_area_rombo_desc',
      formula: 'A = (D × d) / 2',
      categoria: 'ESO',
      tema: 'Geometría',
      variables: ['D', 'd'],
      ejemplo: 'formula_area_rombo_example',
      explicacion: 'formula_area_rombo_explanation',
    ),
    const Formula(
      id: 'area_poligono_regular',
      nombre: 'formula_area_poligono_regular_name',
      descripcion: 'formula_area_poligono_regular_desc',
      formula: 'A = (P × ap) / 2',
      categoria: 'ESO',
      tema: 'Geometría',
      variables: ['n', 'l', 'ap'],
      ejemplo: 'formula_area_poligono_regular_example',
      explicacion: 'formula_area_poligono_regular_explanation',
    ),
    const Formula(
      id: 'volumen_esfera',
      nombre: 'formula_volumen_esfera_name',
      descripcion: 'formula_volumen_esfera_desc',
      formula: 'V = (4/3)πr³',
      categoria: 'Bachillerato',
      tema: 'Geometría',
      variables: ['r'],
      ejemplo: 'formula_volumen_esfera_example',
      explicacion: 'formula_volumen_esfera_explanation',
    ),
    const Formula(
      id: 'distancia_dos_puntos',
      nombre: 'formula_distancia_dos_puntos_name',
      descripcion: 'formula_distancia_dos_puntos_desc',
      formula: 'd = √[(x₂ - x₁)² + (y₂ - y₁)²]',
      categoria: 'Bachillerato',
      tema: 'Geometría Analítica',
      variables: ['x₁', 'y₁', 'x₂', 'y₂'],
      ejemplo: 'formula_distancia_dos_puntos_example',
      explicacion: 'formula_distancia_dos_puntos_explanation',
    ),
    const Formula(
      id: 'teorema_tales',
      nombre: 'formula_teorema_tales_name',
      descripcion: 'formula_teorema_tales_desc',
      formula: 'a/b = c/d',
      categoria: 'ESO',
      tema: 'Geometría',
      variables: ['a', 'b', 'c', 'd'],
      ejemplo: 'formula_teorema_tales_example',
      explicacion: 'formula_teorema_tales_explanation',
    ),
  ];

  @override
  Future<List<Formula>> obtenerTodas() async {
    // Ordenar por clave de traducción, para que el orden sea consistente
    _formulas.sort((a, b) => a.nombre.compareTo(b.nombre));
    return List.unmodifiable(_formulas);
  }

  @override
  Future<Formula?> obtenerPorId(String id) async {
    try {
      return _formulas.firstWhere((f) => f.id == id);
    } catch (e) {
      return null;
    }
  }
}
