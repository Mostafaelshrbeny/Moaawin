import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:handyzone/Components/custom_button.dart';
import 'package:handyzone/Components/entry_field.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Routes/routes.dart';
import 'package:handyzone/Theme/colors.dart';

class AddReview extends StatefulWidget {
  @override
  _AddReviewState createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return FadedSlideAnimation(
      child: Scaffold(
        appBar: AppBar(),
        body: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locale.rate!,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Theme.of(context).hintColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12, top: 5),
                          child: Text(
                            'Emili Anderson',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 21,
                              letterSpacing: 0.11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            FadedScaleAnimation(
                              child: Icon(
                                Icons.star,
                                color: iconColor,
                                size: 38,
                              ),
                              scaleDuration: Duration(milliseconds: 800),
                            ),
                            FadedScaleAnimation(
                              child: Icon(
                                Icons.star,
                                color: iconColor,
                                size: 38,
                              ),
                            ),
                            FadedScaleAnimation(
                              child: Icon(
                                Icons.star,
                                color: iconColor,
                                size: 38,
                              ),
                            ),
                            FadedScaleAnimation(
                              child: Icon(
                                Icons.star,
                                color: iconColor,
                                size: 38,
                              ),
                            ),
                            FadedScaleAnimation(
                              child: Icon(
                                Icons.star,
                                color: iconColor,
                                size: 38,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    FadedScaleAnimation(
                      child:
                          Image.asset("assets/Providers/Emili.png", scale: 3.0),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: theme.colorScheme.background,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 25, left: 16, bottom: 0, right: 16),
                            child: Text(
                              locale.addPhotos!,
                              style: TextStyle(
                                  letterSpacing: 0.05,
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          // Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.grey[100],
                              ),
                              height: 120,
                              width: 120,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.grey[300],
                              ),
                            ),
                          ),
                          EntryField(
                            label: locale.yourFeedback,
                            hint: locale.howWasYourExperience,
                          ),
                          SizedBox(
                            height: 250,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                // height: MediaQuery.of(context).size.height / 6,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  color: theme.colorScheme.background,
                  boxShadow: [
                    BoxShadow(
                      // spreadRadius: 3,
                      offset: Offset.fromDirection(50),
                      blurRadius: 5,
                      color: Colors.grey,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          locale.amountToPay!,
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: iconColor,
                          ),
                        ),
                        Text(
                          '\$24.00',
                          style: theme.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                      ],
                    ),
                    // Spacer(),
                    CustomButton(
                      text: locale.submitAndPay,
                      onTap: () {
                        Navigator.pushNamed(context, PageRoutes.paymentDone);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      beginOffset: Offset(0.3, 0.3),
      endOffset: Offset(0, 0),
      slideCurve: Curves.linearToEaseOut,
    );
  }
}
