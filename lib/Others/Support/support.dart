import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:handyzone/Components/custom_button.dart';
import 'package:handyzone/Components/entry_field.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Theme/colors.dart';

class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: FadedSlideAnimation(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  // height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              locale.support!,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 24,
                                letterSpacing: 0.11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              locale.connect!,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                  fontSize: 15,
                                  color: iconColor),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: FadedScaleAnimation(
                          child: Image.asset("assets/Handyzone/language.png"),
                          // durationInMilliseconds: 800,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    //margin: EdgeInsets.only(top: 184),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: ListView(
                      children: [
                        Container(
                          color: Theme.of(context).primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                socialButton('assets/Icons/ic_call.png',
                                    "  " + locale.callUs!),
                                Container(
                                  width: 1,
                                  height: 25,
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                                socialButton('assets/Icons/mail.png',
                                    "  " + locale.mailUs!)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 4),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.background,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 20),
                                child: Text(
                                  locale.writeUs!,
                                  style: theme.textTheme.bodyLarge!
                                      .copyWith(fontSize: 24),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  locale.letUsKnowYourQuery!,
                                  style:
                                      TextStyle(color: iconColor, fontSize: 16),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              EntryField(
                                label: locale.phoneNumberOrEmail,
                                hint: locale.addContactInfo,
                              ),
                              EntryField(
                                label: locale.addYourIssueOrFeedback,
                                hint: locale.writeYourMessage,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            PositionedDirectional(
              bottom: 20,
              start: 20,
              end: 20,
              child: CustomButton(
                text: locale.submit,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        beginOffset: Offset(0.3, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }

  TextButton socialButton(String icon, String text) {
    return TextButton.icon(
      icon: ImageIcon(
        AssetImage(icon),
        color: Theme.of(context).colorScheme.background,
        size: 20,
      ),
      onPressed: () {},
      label: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Theme.of(context).colorScheme.background),
      ),
    );
  }
}
