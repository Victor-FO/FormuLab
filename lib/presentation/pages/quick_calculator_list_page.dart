import 'package:flutter/material.dart';
import 'package:testcalc/l10n/app_localizations.dart';
import 'package:testcalc/presentation/pages/calculators/ecuacion_segundo_grado_page.dart';
import 'package:testcalc/presentation/pages/calculators/pitagoras_page.dart';
import 'package:testcalc/presentation/pages/calculators/area_circulo_page.dart';
import 'package:testcalc/presentation/pages/calculators/area_triangulo_page.dart';
import 'package:testcalc/presentation/pages/calculators/area_rombo_page.dart';
import 'package:testcalc/presentation/pages/calculators/area_poligono_regular_page.dart';
import 'package:testcalc/presentation/pages/calculators/volumen_esfera_page.dart';
import 'package:testcalc/presentation/pages/calculators/distancia_puntos_page.dart';
import 'package:testcalc/presentation/pages/calculators/tales_page.dart';

class QuickCalculatorListPage extends StatelessWidget {
  const QuickCalculatorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.homeQuickCalcButton),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        children: [
          _buildCalculatorItem(
            context,
            l10n.formula_ecuacion_segundo_grado_name,
            Icons.calculate,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EcuacionSegundoGradoPage(),
                ),
              );
            },
          ),
          _buildCalculatorItem(
            context,
            l10n.pitagoras_title,
            Icons.square_foot,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PitagorasPage(),
                ),
              );
            },
          ),
          _buildCalculatorItem(
            context,
            l10n.circulo_title,
            Icons.circle_outlined,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AreaCirculoPage(),
                ),
              );
            },
          ),
          _buildCalculatorItem(
            context,
            l10n.triangulo_title,
            Icons.architecture,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AreaTrianguloPage(),
                ),
              );
            },
          ),
          _buildCalculatorItem(
            context,
            l10n.rombo_title,
            Icons.diamond_outlined,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AreaRomboPage(),
                ),
              );
            },
          ),
          _buildCalculatorItem(
            context,
            l10n.poligono_title,
            Icons.pentagon_outlined,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AreaPoligonoRegularPage(),
                ),
              );
            },
          ),
          _buildCalculatorItem(
            context,
            l10n.esfera_title,
            Icons.public,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const VolumenEsferaPage(),
                ),
              );
            },
          ),
          _buildCalculatorItem(
            context,
            l10n.puntos_title,
            Icons.straighten,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DistanciaPuntosPage(),
                ),
              );
            },
          ),
          _buildCalculatorItem(
            context,
            l10n.tales_title,
            Icons.linear_scale,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TalesPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCalculatorItem(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Próximamente disponible'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
