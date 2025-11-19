import 'package:flutter/material.dart';
import 'package:testcalc/main.dart';
import 'package:testcalc/presentation/pages/formulas_list_page.dart';
import 'package:testcalc/l10n/app_localizations.dart';
import 'package:testcalc/presentation/pages/quick_calculator_list_page.dart';


/// Página principal de la aplicación
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: () => _showInfoDialog(context),
        ),
        title: Text(l10n.appTitle),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () => _showLanguagePicker(context),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                const Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/icon/icon_logo.png'),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  l10n.homeWelcome,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.homeSubtitle,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                _buildActionCard(
                  context,
                  icon: Icons.functions,
                  title: l10n.homeFormulasButton,
                  description: l10n.homeFormulasButtonDesc,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FormulasListPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _buildActionCard(
                  context,
                  icon: Icons.calculate_outlined,
                  title: l10n.homeQuickCalcButton,
                  description: l10n.homeQuickCalcButtonDesc,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuickCalculatorListPage(),
                      ),
                    );
                  },
                ),
                const Spacer(),
                Text(
                  l10n.homeStartMessage,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showInfoDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Info'),
          content: Text(l10n.infoText),
          actions: [
            TextButton(
              child: Text(l10n.cerrarText),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showLanguagePicker(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(l10n.language),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildLanguageTile(context, '🇪🇸', l10n.spanish, const Locale('es')),
                _buildLanguageTile(context, '🇬🇧', l10n.english, const Locale('en')),
                _buildLanguageTile(context, '🇫🇷', l10n.french, const Locale('fr')),
                _buildLanguageTile(context, '🇩🇪', l10n.german, const Locale('de')),
                _buildLanguageTile(context, '🇮🇹', l10n.italian, const Locale('it')),
                _buildLanguageTile(context, '🇵🇹', l10n.portuguese, const Locale('pt')),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildLanguageTile(BuildContext context, String flag, String languageName, Locale locale) {
    return ListTile(
      leading: Text(flag, style: const TextStyle(fontSize: 24)),
      title: Text(languageName),
      onTap: () {
        MyApp.setLocale(context, locale);
        Navigator.of(context).pop();
      },
    );
  }

  Widget _buildActionCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
