import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:handyzone/Components/custom_button.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Routes/routes.dart';
import 'package:handyzone/Theme/colors.dart';

class PaymentDone extends StatefulWidget {
  @override
  _PaymentDoneState createState() => _PaymentDoneState();
}

class _PaymentDoneState extends State<PaymentDone> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: FadedSlideAnimation(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(
              flex: 7,
            ),
            FadedScaleAnimation(
              child: Image.asset(
                'assets/Handyzone/paymentdone.png',
                height: 170,
                width: 170,
              ),
              // durationInMilliseconds: 800,
            ),
            Spacer(
              flex: 2,
            ),
            Text(
              locale.reviewHasBeenSubmitted!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: iconColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              locale.paymentDone!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Spacer(
              flex: 7,
            ),
            CustomButton(
              text: locale.home,
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.appNavigation);
              },
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
        beginOffset: Offset(0.3, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
