import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Theme/colors.dart';

class Questions {
  String question;
  bool isOpen;
  Questions(this.question, this.isOpen);
}

class FAQ extends StatefulWidget {
  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  List<bool> isOpen = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    List<String?> _questions = [
      locale.howToBookAProvider,
      locale.howToReviewAProvider,
      locale.howToPayToAProvider,
      locale.howToAddMoneyInWallet,
      locale.canIRescheduleBooking,
      locale.howToCancelBooking,
      locale.howToChangeLanguage,
      locale.howToLogoutMyAccount,
      locale.howToBookAProvider,
      locale.howToReviewAProvider,
      locale.howToPayToAProvider,
      locale.howToAddMoneyInWallet,
      locale.canIRescheduleBooking,
      locale.howToCancelBooking,
      locale.howToChangeLanguage,
      locale.howToLogoutMyAccount,
    ];
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: FadedSlideAnimation(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locale.faqs!,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 22,
                            letterSpacing: 0.11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          locale.getYourQuestionsAnswered!,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.8,
                              fontSize: 15,
                              color: iconColor),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: FadedScaleAnimation(
                      child: Image.asset(
                        "assets/Handyzone/privacy_policy.png",
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 18),
                  decoration: BoxDecoration(
                      color: theme.colorScheme.background,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: _questions.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isOpen[index] = !isOpen[index];
                                  });
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      _questions[index]!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                    isOpen[index]
                                        ? Icon(
                                            Icons.keyboard_arrow_up,
                                            color: iconColor,
                                          )
                                        : Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            color: iconColor,
                                          )
                                  ],
                                ),
                              ),
                              isOpen[index]
                                  ? SizedBox(
                                      height: 15,
                                    )
                                  : SizedBox.shrink(),
                              isOpen[index]
                                  ? Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ')
                                  : SizedBox.shrink()
                            ],
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
        beginOffset: Offset(0.3, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
