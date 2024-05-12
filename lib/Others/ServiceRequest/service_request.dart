import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:handyzone/Components/custom_button.dart';
import 'package:handyzone/Components/entry_field.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Routes/routes.dart';
import 'package:handyzone/Theme/colors.dart';

class ServiceRequestUI extends StatefulWidget {
  @override
  _ServiceRequestUIState createState() => _ServiceRequestUIState();
}

class _ServiceRequestUIState extends State<ServiceRequestUI> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Scaffold(
      // backgroundColor: Color(0xffEBF3F9),
      body: SafeArea(
        child: FadedSlideAnimation(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context)),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, PageRoutes.signUp);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        locale.skip!,
                        style: TextStyle(
                            letterSpacing: 2,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            locale.serviceRequest!,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 21,
                              letterSpacing: 0.11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          locale.letUsKnowTheProblem!,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              color: iconColor),
                        ),
                      ],
                    ),
                    FadedScaleAnimation(
                      child: Image.asset(
                          "assets/Handyzone/vct_servicerequest.png",
                          scale: 1.5),
                      // durationInMilliseconds: 800,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(
                      color: theme.colorScheme.background,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25, left: 16, bottom: 30, right: 16),
                          child: Text(
                            locale.describeWhatProblemFacing!,
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.black,
                                fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.asset(
                                  'assets/Handyzone/servicerequestpic1.jpg',
                                  height: 120,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
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
                              )
                            ],
                          ),
                        ),
                        EntryField(
                          label: locale.writeShortDescription,
                          hint: locale.shareYourExperience,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                          text: locale.findProvider,
                          onTap: () {
                            Navigator.pushNamed(
                                context, PageRoutes.listOfProviders);
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
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
