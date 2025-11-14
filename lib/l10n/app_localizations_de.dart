// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Formelrechner';

  @override
  String get homeWelcome => 'Willkommen';

  @override
  String get homeSubtitle => 'Rechner für Gymnasiasten';

  @override
  String get homeFormulasButton => 'Formeln Anzeigen';

  @override
  String get homeFormulasButtonDesc => 'Entdecken Sie alle verfügbaren Formeln';

  @override
  String get homeQuickCalcButton => 'Schnellrechner';

  @override
  String get homeQuickCalcButtonDesc => 'Direkter Zugriff auf Rechner';

  @override
  String get homeStartMessage => 'Wählen Sie eine Option, um zu beginnen';

  @override
  String get language => 'Sprache';

  @override
  String get spanish => 'Spanisch';

  @override
  String get english => 'Englisch';

  @override
  String get french => 'Französisch';

  @override
  String get german => 'Deutsch';

  @override
  String get italian => 'Italienisch';

  @override
  String get portuguese => 'Portugiesisch';

  @override
  String get formulas_searchHint => 'Formeln suchen...';

  @override
  String get formulas_categoryAll => 'Alle';

  @override
  String get formulas_categoryESO => 'Mittelstufe';

  @override
  String get formulas_categoryBachillerato => 'Oberstufe';

  @override
  String get formulas_noFormulasFound => 'Keine Formeln gefunden';

  @override
  String get formula_formula_title => 'Formel';

  @override
  String get formula_explanation_title => 'Erklärung';

  @override
  String get formula_example_title => 'Beispiel';

  @override
  String get formula_topic_title => 'Thema';

  @override
  String get calculator_calculate_button => 'Berechnen';

  @override
  String get calculator_clear_button => 'Löschen';

  @override
  String get calculator_result_title => 'Ergebnis';

  @override
  String get calculator_calculation_title => 'Berechnung Durchgeführt';

  @override
  String get calculator_error_invalid_number => 'Ungültige Nummer';

  @override
  String get calculator_error_enter_value => 'Bitte geben Sie einen Wert ein';

  @override
  String get pitagoras_title => 'Satz des Pythagoras berechnen';

  @override
  String get pitagoras_subtitle =>
      'Geben Sie zwei Seiten ein, um die dritte zu berechnen.';

  @override
  String get pitagoras_var_a => 'Kathete a';

  @override
  String get pitagoras_var_b => 'Kathete b';

  @override
  String get pitagoras_var_c => 'Hypotenuse c';

  @override
  String get pitagoras_i_want_to_calculate => 'Ich möchte berechnen:';

  @override
  String get circulo_title => 'Fläche eines Kreises berechnen';

  @override
  String get circulo_subtitle =>
      'Geben Sie den Radius (r) ein, um die Fläche zu berechnen.';

  @override
  String get circulo_var_r => 'Radius (r)';

  @override
  String get triangulo_title => 'Fläche eines Dreiecks berechnen';

  @override
  String get triangulo_subtitle =>
      'Geben Sie die Basis (b) und die Höhe (h) ein.';

  @override
  String get triangulo_var_b => 'Basis (b)';

  @override
  String get triangulo_var_h => 'Höhe (h)';

  @override
  String get rombo_title => 'Fläche einer Raute berechnen';

  @override
  String get rombo_subtitle => 'Geben Sie die Diagonalen der Raute ein.';

  @override
  String get rombo_var_D => 'Große Diagonale (D)';

  @override
  String get rombo_var_d => 'Kleine Diagonale (d)';

  @override
  String get poligono_title => 'Fläche eines Regelmäßigen Polygons berechnen';

  @override
  String get poligono_subtitle => 'Geben Sie die Polygondaten ein.';

  @override
  String get poligono_var_n => 'Anzahl der Seiten (n)';

  @override
  String get poligono_var_l => 'Länge einer Seite (l)';

  @override
  String get poligono_var_ap => 'Apothema (ap)';

  @override
  String get esfera_title => 'Volumen einer Kugel berechnen';

  @override
  String get esfera_subtitle =>
      'Geben Sie den Radius (r) ein, um das Volumen zu berechnen.';

  @override
  String get esfera_var_r => 'Radius (r)';

  @override
  String get puntos_title => 'Abstand zwischen Zwei Punkten berechnen';

  @override
  String get puntos_subtitle =>
      'Geben Sie die Koordinaten der beiden Punkte ein.';

  @override
  String get tales_title => 'Satz des Thales berechnen';

  @override
  String get tales_subtitle =>
      'Geben Sie drei Werte ein, um den vierten zu berechnen.';

  @override
  String get tales_var_a => 'Wert a';

  @override
  String get tales_var_b => 'Wert b';

  @override
  String get tales_var_c => 'Wert c';

  @override
  String get tales_var_d => 'Wert d';

  @override
  String get formula_ecuacion_segundo_grado_name => 'Quadratische Gleichung';

  @override
  String get formula_ecuacion_segundo_grado_desc =>
      'Allgemeine Formel zur Lösung quadratischer Gleichungen';

  @override
  String get formula_ecuacion_segundo_grado_example => '2x² + 5x - 3 = 0';

  @override
  String get formula_ecuacion_segundo_grado_explanation =>
      'Die allgemeine Formel zur Lösung quadratischer Gleichungen lautet:\nx = (-b ± √(b² - 4ac)) / 2a\n\nWo:\n• a, b, c die Koeffizienten der Gleichung sind\n• Die Diskriminante (Δ = b² - 4ac) bestimmt die Art der Lösungen:\n  - Wenn Δ > 0: zwei verschiedene reelle Lösungen\n  - Wenn Δ = 0: eine reelle Lösung (doppelte Wurzel)\n  - Wenn Δ < 0: keine reellen Lösungen';

  @override
  String get formula_teorema_pitagoras_name => 'Satz des Pythagoras';

  @override
  String get formula_teorema_pitagoras_desc =>
      'Beziehung zwischen den Seiten eines rechtwinkligen Dreiecks';

  @override
  String get formula_teorema_pitagoras_example =>
      'Wenn a = 3 und b = 4, dann ist c = 5';

  @override
  String get formula_teorema_pitagoras_explanation =>
      'In einem rechtwinkligen Dreieck ist das Quadrat der Hypotenuse (c) gleich der Summe der Quadrate der beiden anderen Seiten (a und b).';

  @override
  String get formula_area_circulo_name => 'Fläche eines Kreises';

  @override
  String get formula_area_circulo_desc =>
      'Formel zur Berechnung der Fläche eines Kreises';

  @override
  String get formula_area_circulo_example =>
      'Wenn r = 5, dann ist A = π × 25 ≈ 78.54';

  @override
  String get formula_area_circulo_explanation =>
      'Die Fläche eines Kreises wird berechnet, indem π (Pi) mit dem Quadrat des Radius multipliziert wird. π ≈ 3.14159';

  @override
  String get formula_area_triangulo_name => 'Fläche eines Dreiecks';

  @override
  String get formula_area_triangulo_desc =>
      'Formel zur Berechnung der Fläche eines Dreiecks';

  @override
  String get formula_area_triangulo_example =>
      'Wenn die Basis (b) 10 ist und die Höhe (h) 5 ist, beträgt die Fläche 25';

  @override
  String get formula_area_triangulo_explanation =>
      'Die Fläche eines Dreiecks wird berechnet, indem die Länge der Basis (b) mit der Höhe (h) multipliziert und das Ergebnis durch zwei geteilt wird.';

  @override
  String get formula_area_rombo_name => 'Fläche einer Raute';

  @override
  String get formula_area_rombo_desc =>
      'Formel zur Berechnung der Fläche einer Raute';

  @override
  String get formula_area_rombo_example =>
      'Wenn die große Diagonale (D) 8 ist und die kleine (d) 6 ist, beträgt die Fläche 24 cm².';

  @override
  String get formula_area_rombo_explanation =>
      'Die Fläche einer Raute wird berechnet, indem die große Diagonale (D) mit der kleinen Diagonale (d) multipliziert und das Ergebnis durch zwei geteilt wird.';

  @override
  String get formula_area_poligono_regular_name =>
      'Fläche eines Regelmäßigen Polygons';

  @override
  String get formula_area_poligono_regular_desc =>
      'Formel zur Berechnung der Fläche eines regelmäßigen Polygons';

  @override
  String get formula_area_poligono_regular_example =>
      'Für ein Fünfeck (5 Seiten) mit einer Seitenlänge von 6cm und einem Apothema von 4.1cm beträgt die Fläche (30 × 4.1) / 2 = 61.5 cm²';

  @override
  String get formula_area_poligono_regular_explanation =>
      'Die Fläche eines regelmäßigen Polygons wird mit dem Umfang (P) und dem Apothema (ap) berechnet. Der Umfang ist die Anzahl der Seiten (n) multipliziert mit der Länge einer Seite (l). Das Apothema ist der Abstand vom Zentrum zu einer der Seiten.';

  @override
  String get formula_volumen_esfera_name => 'Volumen einer Kugel';

  @override
  String get formula_volumen_esfera_desc =>
      'Formel zur Berechnung des Volumens einer Kugel';

  @override
  String get formula_volumen_esfera_example =>
      'Wenn r = 3, dann ist V = (4/3)π × 27 ≈ 113.10';

  @override
  String get formula_volumen_esfera_explanation =>
      'Das Volumen einer Kugel wird berechnet, indem (4/3)π mit dem Kubik des Radius multipliziert wird.';

  @override
  String get formula_distancia_dos_puntos_name =>
      'Abstand zwischen Zwei Punkten';

  @override
  String get formula_distancia_dos_puntos_desc =>
      'Formel zur Berechnung des Abstands zwischen zwei Punkten in einer Ebene';

  @override
  String get formula_distancia_dos_puntos_example =>
      'P₁(2, 3) und P₂(5, 7): d = √[(5-2)² + (7-3)²] = √(9+16) = 5';

  @override
  String get formula_distancia_dos_puntos_explanation =>
      'Der Abstand zwischen zwei Punkten P₁(x₁, y₁) und P₂(x₂, y₂) wird mit dem Satz des Pythagoras in der kartesischen Ebene berechnet.';

  @override
  String get formula_teorema_tales_name => 'Satz des Thales';

  @override
  String get formula_teorema_tales_desc =>
      'Verhältnis der Proportionalität bei der Ähnlichkeit von Dreiecken';

  @override
  String get formula_teorema_tales_example =>
      'Wenn a=4, b=2 und c=6, dann ist d=(2*6)/4=3';

  @override
  String get formula_teorema_tales_explanation =>
      'Der Satz des Thales besagt, dass wenn zwei sich schneidende Linien von parallelen Linien geschnitten werden, die gebildeten Segmente proportional sind.\nIm Kontext ähnlicher Dreiecke, wenn wir ein großes Dreieck mit den Seiten A und C haben, und ein kleineres Dreieck innen mit den entsprechenden Seiten B und D, bleibt das Verhältnis bestehen: A/B = C/D.';
}
