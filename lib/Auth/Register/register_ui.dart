import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:handyzone/Components/custom_button.dart';
import 'package:handyzone/Components/entry_field.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Routes/routes.dart';
import 'package:handyzone/Theme/colors.dart';

class RegisterUI extends StatefulWidget {
  @override
  _RegisterUIState createState() => _RegisterUIState();
}

class _RegisterUIState extends State<RegisterUI> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          FadedSlideAnimation(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8, top: 8),
                          child: Text(
                            locale.register!,
                            style: TextStyle(
                                fontSize: 21.0,
                                letterSpacing: 0.11,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          locale.inLessThanAMinute!,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).hintColor),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                    Image.asset("assets/Handyzone/vct_register.png",
                        scale: 3.0),
                  ],
                ),
                Expanded(
                  child: Container(
                    // height: MediaQuery.of(context).size.height * 0.68,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                        color: theme.colorScheme.background,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          EntryField(
                            label: locale.fullName,
                            hint: locale.enterFullName,
                          ),
                          EntryField(
                            label: locale.emailAddress,
                            hint: locale.enterEmailAddress,
                          ),
                          EntryField(
                            label: locale.phoneNumber,
                            hint: locale.enterPhoneNumber,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            beginOffset: Offset(0, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    locale.weWillSendVerificationCode!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: iconColor, fontSize: 16, letterSpacing: 1),
                  ),
                ),
                CustomButton(
                  onTap: () {
                    Navigator.pushNamed(context, PageRoutes.verificationPage);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
