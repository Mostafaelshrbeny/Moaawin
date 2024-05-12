import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:handyzone/Others/Language/language_ui.dart';
import 'Locale/locales.dart';
import 'Routes/routes.dart';
import 'Theme/styles.dart';
import 'language_cubit.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MultiBlocProvider(providers: [
    BlocProvider<LanguageCubit>(
      create: (context) => LanguageCubit(),
    ),
  ], child: Phoenix(child: Handyzone())));
  MobileAds.instance.initialize();
}

class Handyzone extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LanguageCubit>(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (_, locale) {
          return MaterialApp(
            localizationsDelegates: [
              const AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.getSupportedLocales(),
            locale: locale,
            theme: appTheme,
            home: LanguageUI(),
            routes: PageRoutes().routes(),
          );
        },
      ),
    );
  }
}
