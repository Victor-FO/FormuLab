import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('pt'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In es, this message translates to:
  /// **'Calculadora de Fórmulas'**
  String get appTitle;

  /// No description provided for @homeWelcome.
  ///
  /// In es, this message translates to:
  /// **'Bienvenido'**
  String get homeWelcome;

  /// No description provided for @homeSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Calculadora para estudiantes de ESO y Bachillerato'**
  String get homeSubtitle;

  /// No description provided for @homeFormulasButton.
  ///
  /// In es, this message translates to:
  /// **'Ver Fórmulas'**
  String get homeFormulasButton;

  /// No description provided for @homeFormulasButtonDesc.
  ///
  /// In es, this message translates to:
  /// **'Explora todas las fórmulas disponibles'**
  String get homeFormulasButtonDesc;

  /// No description provided for @homeQuickCalcButton.
  ///
  /// In es, this message translates to:
  /// **'Calculadora Rápida'**
  String get homeQuickCalcButton;

  /// No description provided for @homeQuickCalcButtonDesc.
  ///
  /// In es, this message translates to:
  /// **'Acceso directo a calculadoras'**
  String get homeQuickCalcButtonDesc;

  /// No description provided for @homeStartMessage.
  ///
  /// In es, this message translates to:
  /// **'Selecciona una opción para comenzar'**
  String get homeStartMessage;

  /// No description provided for @language.
  ///
  /// In es, this message translates to:
  /// **'Idioma'**
  String get language;

  /// No description provided for @spanish.
  ///
  /// In es, this message translates to:
  /// **'Español'**
  String get spanish;

  /// No description provided for @english.
  ///
  /// In es, this message translates to:
  /// **'Inglés'**
  String get english;

  /// No description provided for @french.
  ///
  /// In es, this message translates to:
  /// **'Français'**
  String get french;

  /// No description provided for @german.
  ///
  /// In es, this message translates to:
  /// **'Alemán'**
  String get german;

  /// No description provided for @italian.
  ///
  /// In es, this message translates to:
  /// **'Italiano'**
  String get italian;

  /// No description provided for @portuguese.
  ///
  /// In es, this message translates to:
  /// **'Português'**
  String get portuguese;

  /// No description provided for @formulas_searchHint.
  ///
  /// In es, this message translates to:
  /// **'Buscar fórmulas...'**
  String get formulas_searchHint;

  /// No description provided for @formulas_categoryAll.
  ///
  /// In es, this message translates to:
  /// **'Todas'**
  String get formulas_categoryAll;

  /// No description provided for @formulas_categoryESO.
  ///
  /// In es, this message translates to:
  /// **'ESO'**
  String get formulas_categoryESO;

  /// No description provided for @formulas_categoryBachillerato.
  ///
  /// In es, this message translates to:
  /// **'Bachillerato'**
  String get formulas_categoryBachillerato;

  /// No description provided for @formulas_noFormulasFound.
  ///
  /// In es, this message translates to:
  /// **'No se encontraron fórmulas'**
  String get formulas_noFormulasFound;

  /// No description provided for @formula_formula_title.
  ///
  /// In es, this message translates to:
  /// **'Fórmula'**
  String get formula_formula_title;

  /// No description provided for @formula_explanation_title.
  ///
  /// In es, this message translates to:
  /// **'Explicación'**
  String get formula_explanation_title;

  /// No description provided for @formula_example_title.
  ///
  /// In es, this message translates to:
  /// **'Ejemplo'**
  String get formula_example_title;

  /// No description provided for @formula_topic_title.
  ///
  /// In es, this message translates to:
  /// **'Tema'**
  String get formula_topic_title;

  /// No description provided for @calculator_calculate_button.
  ///
  /// In es, this message translates to:
  /// **'Calcular'**
  String get calculator_calculate_button;

  /// No description provided for @calculator_clear_button.
  ///
  /// In es, this message translates to:
  /// **'Limpiar'**
  String get calculator_clear_button;

  /// No description provided for @calculator_result_title.
  ///
  /// In es, this message translates to:
  /// **'Resultado'**
  String get calculator_result_title;

  /// No description provided for @calculator_calculation_title.
  ///
  /// In es, this message translates to:
  /// **'Cálculo Realizado'**
  String get calculator_calculation_title;

  /// No description provided for @calculator_error_invalid_number.
  ///
  /// In es, this message translates to:
  /// **'Número inválido'**
  String get calculator_error_invalid_number;

  /// No description provided for @calculator_error_enter_value.
  ///
  /// In es, this message translates to:
  /// **'Ingresa un valor'**
  String get calculator_error_enter_value;

  /// No description provided for @pitagoras_title.
  ///
  /// In es, this message translates to:
  /// **'Calcular Teorema de Pitágoras'**
  String get pitagoras_title;

  /// No description provided for @pitagoras_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Introduce dos lados para calcular el tercero.'**
  String get pitagoras_subtitle;

  /// No description provided for @pitagoras_var_a.
  ///
  /// In es, this message translates to:
  /// **'Cateto a'**
  String get pitagoras_var_a;

  /// No description provided for @pitagoras_var_b.
  ///
  /// In es, this message translates to:
  /// **'Cateto b'**
  String get pitagoras_var_b;

  /// No description provided for @pitagoras_var_c.
  ///
  /// In es, this message translates to:
  /// **'Hipotenusa c'**
  String get pitagoras_var_c;

  /// No description provided for @pitagoras_i_want_to_calculate.
  ///
  /// In es, this message translates to:
  /// **'Quiero calcular:'**
  String get pitagoras_i_want_to_calculate;

  /// No description provided for @circulo_title.
  ///
  /// In es, this message translates to:
  /// **'Calcular Área de un Círculo'**
  String get circulo_title;

  /// No description provided for @circulo_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Introduce el radio (r) para calcular el área.'**
  String get circulo_subtitle;

  /// No description provided for @circulo_var_r.
  ///
  /// In es, this message translates to:
  /// **'Radio (r)'**
  String get circulo_var_r;

  /// No description provided for @triangulo_title.
  ///
  /// In es, this message translates to:
  /// **'Calcular Área de un Triángulo'**
  String get triangulo_title;

  /// No description provided for @triangulo_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Introduce la base (b) y la altura (h).'**
  String get triangulo_subtitle;

  /// No description provided for @triangulo_var_b.
  ///
  /// In es, this message translates to:
  /// **'Base (b)'**
  String get triangulo_var_b;

  /// No description provided for @triangulo_var_h.
  ///
  /// In es, this message translates to:
  /// **'Altura (h)'**
  String get triangulo_var_h;

  /// No description provided for @rombo_title.
  ///
  /// In es, this message translates to:
  /// **'Calcular Área de un Rombo'**
  String get rombo_title;

  /// No description provided for @rombo_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Introduce las diagonales del rombo.'**
  String get rombo_subtitle;

  /// No description provided for @rombo_var_D.
  ///
  /// In es, this message translates to:
  /// **'Diagonal Mayor (D)'**
  String get rombo_var_D;

  /// No description provided for @rombo_var_d.
  ///
  /// In es, this message translates to:
  /// **'Diagonal Menor (d)'**
  String get rombo_var_d;

  /// No description provided for @poligono_title.
  ///
  /// In es, this message translates to:
  /// **'Calcular Área de Polígono Regular'**
  String get poligono_title;

  /// No description provided for @poligono_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Introduce los datos del polígono.'**
  String get poligono_subtitle;

  /// No description provided for @poligono_var_n.
  ///
  /// In es, this message translates to:
  /// **'Número de lados (n)'**
  String get poligono_var_n;

  /// No description provided for @poligono_var_l.
  ///
  /// In es, this message translates to:
  /// **'Longitud de un lado (l)'**
  String get poligono_var_l;

  /// No description provided for @poligono_var_ap.
  ///
  /// In es, this message translates to:
  /// **'Apotema (ap)'**
  String get poligono_var_ap;

  /// No description provided for @esfera_title.
  ///
  /// In es, this message translates to:
  /// **'Calcular Volumen de una Esfera'**
  String get esfera_title;

  /// No description provided for @esfera_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Introduce el radio (r) para calcular el volumen.'**
  String get esfera_subtitle;

  /// No description provided for @esfera_var_r.
  ///
  /// In es, this message translates to:
  /// **'Radio (r)'**
  String get esfera_var_r;

  /// No description provided for @puntos_title.
  ///
  /// In es, this message translates to:
  /// **'Calcular Distancia entre Dos Puntos'**
  String get puntos_title;

  /// No description provided for @puntos_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Introduce las coordenadas de los dos puntos.'**
  String get puntos_subtitle;

  /// No description provided for @tales_title.
  ///
  /// In es, this message translates to:
  /// **'Calcular Teorema de Tales'**
  String get tales_title;

  /// No description provided for @tales_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Introduce tres valores para calcular el cuarto.'**
  String get tales_subtitle;

  /// No description provided for @tales_var_a.
  ///
  /// In es, this message translates to:
  /// **'Valor a'**
  String get tales_var_a;

  /// No description provided for @tales_var_b.
  ///
  /// In es, this message translates to:
  /// **'Valor b'**
  String get tales_var_b;

  /// No description provided for @tales_var_c.
  ///
  /// In es, this message translates to:
  /// **'Valor c'**
  String get tales_var_c;

  /// No description provided for @tales_var_d.
  ///
  /// In es, this message translates to:
  /// **'Valor d'**
  String get tales_var_d;

  /// No description provided for @formula_ecuacion_segundo_grado_name.
  ///
  /// In es, this message translates to:
  /// **'Ecuación de Segundo Grado'**
  String get formula_ecuacion_segundo_grado_name;

  /// No description provided for @formula_ecuacion_segundo_grado_desc.
  ///
  /// In es, this message translates to:
  /// **'Fórmula general para resolver ecuaciones cuadráticas'**
  String get formula_ecuacion_segundo_grado_desc;

  /// No description provided for @formula_ecuacion_segundo_grado_example.
  ///
  /// In es, this message translates to:
  /// **'2x² + 5x - 3 = 0'**
  String get formula_ecuacion_segundo_grado_example;

  /// No description provided for @formula_ecuacion_segundo_grado_explanation.
  ///
  /// In es, this message translates to:
  /// **'La fórmula general para resolver ecuaciones de segundo grado es:\nx = (-b ± √(b² - 4ac)) / 2a\n\nDonde:\n• a, b, c son los coeficientes de la ecuación\n• El discriminante (Δ = b² - 4ac) determina el tipo de soluciones:\n  - Si Δ > 0: dos soluciones reales distintas\n  - Si Δ = 0: una solución real (raíz doble)\n  - Si Δ < 0: no tiene soluciones reales'**
  String get formula_ecuacion_segundo_grado_explanation;

  /// No description provided for @formula_teorema_pitagoras_name.
  ///
  /// In es, this message translates to:
  /// **'Teorema de Pitágoras'**
  String get formula_teorema_pitagoras_name;

  /// No description provided for @formula_teorema_pitagoras_desc.
  ///
  /// In es, this message translates to:
  /// **'Relación entre los lados de un triángulo rectángulo'**
  String get formula_teorema_pitagoras_desc;

  /// No description provided for @formula_teorema_pitagoras_example.
  ///
  /// In es, this message translates to:
  /// **'Si a = 3 y b = 4, entonces c = 5'**
  String get formula_teorema_pitagoras_example;

  /// No description provided for @formula_teorema_pitagoras_explanation.
  ///
  /// In es, this message translates to:
  /// **'En un triángulo rectángulo, el cuadrado de la hipotenusa (c) es igual a la suma de los cuadrados de los catetos (a y b).'**
  String get formula_teorema_pitagoras_explanation;

  /// No description provided for @formula_area_circulo_name.
  ///
  /// In es, this message translates to:
  /// **'Área de un Círculo'**
  String get formula_area_circulo_name;

  /// No description provided for @formula_area_circulo_desc.
  ///
  /// In es, this message translates to:
  /// **'Fórmula para calcular el área de un círculo'**
  String get formula_area_circulo_desc;

  /// No description provided for @formula_area_circulo_example.
  ///
  /// In es, this message translates to:
  /// **'Si r = 5, entonces A = π × 25 ≈ 78.54'**
  String get formula_area_circulo_example;

  /// No description provided for @formula_area_circulo_explanation.
  ///
  /// In es, this message translates to:
  /// **'El área de un círculo se calcula multiplicando π (pi) por el radio al cuadrado. π ≈ 3.14159'**
  String get formula_area_circulo_explanation;

  /// No description provided for @formula_area_triangulo_name.
  ///
  /// In es, this message translates to:
  /// **'Área de un Triángulo'**
  String get formula_area_triangulo_name;

  /// No description provided for @formula_area_triangulo_desc.
  ///
  /// In es, this message translates to:
  /// **'Fórmula para calcular el área de un triángulo'**
  String get formula_area_triangulo_desc;

  /// No description provided for @formula_area_triangulo_example.
  ///
  /// In es, this message translates to:
  /// **'Si la base (b) es 10 y la altura (h) es 5, el área es 25'**
  String get formula_area_triangulo_example;

  /// No description provided for @formula_area_triangulo_explanation.
  ///
  /// In es, this message translates to:
  /// **'El área de un triángulo se calcula multiplicando la longitud de la base (b) por la altura (h) y dividiendo el resultado entre dos.'**
  String get formula_area_triangulo_explanation;

  /// No description provided for @formula_area_rombo_name.
  ///
  /// In es, this message translates to:
  /// **'Área de un Rombo'**
  String get formula_area_rombo_name;

  /// No description provided for @formula_area_rombo_desc.
  ///
  /// In es, this message translates to:
  /// **'Fórmula para calcular el área de un rombo'**
  String get formula_area_rombo_desc;

  /// No description provided for @formula_area_rombo_example.
  ///
  /// In es, this message translates to:
  /// **'Si la diagonal mayor (D) es 8 y la menor (d) es 6, el área es 24 cm².'**
  String get formula_area_rombo_example;

  /// No description provided for @formula_area_rombo_explanation.
  ///
  /// In es, this message translates to:
  /// **'El área de un rombo se calcula multiplicando la diagonal mayor (D) por la diagonal menor (d) y dividiendo el resultado entre dos.'**
  String get formula_area_rombo_explanation;

  /// No description provided for @formula_area_poligono_regular_name.
  ///
  /// In es, this message translates to:
  /// **'Área de Polígono Regular'**
  String get formula_area_poligono_regular_name;

  /// No description provided for @formula_area_poligono_regular_desc.
  ///
  /// In es, this message translates to:
  /// **'Fórmula para calcular el área de un polígono regular'**
  String get formula_area_poligono_regular_desc;

  /// No description provided for @formula_area_poligono_regular_example.
  ///
  /// In es, this message translates to:
  /// **'Para un pentágono (5 lados) de lado 6cm y apotema 4.1cm, el Área es (30 × 4.1) / 2 = 61.5 cm²'**
  String get formula_area_poligono_regular_example;

  /// No description provided for @formula_area_poligono_regular_explanation.
  ///
  /// In es, this message translates to:
  /// **'El área de un polígono regular se calcula con el Perímetro (P) y la Apotema (ap). El perímetro es el número de lados (n) por la longitud de un lado (l). La apotema es la distancia del centro a cualquiera de los lados.'**
  String get formula_area_poligono_regular_explanation;

  /// No description provided for @formula_volumen_esfera_name.
  ///
  /// In es, this message translates to:
  /// **'Volumen de una Esfera'**
  String get formula_volumen_esfera_name;

  /// No description provided for @formula_volumen_esfera_desc.
  ///
  /// In es, this message translates to:
  /// **'Fórmula para calcular el volumen de una esfera'**
  String get formula_volumen_esfera_desc;

  /// No description provided for @formula_volumen_esfera_example.
  ///
  /// In es, this message translates to:
  /// **'Si r = 3, entonces V = (4/3)π × 27 ≈ 113.10'**
  String get formula_volumen_esfera_example;

  /// No description provided for @formula_volumen_esfera_explanation.
  ///
  /// In es, this message translates to:
  /// **'El volumen de una esfera se calcula multiplicando (4/3)π por el radio elevado al cubo.'**
  String get formula_volumen_esfera_explanation;

  /// No description provided for @formula_distancia_dos_puntos_name.
  ///
  /// In es, this message translates to:
  /// **'Distancia entre Dos Puntos'**
  String get formula_distancia_dos_puntos_name;

  /// No description provided for @formula_distancia_dos_puntos_desc.
  ///
  /// In es, this message translates to:
  /// **'Fórmula para calcular la distancia entre dos puntos en el plano'**
  String get formula_distancia_dos_puntos_desc;

  /// No description provided for @formula_distancia_dos_puntos_example.
  ///
  /// In es, this message translates to:
  /// **'P₁(2, 3) y P₂(5, 7): d = √[(5-2)² + (7-3)²] = √(9+16) = 5'**
  String get formula_distancia_dos_puntos_example;

  /// No description provided for @formula_distancia_dos_puntos_explanation.
  ///
  /// In es, this message translates to:
  /// **'La distancia entre dos puntos P₁(x₁, y₁) y P₂(x₂, y₂) se calcula usando el teorema de Pitágoras en el plano cartesiano.'**
  String get formula_distancia_dos_puntos_explanation;

  /// No description provided for @formula_teorema_tales_name.
  ///
  /// In es, this message translates to:
  /// **'Teorema de Tales'**
  String get formula_teorema_tales_name;

  /// No description provided for @formula_teorema_tales_desc.
  ///
  /// In es, this message translates to:
  /// **'Relación de proporcionalidad en la semejanza de triángulos'**
  String get formula_teorema_tales_desc;

  /// No description provided for @formula_teorema_tales_example.
  ///
  /// In es, this message translates to:
  /// **'Si a=4, b=2 y c=6, entonces d=(2*6)/4=3'**
  String get formula_teorema_tales_example;

  /// No description provided for @formula_teorema_tales_explanation.
  ///
  /// In es, this message translates to:
  /// **'El teorema de Tales establece que si dos rectas secantes son cortadas por rectas paralelas, los segmentos que se forman son proporcionales.\nEn el contexto de triángulos semejantes, si tenemos un triángulo grande con lados A y C, y un triángulo más pequeño dentro con lados B y D correspondientes, la relación se mantiene: A/B = C/D.'**
  String get formula_teorema_tales_explanation;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'de',
    'en',
    'es',
    'fr',
    'it',
    'pt',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
