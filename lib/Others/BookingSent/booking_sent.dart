import 'package:flutter/material.dart';
import 'package:handyzone/Components/custom_button.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Routes/routes.dart';
import 'package:handyzone/Theme/colors.dart';

class BookingSent extends StatefulWidget {
  @override
  _BookingSentState createState() => _BookingSentState();
}

class _BookingSentState extends State<BookingSent> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(
            flex: 7,
          ),
          Image.asset(
            'assets/Handyzone/booking_sent.png',
            height: 170,
            width: 170,
          ),
          Spacer(
            flex: 2,
          ),
          Text(
            locale.congratulations!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: iconColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            locale.bookingRequestSent!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
          Spacer(
            flex: 7,
          ),
          CustomButton(
            text: locale.myBookings,
            onTap: () {
              Navigator.pushNamed(context, PageRoutes.appNavigation);
            },
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
