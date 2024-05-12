import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Routes/routes.dart';
import 'package:handyzone/Theme/colors.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, PageRoutes.myProfile);
            },
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                'assets/Handyzone/headerbg.png',
                height: 200,
                width: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned.directional(
            textDirection: Directionality.of(context),
            start: 10,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 15, top: 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, PageRoutes.myProfile);
                },
                child: Text(
                  'Samantha Smith',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    letterSpacing: 0.11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Positioned.directional(
            textDirection: Directionality.of(context),
            start: 10,
            top: 44,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 15, top: 30),
              child: Text(
                '+1 987 654 3210',
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
            end: 28,
            top: 8,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.myProfile);
              },
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(50),
                child: FadedScaleAnimation(
                  child: CircleAvatar(
                    child: Image.asset('assets/Profiles/hatMam.png'),
                    radius: 44,
                  ),
                  // durationInMilliseconds: 800,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, PageRoutes.wallet);
            },
            child: Container(
              margin: EdgeInsets.only(top: 184),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.all(20),
                    leading: FadedScaleAnimation(
                      child: Icon(
                        Icons.wallet_giftcard,
                        color: theme.colorScheme.background,
                      ),
                      // durationInMilliseconds: 800,
                    ),
                    title: Text(
                      locale.wallet!,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        locale.quickPayments!,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '\$159.50    ',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 4),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, PageRoutes.manageAddress);
                            },
                            leading: FadedScaleAnimation(
                              child: Image.asset(
                                'assets/Icons/location.png',
                                scale: 2,
                              ),
                              // durationInMilliseconds: 800,
                            ),
                            title: Text(locale.manageAddress!),
                            subtitle: Text(locale.preSavedAddresses!),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, PageRoutes.support);
                            },
                            leading: FadedScaleAnimation(
                              child: Image.asset(
                                'assets/Icons/support.png',
                                scale: 2,
                              ),
                              // durationInMilliseconds: 800,
                            ),
                            title: Text(locale.support!),
                            subtitle: Text(locale.connectUs!),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, PageRoutes.privacyPolicy);
                            },
                            leading: FadedScaleAnimation(
                              child: Image.asset(
                                'assets/Icons/privacy_policy.png',
                                scale: 2,
                              ),
                              // durationInMilliseconds: 800,
                            ),
                            title: Text(locale.privacyPolicy!),
                            subtitle: Text(locale.knowOurPrivacyPolicies!),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, PageRoutes.languageUi);
                            },
                            leading: FadedScaleAnimation(
                              child: Image.asset(
                                'assets/Icons/language.png',
                                scale: 2,
                              ),
                              // durationInMilliseconds: 800,
                            ),
                            title: Text(locale.changeLanguage!),
                            subtitle: Text(locale.setYourPreferredLanguage!),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, PageRoutes.faq);
                            },
                            leading: FadedScaleAnimation(
                              child: Image.asset(
                                'assets/Icons/faqs.png',
                                scale: 2,
                              ),
                              // durationInMilliseconds: 800,
                            ),
                            title: Text(locale.faqs!),
                            subtitle: Text(locale.getYourQuestionsAnswered!),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: AppConfig.isDemoMode
      //     ? BuyThisApp.button(
      //         AppConfig.appName,
      //         'https://dashboard.vtlabs.dev/projects/envato-referral-buy-link?project_slug=handyzone_flutter',
      //       )
      //     : null,
      // bottomNavigationBar: AppConfig.isDemoMode
      //     ? Container(
      //         padding: const EdgeInsets.all(8),
      //         child: BuyThisApp.developerRowOpus(
      //             Colors.transparent, Theme.of(context).primaryColor),
      //       )
      //     : const SizedBox.shrink(),
    );
  }
}
