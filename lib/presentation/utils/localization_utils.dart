import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

/// Obtiene la traducción de una clave de localización.
/// Si no se encuentra, devuelve la propia clave.
String tr(BuildContext context, String key) {
  final l10n = AppLocalizations.of(context)!;
  
  // Aquí iría la lógica para buscar la clave en AppLocalizations
  // Por ahora, usamos un switch manual como prueba de concepto.
  // En una app más grande, esto se podría hacer con reflectancia o un mapa.
  switch (key) {
    case 'formula_ecuacion_segundo_grado_name':
      return l10n.formula_ecuacion_segundo_grado_name;
    case 'formula_ecuacion_segundo_grado_desc':
      return l10n.formula_ecuacion_segundo_grado_desc;
    case 'formula_ecuacion_segundo_grado_example':
      return l10n.formula_ecuacion_segundo_grado_example;
    case 'formula_ecuacion_segundo_grado_explanation':
      return l10n.formula_ecuacion_segundo_grado_explanation;

    case 'formula_teorema_pitagoras_name':
      return l10n.formula_teorema_pitagoras_name;
    case 'formula_teorema_pitagoras_desc':
      return l10n.formula_teorema_pitagoras_desc;
    case 'formula_teorema_pitagoras_example':
      return l10n.formula_teorema_pitagoras_example;
    case 'formula_teorema_pitagoras_explanation':
      return l10n.formula_teorema_pitagoras_explanation;

    case 'formula_area_circulo_name':
      return l10n.formula_area_circulo_name;
    case 'formula_area_circulo_desc':
      return l10n.formula_area_circulo_desc;
    case 'formula_area_circulo_example':
      return l10n.formula_area_circulo_example;
    case 'formula_area_circulo_explanation':
      return l10n.formula_area_circulo_explanation;

     case 'formula_area_triangulo_name':
      return l10n.formula_area_triangulo_name;
    case 'formula_area_triangulo_desc':
      return l10n.formula_area_triangulo_desc;
    case 'formula_area_triangulo_example':
      return l10n.formula_area_triangulo_example;
    case 'formula_area_triangulo_explanation':
      return l10n.formula_area_triangulo_explanation;

    case 'formula_area_rombo_name':
      return l10n.formula_area_rombo_name;
    case 'formula_area_rombo_desc':
      return l10n.formula_area_rombo_desc;
    case 'formula_area_rombo_example':
      return l10n.formula_area_rombo_example;
    case 'formula_area_rombo_explanation':
      return l10n.formula_area_rombo_explanation;

    case 'formula_area_poligono_regular_name':
      return l10n.formula_area_poligono_regular_name;
    case 'formula_area_poligono_regular_desc':
      return l10n.formula_area_poligono_regular_desc;
    case 'formula_area_poligono_regular_example':
      return l10n.formula_area_poligono_regular_example;
    case 'formula_area_poligono_regular_explanation':
      return l10n.formula_area_poligono_regular_explanation;

    case 'formula_volumen_esfera_name':
      return l10n.formula_volumen_esfera_name;
    case 'formula_volumen_esfera_desc':
      return l10n.formula_volumen_esfera_desc;
    case 'formula_volumen_esfera_example':
      return l10n.formula_volumen_esfera_example;
    case 'formula_volumen_esfera_explanation':
      return l10n.formula_volumen_esfera_explanation;

    case 'formula_distancia_dos_puntos_name':
      return l10n.formula_distancia_dos_puntos_name;
    case 'formula_distancia_dos_puntos_desc':
      return l10n.formula_distancia_dos_puntos_desc;
    case 'formula_distancia_dos_puntos_example':
      return l10n.formula_distancia_dos_puntos_example;
    case 'formula_distancia_dos_puntos_explanation':
      return l10n.formula_distancia_dos_puntos_explanation;

    case 'formula_teorema_tales_name':
      return l10n.formula_teorema_tales_name;
    case 'formula_teorema_tales_desc':
      return l10n.formula_teorema_tales_desc;
    case 'formula_teorema_tales_example':
      return l10n.formula_teorema_tales_example;
    case 'formula_teorema_tales_explanation':
      return l10n.formula_teorema_tales_explanation;

    default:
      return key; // Devuelve la clave si no se encuentra la traducción
  }
}
