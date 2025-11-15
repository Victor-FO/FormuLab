// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'FormuLab';

  @override
  String get homeWelcome => 'Bienvenido';

  @override
  String get homeSubtitle =>
      'Calculadora para estudiantes de ESO y Bachillerato';

  @override
  String get homeFormulasButton => 'Ver Fórmulas';

  @override
  String get homeFormulasButtonDesc => 'Explora todas las fórmulas disponibles';

  @override
  String get homeQuickCalcButton => 'Calculadora Rápida';

  @override
  String get homeQuickCalcButtonDesc => 'Acceso directo a calculadoras';

  @override
  String get homeStartMessage => 'Selecciona una opción para comenzar';

  @override
  String get language => 'Idioma';

  @override
  String get spanish => 'Español';

  @override
  String get english => 'Inglés';

  @override
  String get french => 'Français';

  @override
  String get german => 'Alemán';

  @override
  String get italian => 'Italiano';

  @override
  String get portuguese => 'Português';

  @override
  String get formulas_searchHint => 'Buscar fórmulas...';

  @override
  String get formulas_categoryAll => 'Todas';

  @override
  String get formulas_categoryESO => 'ESO';

  @override
  String get formulas_categoryBachillerato => 'Bachillerato';

  @override
  String get formulas_noFormulasFound => 'No se encontraron fórmulas';

  @override
  String get formula_formula_title => 'Fórmula';

  @override
  String get formula_explanation_title => 'Explicación';

  @override
  String get formula_example_title => 'Ejemplo';

  @override
  String get formula_topic_title => 'Tema';

  @override
  String get calculator_calculate_button => 'Calcular';

  @override
  String get calculator_clear_button => 'Limpiar';

  @override
  String get calculator_result_title => 'Resultado';

  @override
  String get calculator_calculation_title => 'Cálculo Realizado';

  @override
  String get calculator_error_invalid_number => 'Número inválido';

  @override
  String get calculator_error_enter_value => 'Ingresa un valor';

  @override
  String get pitagoras_title => 'Calcular Teorema de Pitágoras';

  @override
  String get pitagoras_subtitle =>
      'Introduce dos lados para calcular el tercero.';

  @override
  String get pitagoras_var_a => 'Cateto a';

  @override
  String get pitagoras_var_b => 'Cateto b';

  @override
  String get pitagoras_var_c => 'Hipotenusa c';

  @override
  String get pitagoras_i_want_to_calculate => 'Quiero calcular:';

  @override
  String get circulo_title => 'Calcular Área de un Círculo';

  @override
  String get circulo_subtitle =>
      'Introduce el radio (r) para calcular el área.';

  @override
  String get circulo_var_r => 'Radio (r)';

  @override
  String get triangulo_title => 'Calcular Área de un Triángulo';

  @override
  String get triangulo_subtitle => 'Introduce la base (b) y la altura (h).';

  @override
  String get triangulo_var_b => 'Base (b)';

  @override
  String get triangulo_var_h => 'Altura (h)';

  @override
  String get rombo_title => 'Calcular Área de un Rombo';

  @override
  String get rombo_subtitle => 'Introduce las diagonales del rombo.';

  @override
  String get rombo_var_D => 'Diagonal Mayor (D)';

  @override
  String get rombo_var_d => 'Diagonal Menor (d)';

  @override
  String get poligono_title => 'Calcular Área de Polígono Regular';

  @override
  String get poligono_subtitle => 'Introduce los datos del polígono.';

  @override
  String get poligono_var_n => 'Número de lados (n)';

  @override
  String get poligono_var_l => 'Longitud de un lado (l)';

  @override
  String get poligono_var_ap => 'Apotema (ap)';

  @override
  String get esfera_title => 'Calcular Volumen de una Esfera';

  @override
  String get esfera_subtitle =>
      'Introduce el radio (r) para calcular el volumen.';

  @override
  String get esfera_var_r => 'Radio (r)';

  @override
  String get puntos_title => 'Calcular Distancia entre Dos Puntos';

  @override
  String get puntos_subtitle => 'Introduce las coordenadas de los dos puntos.';

  @override
  String get tales_title => 'Calcular Teorema de Tales';

  @override
  String get tales_subtitle =>
      'Introduce tres valores para calcular el cuarto.';

  @override
  String get tales_var_a => 'Valor a';

  @override
  String get tales_var_b => 'Valor b';

  @override
  String get tales_var_c => 'Valor c';

  @override
  String get tales_var_d => 'Valor d';

  @override
  String get formula_ecuacion_segundo_grado_name => 'Ecuación de Segundo Grado';

  @override
  String get formula_ecuacion_segundo_grado_desc =>
      'Fórmula general para resolver ecuaciones cuadráticas';

  @override
  String get formula_ecuacion_segundo_grado_example => '2x² + 5x - 3 = 0';

  @override
  String get formula_ecuacion_segundo_grado_explanation =>
      'La fórmula general para resolver ecuaciones de segundo grado es:\nx = (-b ± √(b² - 4ac)) / 2a\n\nDonde:\n• a, b, c son los coeficientes de la ecuación\n• El discriminante (Δ = b² - 4ac) determina el tipo de soluciones:\n  - Si Δ > 0: dos soluciones reales distintas\n  - Si Δ = 0: una solución real (raíz doble)\n  - Si Δ < 0: no tiene soluciones reales';

  @override
  String get ecuacion_segundo_grado_error_a_zero => 'Valor incorrecto';

  @override
  String get ecuacion_segundo_grado_error_calculating => 'Error al calcular';

  @override
  String get ecuacion_segundo_grado_coef_a => 'Coeficiente a';

  @override
  String get ecuacion_segundo_grado_ej_a => 'Ej(2)';

  @override
  String get ecuacion_segundo_grado_error_a => 'Error en el valor de a';

  @override
  String get ecuacion_segundo_grado_coef_b => 'Coeficiente b';

  @override
  String get ecuacion_segundo_grado_ej_bb => 'Ej(3)';

  @override
  String get ecuacion_segundo_grado_error_b => 'Error en el valor de b';

  @override
  String get ecuacion_segundo_grado_coef_c => 'Coeficiente c';

  @override
  String get ecuacion_segundo_grado_ej_c => 'Ej(-5)';

  @override
  String get ecuacion_segundo_grado_error_c => 'Error en el valor de c';

  @override
  String get ecuacion_segundo_grado_discriminante => 'Discriminante';

  @override
  String get ecuacion_segundo_grado_no_real_solutions => 'No tiene soluciones';

  @override
  String get ecuacion_segundo_grado_double_root => '';

  @override
  String get formula_teorema_pitagoras_name => 'Teorema de Pitágoras';

  @override
  String get formula_teorema_pitagoras_desc =>
      'Relación entre los lados de un triángulo rectángulo';

  @override
  String get formula_teorema_pitagoras_example =>
      'Si a = 3 y b = 4, entonces c = 5';

  @override
  String get formula_teorema_pitagoras_explanation =>
      'En un triángulo rectángulo, el cuadrado de la hipotenusa (c) es igual a la suma de los cuadrados de los catetos (a y b).';

  @override
  String get formula_area_circulo_name => 'Área de un Círculo';

  @override
  String get formula_area_circulo_desc =>
      'Fórmula para calcular el área de un círculo';

  @override
  String get formula_area_circulo_example =>
      'Si r = 5, entonces A = π × 25 ≈ 78.54';

  @override
  String get formula_area_circulo_explanation =>
      'El área de un círculo se calcula multiplicando π (pi) por el radio al cuadrado. π ≈ 3.14159';

  @override
  String get formula_area_triangulo_name => 'Área de un Triángulo';

  @override
  String get formula_area_triangulo_desc =>
      'Fórmula para calcular el área de un triángulo';

  @override
  String get formula_area_triangulo_example =>
      'Si la base (b) es 10 y la altura (h) es 5, el área es 25';

  @override
  String get formula_area_triangulo_explanation =>
      'El área de un triángulo se calcula multiplicando la longitud de la base (b) por la altura (h) y dividiendo el resultado entre dos.';

  @override
  String get formula_area_rombo_name => 'Área de un Rombo';

  @override
  String get formula_area_rombo_desc =>
      'Fórmula para calcular el área de un rombo';

  @override
  String get formula_area_rombo_example =>
      'Si la diagonal mayor (D) es 8 y la menor (d) es 6, el área es 24 cm².';

  @override
  String get formula_area_rombo_explanation =>
      'El área de un rombo se calcula multiplicando la diagonal mayor (D) por la diagonal menor (d) y dividiendo el resultado entre dos.';

  @override
  String get formula_area_poligono_regular_name => 'Área de Polígono Regular';

  @override
  String get formula_area_poligono_regular_desc =>
      'Fórmula para calcular el área de un polígono regular';

  @override
  String get formula_area_poligono_regular_example =>
      'Para un pentágono (5 lados) de lado 6cm y apotema 4.1cm, el Área es (30 × 4.1) / 2 = 61.5 cm²';

  @override
  String get formula_area_poligono_regular_explanation =>
      'El área de un polígono regular se calcula con el Perímetro (P) y la Apotema (ap). El perímetro es el número de lados (n) por la longitud de un lado (l). La apotema es la distancia del centro a cualquiera de los lados.';

  @override
  String get formula_volumen_esfera_name => 'Volumen de una Esfera';

  @override
  String get formula_volumen_esfera_desc =>
      'Fórmula para calcular el volumen de una esfera';

  @override
  String get formula_volumen_esfera_example =>
      'Si r = 3, entonces V = (4/3)π × 27 ≈ 113.10';

  @override
  String get formula_volumen_esfera_explanation =>
      'El volumen de una esfera se calcula multiplicando (4/3)π por el radio elevado al cubo.';

  @override
  String get formula_distancia_dos_puntos_name => 'Distancia entre Dos Puntos';

  @override
  String get formula_distancia_dos_puntos_desc =>
      'Fórmula para calcular la distancia entre dos puntos en el plano';

  @override
  String get formula_distancia_dos_puntos_example =>
      'P₁(2, 3) y P₂(5, 7): d = √[(5-2)² + (7-3)²] = √(9+16) = 5';

  @override
  String get formula_distancia_dos_puntos_explanation =>
      'La distancia entre dos puntos P₁(x₁, y₁) y P₂(x₂, y₂) se calcula usando el teorema de Pitágoras en el plano cartesiano.';

  @override
  String get formula_teorema_tales_name => 'Teorema de Tales';

  @override
  String get formula_teorema_tales_desc =>
      'Relación de proporcionalidad en la semejanza de triángulos';

  @override
  String get formula_teorema_tales_example =>
      'Si a=4, b=2 y c=6, entonces d=(2*6)/4=3';

  @override
  String get formula_teorema_tales_explanation =>
      'El teorema de Tales establece que si dos rectas secantes son cortadas por rectas paralelas, los segmentos que se forman son proporcionales.\nEn el contexto de triángulos semejantes, si tenemos un triángulo grande con lados A y C, y un triángulo más pequeño dentro con lados B y D correspondientes, la relación se mantiene: A/B = C/D.';
}
