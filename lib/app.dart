import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/theme/app_theme.dart';
import 'presentation/blocs/settings_bloc.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/splash_screen.dart';

class BibleStoriesApp extends StatelessWidget {
  const BibleStoriesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        }

        return MaterialApp(
          title: 'Bible Stories',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme(state.languageCode),
          darkTheme: AppTheme.darkTheme(state.languageCode),
          themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          locale: Locale(state.languageCode),
          supportedLocales: const [
            Locale('en'),
            Locale('am'),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: const HomeScreen(),
        );
      },
    );
  }
}
