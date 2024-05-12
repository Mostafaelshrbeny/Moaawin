import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:handyzone/Components/custom_button.dart';
import 'package:handyzone/Components/entry_field.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Routes/routes.dart';
import 'package:handyzone/Theme/colors.dart';

class VerificationUI extends StatefulWidget {
  @override
  _VerificationUIState createState() => _VerificationUIState();
}

class _VerificationUIState extends State<VerificationUI> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          FadedSlideAnimation(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height,
                child: Column(
                  children: [
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
                                padding: const EdgeInsets.only(
                                    bottom: 8, top: 8, left: 16, right: 16),
                                child: Text(
                                  locale.verification!,
                                  style: TextStyle(
                                      fontSize: 21.0,
                                      letterSpacing: 0.11,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(
                                  locale.inLessThanAMinute!,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.5,
                                      color: iconColor),
                                ),
                              ),
                            ],
                          ),
                          Image.asset("assets/Handyzone/vct_verification.png",
                              scale: 1.5),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.68,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                          color: theme.colorScheme.background,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 16, bottom: 30, right: 16),
                            child: Text(
                              locale.weHaveSent6DigitVerificationCode!,
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500,
                                  color: iconColor,
                                  fontSize: 16),
                            ),
                          ),
                          EntryField(
                            label: locale.enterCode,
                            hint: locale.enter6DigitCode,
                          ),
                          Spacer(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            beginOffset: Offset(0, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
          PositionedDirectional(
            bottom: 20,
            start: 0,
            end: 0,
            child: CustomButton(
              text: locale.getStarted,
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.appNavigation);
              },
            ),
          ),
        ],
      ),
    );
  }
}
