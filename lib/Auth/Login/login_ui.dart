import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:handyzone/Components/custom_button.dart';
import 'package:handyzone/Components/entry_field.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Routes/routes.dart';

class SignInUI extends StatefulWidget {
  @override
  _SignInUIState createState() => _SignInUIState();
}

class _SignInUIState extends State<SignInUI> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: FadedSlideAnimation(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Image.asset("assets/Handyzone/logo.png", scale: 3),
                  SizedBox(
                    height: 50,
                  ),
                  Image.asset("assets/Handyzone/top.png", scale: 3),
                  Container(
                    width: double.infinity,
                    // height: MediaQuery.of(context).size.height / 1.8,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          locale.signInNow!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: Theme.of(context).hintColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        EntryField(
                          label: locale.phoneNumber,
                          hint: locale.enterPhoneNumber,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CustomButton(
                          onTap: () {
                            Navigator.pushNamed(context, PageRoutes.signUp);
                          },
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          locale.orContinueWith!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: Theme.of(context).hintColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 65,
                padding: EdgeInsets.only(bottom: 10, top: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    socialButton('assets/Icons/ic_fb.png', locale.facebook!),
                    Container(
                      width: 1,
                      height: 25,
                      color: Theme.of(context).colorScheme.background,
                    ),
                    socialButton('assets/Icons/ic_ggl.png', locale.google!)
                  ],
                ),
              ),
            )
          ],
        ),
        beginOffset: Offset(0, 0.3),
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
