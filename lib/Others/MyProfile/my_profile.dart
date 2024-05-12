import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Routes/routes.dart';
import 'package:handyzone/Theme/colors.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(),
      body: FadedSlideAnimation(
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        'assets/Handyzone/headerbg.png',
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.8,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned.directional(
                      textDirection: Directionality.of(context),
                      start: 10,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 15, top: 30),
                        child: Text(
                          locale.myProfile!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            letterSpacing: 0.11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Positioned.directional(
                      textDirection: Directionality.of(context),
                      start: 10,
                      top: 44,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 15, top: 30),
                        child: Text(
                          locale.everythingAboutYou!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 0.11,
                            fontWeight: FontWeight.w500,
                            color: iconColor,
                          ),
                        ),
                      ),
                    ),
                    PositionedDirectional(
                        end: 30,
                        top: 8,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            FadedScaleAnimation(
                              child: CircleAvatar(
                                child: Image.asset(
                                  'assets/Profiles/hatMam.png',
                                ),
                                radius: 60,
                              ),
                              // durationInMilliseconds: 400,
                            ),
                            PositionedDirectional(
                              start: 100,
                              top: 48,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: theme.primaryColor,
                                  size: 20,
                                ),
                                radius: 20,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.7,
                    padding: EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ListTile(
                              title: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  locale.fullName!,
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ),
                              subtitle: Text(
                                'Samantha Smith',
                                style: theme.textTheme.bodyLarge,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            ListTile(
                              title: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  locale.emailAddress!,
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ),
                              subtitle: Text('samantha@mail.com'),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            ListTile(
                              title: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  locale.phoneNumber!,
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ),
                              subtitle: Text('+1 987 654 3210'),
                            ),
                            SizedBox(
                              height: 200,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Color(0xffebf3f9),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, PageRoutes.homePage);
                },
                child: Text(
                  locale.logout!,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: theme.primaryColor),
                ),
              ),
            ),
          ],
        ),
        beginOffset: Offset(0, 0.1),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
        // slideDurationInMilliseconds: 10,
        // durationInMilliseconds: 10,
      ),
    );
  }
}
