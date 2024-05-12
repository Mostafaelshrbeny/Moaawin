import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyzone/Components/custom_button.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Routes/routes.dart';
import 'package:handyzone/Theme/colors.dart';

import '../../Config/app_config.dart';
import '../../language_cubit.dart';

class LanguageUI extends StatefulWidget {
  @override
  _LanguageUIState createState() => _LanguageUIState();
}

class _LanguageUIState extends State<LanguageUI> {
  late LanguageCubit _languageCubit;
  String? selectedLocal;

  @override
  void initState() {
    super.initState();
    _languageCubit = BlocProvider.of<LanguageCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return BlocBuilder<LanguageCubit, Locale>(
        builder: (context, currentLocale) {
      selectedLocal ??= currentLocale.languageCode;
      return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: SafeArea(
          child: FadedSlideAnimation(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context)),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              locale.language!,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 22,
                                letterSpacing: 0.11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              locale.preferredLanguage!,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.8,
                                  fontSize: 15,
                                  color: iconColor),
                            ),
                          ),
                        ],
                      ),
                      FadedScaleAnimation(
                        child: Image.asset(
                          "assets/Handyzone/language.png",
                          scale: 3,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                  height: MediaQuery.of(context).size.height * 0.72,
                  decoration: BoxDecoration(
                      color: theme.colorScheme.background,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 24),
                        child: Text(
                          locale.selectPreferredLanguage!,
                          style: theme.textTheme.bodyLarge!.copyWith(
                            fontSize: 18,
                            letterSpacing: 0.08,
                          ),
                        ),
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: AppConfig.languagesSupported.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return RadioListTile(
                            value: AppConfig.languagesSupported.keys
                                .elementAt(index),
                            groupValue: selectedLocal,
                            title: Text(
                              AppConfig
                                  .languagesSupported[AppConfig
                                      .languagesSupported.keys
                                      .elementAt(index)]!
                                  .name,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            onChanged: (langCode) => setState(
                                () => selectedLocal = langCode as String),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        text: locale.submit,
                        onTap: () {
                          _languageCubit.setCurrentLanguage(
                              selectedLocal!, true);
                          Navigator.pushNamed(context, PageRoutes.signIn);
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
            beginOffset: Offset(0, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
        ),
      );
    });
  }
}
