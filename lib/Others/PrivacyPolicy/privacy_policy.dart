import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Theme/colors.dart';

class PrivacyPolicy extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
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
                            locale.privacyPolicy!,
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
                            locale.howWeWork!,
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
                    Expanded(
                      child: FadedScaleAnimation(
                        child: Image.asset(
                          "assets/Handyzone/privacy_policy.png",
                        ),
                        // durationInMilliseconds: 600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                height: MediaQuery.of(context).size.height * 0.68,
                decoration: BoxDecoration(
                    color: theme.colorScheme.background,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          locale.termsOfUse!,
                          style: theme.textTheme.bodyLarge!.copyWith(
                            fontSize: 15,
                            letterSpacing: 0.08,
                          ),
                        ),
                      ),
                      Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontSize: 15,
                          letterSpacing: 0.08,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          locale.privacyPolicy!,
                          style: theme.textTheme.bodyLarge!.copyWith(
                            fontSize: 15,
                            letterSpacing: 0.08,
                          ),
                        ),
                      ),
                      Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontSize: 15,
                          letterSpacing: 0.08,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontSize: 15,
                            letterSpacing: 0.08,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          beginOffset: Offset(0.3, 0.3),
          endOffset: Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
        ),
      ),
    );
  }
}
