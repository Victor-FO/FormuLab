// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Calculatrice de Formules';

  @override
  String get homeWelcome => 'Bienvenue';

  @override
  String get homeSubtitle => 'Calculatrice pour les lycéens';

  @override
  String get homeFormulasButton => 'Voir les Formules';

  @override
  String get homeFormulasButtonDesc =>
      'Explorez toutes les formules disponibles';

  @override
  String get homeQuickCalcButton => 'Calculatrice Rapide';

  @override
  String get homeQuickCalcButtonDesc => 'Accès direct aux calculatrices';

  @override
  String get homeStartMessage => 'Sélectionnez une option pour commencer';

  @override
  String get language => 'Langue';

  @override
  String get spanish => 'Espagnol';

  @override
  String get english => 'Anglais';

  @override
  String get french => 'Français';

  @override
  String get german => 'Allemand';

  @override
  String get italian => 'Italien';

  @override
  String get portuguese => 'Portugais';

  @override
  String get formulas_searchHint => 'Rechercher des formules...';

  @override
  String get formulas_categoryAll => 'Toutes';

  @override
  String get formulas_categoryESO => 'Collège';

  @override
  String get formulas_categoryBachillerato => 'Lycée';

  @override
  String get formulas_noFormulasFound => 'Aucune formule trouvée';

  @override
  String get formula_formula_title => 'Formule';

  @override
  String get formula_explanation_title => 'Explication';

  @override
  String get formula_example_title => 'Exemple';

  @override
  String get formula_topic_title => 'Sujet';

  @override
  String get calculator_calculate_button => 'Calculer';

  @override
  String get calculator_clear_button => 'Effacer';

  @override
  String get calculator_result_title => 'Résultat';

  @override
  String get calculator_calculation_title => 'Calcul Effectué';

  @override
  String get calculator_error_invalid_number => 'Numéro invalide';

  @override
  String get calculator_error_enter_value => 'Veuillez entrer une valeur';

  @override
  String get pitagoras_title => 'Calculer le Théorème de Pythagore';

  @override
  String get pitagoras_subtitle =>
      'Entrez deux côtés pour calculer le troisième.';

  @override
  String get pitagoras_var_a => 'Côté a';

  @override
  String get pitagoras_var_b => 'Côté b';

  @override
  String get pitagoras_var_c => 'Hypoténuse c';

  @override
  String get pitagoras_i_want_to_calculate => 'Je veux calculer :';

  @override
  String get circulo_title => 'Calculer l\'Aire d\'un Cercle';

  @override
  String get circulo_subtitle => 'Entrez le rayon (r) pour calculer l\'aire.';

  @override
  String get circulo_var_r => 'Rayon (r)';

  @override
  String get triangulo_title => 'Calculer l\'Aire d\'un Triangle';

  @override
  String get triangulo_subtitle => 'Entrez la base (b) et la hauteur (h).';

  @override
  String get triangulo_var_b => 'Base (b)';

  @override
  String get triangulo_var_h => 'Hauteur (h)';

  @override
  String get rombo_title => 'Calculer l_Aire d\'un Losange';

  @override
  String get rombo_subtitle => 'Entrez les diagonales du losange.';

  @override
  String get rombo_var_D => 'Diagonale Majeure (D)';

  @override
  String get rombo_var_d => 'Diagonale Mineure (d)';

  @override
  String get poligono_title => 'Calculer l\'Aire d\'un Polygone Régulier';

  @override
  String get poligono_subtitle => 'Entrez les données du polygone.';

  @override
  String get poligono_var_n => 'Nombre de côtés (n)';

  @override
  String get poligono_var_l => 'Longueur d\'un côté (l)';

  @override
  String get poligono_var_ap => 'Apothème (ap)';

  @override
  String get esfera_title => 'Calculer le Volume d\'une Sphère';

  @override
  String get esfera_subtitle => 'Entrez le rayon (r) pour calculer le volume.';

  @override
  String get esfera_var_r => 'Rayon (r)';

  @override
  String get puntos_title => 'Calculer la Distance entre Deux Points';

  @override
  String get puntos_subtitle => 'Entrez les coordonnées des deux points.';

  @override
  String get tales_title => 'Calculer le Théorème de Thalès';

  @override
  String get tales_subtitle =>
      'Entrez trois valeurs pour calculer la quatrième.';

  @override
  String get tales_var_a => 'Valeur a';

  @override
  String get tales_var_b => 'Valeur b';

  @override
  String get tales_var_c => 'Valeur c';

  @override
  String get tales_var_d => 'Valeur d';

  @override
  String get formula_ecuacion_segundo_grado_name => 'Équation du Second Degré';

  @override
  String get formula_ecuacion_segundo_grado_desc =>
      'Formule générale pour résoudre les équations quadratiques';

  @override
  String get formula_ecuacion_segundo_grado_example => '2x² + 5x - 3 = 0';

  @override
  String get formula_ecuacion_segundo_grado_explanation =>
      'La formule générale pour résoudre les équations du second degré est :\nx = (-b ± √(b² - 4ac)) / 2a\n\nOù :\n• a, b, c sont les coefficients de l\'équation\n• Le discriminant (Δ = b² - 4ac) détermine le type de solutions :\n  - Si Δ > 0 : deux solutions réelles distinctes\n  - Si Δ = 0 : une solution réelle (racine double)\n  - Si Δ < 0 : pas de solutions réelles';

  @override
  String get formula_teorema_pitagoras_name => 'Théorème de Pythagore';

  @override
  String get formula_teorema_pitagoras_desc =>
      'Relation entre les côtés d\'un triangle rectangle';

  @override
  String get formula_teorema_pitagoras_example =>
      'Si a = 3 et b = 4, alors c = 5';

  @override
  String get formula_teorema_pitagoras_explanation =>
      'Dans un triangle rectangle, le carré de l\'hypoténuse (c) est égal à la somme des carrés des deux autres côtés (a et b).';

  @override
  String get formula_area_circulo_name => 'Aire d\'un Cercle';

  @override
  String get formula_area_circulo_desc =>
      'Formule pour calculer l\'aire d\'un cercle';

  @override
  String get formula_area_circulo_example =>
      'Si r = 5, alors A = π × 25 ≈ 78.54';

  @override
  String get formula_area_circulo_explanation =>
      'L\'aire d\'un cercle est calculée en multipliant π (pi) par le rayon au carré. π ≈ 3.14159';

  @override
  String get formula_area_triangulo_name => 'Aire d\'un Triangle';

  @override
  String get formula_area_triangulo_desc =>
      'Formule pour calculer l\'aire d\'un triangle';

  @override
  String get formula_area_triangulo_example =>
      'Si la base (b) est 10 et la hauteur (h) est 5, l\'aire est 25';

  @override
  String get formula_area_triangulo_explanation =>
      'L\'aire d\'un triangle est calculée en multipliant la longueur de la base (b) par la hauteur (h) et en divisant le résultat par deux.';

  @override
  String get formula_area_rombo_name => 'Aire d\'un Losange';

  @override
  String get formula_area_rombo_desc =>
      'Formule pour calculer l\'aire d\'un losange';

  @override
  String get formula_area_rombo_example =>
      'Si la grande diagonale (D) est 8 et la petite (d) est 6, l\'aire est 24 cm².';

  @override
  String get formula_area_rombo_explanation =>
      'L\'aire d\'un losange est calculée en multipliant la grande diagonale (D) par la petite diagonale (d) et en divisant le résultat par deux.';

  @override
  String get formula_area_poligono_regular_name =>
      'Aire d\'un Polygone Régulier';

  @override
  String get formula_area_poligono_regular_desc =>
      'Formule pour calculer l\'aire d\'un polygone régulier';

  @override
  String get formula_area_poligono_regular_example =>
      'Pour un pentagone (5 côtés) avec un côté de 6cm et un apothème de 4.1cm, l\'Aire est (30 × 4.1) / 2 = 61.5 cm²';

  @override
  String get formula_area_poligono_regular_explanation =>
      'L\'aire d\'un polygone régulier est calculée avec le Périmètre (P) et l\'Apothème (ap). Le périmètre est le nombre de côtés (n) multiplié par la longueur d\'un côté (l). L\'apothème est la distance du centre à n\'importe lequel des côtés.';

  @override
  String get formula_volumen_esfera_name => 'Volume d\'une Sphère';

  @override
  String get formula_volumen_esfera_desc =>
      'Formule pour calculer le volume d\'une sphère';

  @override
  String get formula_volumen_esfera_example =>
      'Si r = 3, alors V = (4/3)π × 27 ≈ 113.10';

  @override
  String get formula_volumen_esfera_explanation =>
      'Le volume d\'une sphère est calculé en multipliant (4/3)π par le rayon au cube.';

  @override
  String get formula_distancia_dos_puntos_name => 'Distance entre Deux Points';

  @override
  String get formula_distancia_dos_puntos_desc =>
      'Formule pour calculer la distance entre deux points sur un plan';

  @override
  String get formula_distancia_dos_puntos_example =>
      'P₁(2, 3) et P₂(5, 7): d = √[(5-2)² + (7-3)²] = √(9+16) = 5';

  @override
  String get formula_distancia_dos_puntos_explanation =>
      'La distance entre deux points P₁(x₁, y₁) et P₂(x₂, y₂) est calculée en utilisant le théorème de Pythagore sur le plan cartésien.';

  @override
  String get formula_teorema_tales_name => 'Théorème de Thalès';

  @override
  String get formula_teorema_tales_desc =>
      'Relation de proportionnalité dans la similitude des triangles';

  @override
  String get formula_teorema_tales_example =>
      'Si a=4, b=2 et c=6, alors d=(2*6)/4=3';

  @override
  String get formula_teorema_tales_explanation =>
      'Le théorème de Thalès énonce que si deux droites sécantes sont coupées par des droites parallèles, les segments qui sont formés sont proportionnels.\nDans le contexte de triangles similaires, si nous avons un grand triangle avec les côtés A et C, et un plus petit triangle à l\'intérieur avec les côtés correspondants B et D, la relation est maintenue: A/B = C/D.';
}
