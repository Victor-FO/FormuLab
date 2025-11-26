// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'FormuLab';

  @override
  String get homeWelcome => 'Welcome';

  @override
  String get homeSubtitle => 'Formula calculator for high school students';

  @override
  String get homeFormulasButton => 'View Formulas';

  @override
  String get homeFormulasButtonDesc => 'Explore all available formulas';

  @override
  String get homeQuickCalcButton => 'Quick Calculator';

  @override
  String get homeQuickCalcButtonDesc => 'Direct access to calculate formulas';

  @override
  String get homeStartMessage => 'Select an option to start';

  @override
  String get language => 'Language';

  @override
  String get spanish => 'Spanish';

  @override
  String get english => 'English';

  @override
  String get french => 'French';

  @override
  String get german => 'German';

  @override
  String get italian => 'Italian';

  @override
  String get portuguese => 'Portuguese';

  @override
  String get formulas_searchHint => 'Search formulas...';

  @override
  String get formulas_categoryAll => 'All';

  @override
  String get formulas_categoryESO => 'Middle School';

  @override
  String get formulas_categoryBachillerato => 'High School';

  @override
  String get formulas_noFormulasFound => 'No formulas found';

  @override
  String get formula_formula_title => 'Formula';

  @override
  String get formula_explanation_title => 'Explanation';

  @override
  String get formula_example_title => 'Example';

  @override
  String get formula_topic_title => 'Topic';

  @override
  String get calculator_calculate_button => 'Calculate';

  @override
  String get calculator_clear_button => 'Clear';

  @override
  String get calculator_result_title => 'Result';

  @override
  String get calculator_calculation_title => 'Calculation Done';

  @override
  String get calculator_error_invalid_number => 'Invalid number';

  @override
  String get calculator_error_enter_value => 'Please enter a value';

  @override
  String get pitagoras_title => 'Calculate Pythagorean Theorem';

  @override
  String get pitagoras_subtitle => 'Enter two sides to calculate the third.';

  @override
  String get pitagoras_var_a => 'Side a';

  @override
  String get pitagoras_var_b => 'Side b';

  @override
  String get pitagoras_var_c => 'Hypotenuse c';

  @override
  String get pitagoras_i_want_to_calculate => 'I want to calculate:';

  @override
  String get circulo_title => 'Calculate Area of a Circle';

  @override
  String get circulo_subtitle => 'Enter the radius (r) to calculate the area.';

  @override
  String get circulo_var_r => 'Radius (r)';

  @override
  String get triangulo_title => 'Calculate Area of a Triangle';

  @override
  String get triangulo_subtitle => 'Enter the base (b) and height (h).';

  @override
  String get triangulo_var_b => 'Base (b)';

  @override
  String get triangulo_var_h => 'Height (h)';

  @override
  String get rombo_title => 'Calculate Area of a Rhombus';

  @override
  String get rombo_subtitle => 'Enter the diagonals of the rhombus.';

  @override
  String get rombo_var_D => 'Major Diagonal (D)';

  @override
  String get rombo_var_d => 'Minor Diagonal (d)';

  @override
  String get poligono_title => 'Calculate Area of a Regular Polygon';

  @override
  String get poligono_subtitle => 'Enter the polygon data.';

  @override
  String get poligono_var_n => 'Number of sides (n)';

  @override
  String get poligono_var_l => 'Length of a side (l)';

  @override
  String get poligono_var_ap => 'Apothem (ap)';

  @override
  String get esfera_title => 'Calculate Volume of a Sphere';

  @override
  String get esfera_subtitle => 'Enter the radius (r) to calculate the volume.';

  @override
  String get esfera_var_r => 'Radius (r)';

  @override
  String get puntos_title => 'Calculate Distance Between Two Points';

  @override
  String get puntos_subtitle => 'Enter the coordinates of the two points.';

  @override
  String get tales_title => 'Calculate Thales\'s Theorem';

  @override
  String get tales_subtitle => 'Enter three values to calculate the fourth.';

  @override
  String get tales_var_a => 'Value a';

  @override
  String get tales_var_b => 'Value b';

  @override
  String get tales_var_c => 'Value c';

  @override
  String get tales_var_d => 'Value d';

  @override
  String get formula_ecuacion_segundo_grado_name => 'Quadratic Equation';

  @override
  String get formula_ecuacion_segundo_grado_desc =>
      'General formula to solve quadratic equations';

  @override
  String get formula_ecuacion_segundo_grado_example => '2x² + 5x - 3 = 0';

  @override
  String get formula_ecuacion_segundo_grado_explanation =>
      'The general formula to solve quadratic equations is:\nx = (-b ± √(b² - 4ac)) / 2a\n\nWhere:\n• a, b, c are the coefficients of the equation\n• The discriminant (Δ = b² - 4ac) determines the type of solutions:\n  - If Δ > 0: two distinct real solutions\n  - If Δ = 0: one real solution (double root)\n  - If Δ < 0: no real solutions';

  @override
  String get ecuacion_segundo_grado_error_a_zero => 'Incorrect value';

  @override
  String get ecuacion_segundo_grado_error_calculating => 'Error calculating';

  @override
  String get ecuacion_segundo_grado_coef_a => 'Coefficient a';

  @override
  String get ecuacion_segundo_grado_ej_a => 'Ex(2)';

  @override
  String get ecuacion_segundo_grado_error_a => 'Error in value of a';

  @override
  String get ecuacion_segundo_grado_coef_b => 'Coefficient b';

  @override
  String get ecuacion_segundo_grado_ej_bb => 'Ex(3)';

  @override
  String get ecuacion_segundo_grado_error_b => 'Error in value of b';

  @override
  String get ecuacion_segundo_grado_coef_c => 'Coefficient c';

  @override
  String get ecuacion_segundo_grado_ej_c => 'Ex(-5)';

  @override
  String get ecuacion_segundo_grado_error_c => 'Error in value of c';

  @override
  String get ecuacion_segundo_grado_discriminante => 'Discriminant';

  @override
  String get ecuacion_segundo_grado_no_real_solutions => 'No solutions';

  @override
  String get ecuacion_segundo_grado_double_root => '(double root)';

  @override
  String get formula_teorema_pitagoras_name => 'Pythagorean Theorem';

  @override
  String get formula_teorema_pitagoras_desc =>
      'Relationship between the sides of a right triangle';

  @override
  String get formula_teorema_pitagoras_example =>
      'If a = 3 and b = 4, then c = 5';

  @override
  String get formula_teorema_pitagoras_explanation =>
      'In a right triangle, the square of the hypotenuse (c) is equal to the sum of the squares of the other two sides (a and b).';

  @override
  String get formula_area_circulo_name => 'Area of a Circle';

  @override
  String get formula_area_circulo_desc =>
      'Formula to calculate the area of a circle';

  @override
  String get formula_area_circulo_example =>
      'If r = 5, then A = π × 25 ≈ 78.54';

  @override
  String get formula_area_circulo_explanation =>
      'The area of a circle is calculated by multiplying π (pi) by the radius squared. π ≈ 3.14159';

  @override
  String get formula_area_triangulo_name => 'Area of a Triangle';

  @override
  String get formula_area_triangulo_desc =>
      'Formula to calculate the area of a triangle';

  @override
  String get formula_area_triangulo_example =>
      'If the base (b) is 10 and the height (h) is 5, the area is 25';

  @override
  String get formula_area_triangulo_explanation =>
      'The area of a triangle is calculated by multiplying the length of the base (b) by the height (h) and dividing the result by two.';

  @override
  String get formula_area_rombo_name => 'Area of a Rhombus';

  @override
  String get formula_area_rombo_desc =>
      'Formula to calculate the area of a rhombus';

  @override
  String get formula_area_rombo_example =>
      'If the major diagonal (D) is 8 and the minor diagonal (d) is 6, the area is 24 cm².';

  @override
  String get formula_area_rombo_explanation =>
      'The area of a rhombus is calculated by multiplying the major diagonal (D) by the minor diagonal (d) and dividing the result by two.';

  @override
  String get formula_area_poligono_regular_name => 'Area of a Regular Polygon';

  @override
  String get formula_area_poligono_regular_desc =>
      'Formula to calculate the area of a regular polygon';

  @override
  String get formula_area_poligono_regular_example =>
      'For a pentagon (5 sides) with a side length of 6cm and an apothem of 4.1cm, the Area is (30 × 4.1) / 2 = 61.5 cm²';

  @override
  String get formula_area_poligono_regular_explanation =>
      'The area of a regular polygon is calculated with the Perimeter (P) and the Apothem (ap). The perimeter is the number of sides (n) times the length of a side (l). The apothem is the distance from the center to any of the sides.';

  @override
  String get formula_volumen_esfera_name => 'Volume of a Sphere';

  @override
  String get formula_volumen_esfera_desc =>
      'Formula to calculate the volume of a sphere';

  @override
  String get formula_volumen_esfera_example =>
      'If r = 3, then V = (4/3)π × 27 ≈ 113.10';

  @override
  String get formula_volumen_esfera_explanation =>
      'The volume of a sphere is calculated by multiplying (4/3)π by the radius cubed.';

  @override
  String get formula_distancia_dos_puntos_name => 'Distance Between Two Points';

  @override
  String get formula_distancia_dos_puntos_desc =>
      'Formula to calculate the distance between two points on a plane';

  @override
  String get formula_distancia_dos_puntos_example =>
      'P₁(2, 3) and P₂(5, 7): d = √[(5-2)² + (7-3)²] = √(9+16) = 5';

  @override
  String get formula_distancia_dos_puntos_explanation =>
      'The distance between two points P₁(x₁, y₁) and P₂(x₂, y₂) is calculated using the Pythagorean theorem on the Cartesian plane.';

  @override
  String get formula_teorema_tales_name => 'Thales\'s Theorem';

  @override
  String get formula_teorema_tales_desc =>
      'Proportionality relationship in the similarity of triangles';

  @override
  String get formula_teorema_tales_example =>
      'If a=4, b=2 and c=6, then d=(2*6)/4=3';

  @override
  String get formula_teorema_tales_explanation =>
      'Thales\'s theorem states that if two intersecting lines are cut by parallel lines, the segments that are formed are proportional.\nIn the context of similar triangles, if we have a large triangle with sides A and C, and a smaller triangle inside with corresponding sides B and D, the relationship holds: A/B = C/D.';

  @override
  String get infoText =>
      'Send your doubts or suggestions to littlethingslab@proton.me';

  @override
  String get cerrarText => 'Close';
}
