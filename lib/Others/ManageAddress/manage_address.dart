import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Routes/routes.dart';
import 'package:handyzone/Theme/colors.dart';

class ManageAddress extends StatefulWidget {
  @override
  _ManageAddressState createState() => _ManageAddressState();
}

class _ManageAddressState extends State<ManageAddress> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(),
      body: FadedSlideAnimation(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
              // width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 20, bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locale.manageAddress!,
                          //textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 21,
                            letterSpacing: 0.11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          locale.preSavedAddresses!,
                          // textAlign: TextAlign.left,
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
                      child: Image.asset(
                        "assets/Handyzone/manage_address.png",
                      ),
                      // durationInMilliseconds: 800,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    //margin: EdgeInsets.only(top: 184),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                socialButton('assets/Handyzone/add.png',
                                    locale.addNewAddress!, () {
                                  Navigator.pushNamed(
                                      context, PageRoutes.addAddress);
                                }),
                              ],
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
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Image.asset(
                                      'assets/Icons/ic_home.png',
                                      scale: 2,
                                    ),
                                    title: Text(locale.home!),
                                    subtitle: Text(
                                        'B121 - Galaxy Residency, Hemiltone Tower, New York, USA. ' +
                                            '\n'),
                                  ),
                                  ListTile(
                                    leading: Image.asset(
                                      'assets/Handyzone/officeaddress.png',
                                      scale: 2,
                                    ),
                                    title: Text(locale.office!),
                                    subtitle: Text(
                                        '104 Business House, Near City Bank, New York, USA. ' +
                                            '\n'),
                                  ),
                                  ListTile(
                                    leading: Image.asset(
                                      'assets/Icons/location.png',
                                      scale: 2,
                                    ),
                                    title: Text(
                                      locale.location!,
                                    ),
                                    subtitle: Text(
                                        'B121 - Galaxy Residency, Hemiltone Tower, New York, USA. ' +
                                            '\n'),
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
            ),
          ],
        ),
        beginOffset: Offset(0.3, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }

  TextButton socialButton(String icon, String text, Function ontap) {
    return TextButton.icon(
      icon: ImageIcon(
        AssetImage(icon),
        color: Theme.of(context).colorScheme.background,
        size: 20,
      ),
      onPressed: ontap as void Function()?,
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
