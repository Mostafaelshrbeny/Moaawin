import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:handyzone/Components/custom_button.dart';
import 'package:handyzone/Components/entry_field.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Routes/routes.dart';
import 'package:handyzone/Theme/colors.dart';

class AddAddress extends StatefulWidget {
  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  int? _currentValue = -1;
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Scaffold(
      //  appBar: AppBar(),
      body: FadedSlideAnimation(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.8,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/Handyzone/map.png',
                      width: MediaQuery.of(context).size.width / 0.9,
                      height: MediaQuery.of(context).size.height / 1.7,
                      fit: BoxFit.fill,
                    ),
                    PositionedDirectional(
                      bottom: 120,
                      start: 150,
                      child: FadedScaleAnimation(
                        child: Image.asset(
                          'assets/Icons/green_location.png',
                          scale: 3.5,
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      top: 80,
                      start: 20,
                      end: 20,
                      child: FadedScaleAnimation(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                filled: true,
                                hintText: locale.searchService,
                                fillColor: theme.colorScheme.background,
                                prefixIcon: Icon(Icons.search),
                                suffixIcon: Icon(Icons.my_location_sharp)),
                          ),
                        ),
                      ),
                    ),
                    AppBar(),
                  ],
                ),
              ),
              Container(
                //margin: EdgeInsets.only(top: 184),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //  Spacer(),
                            Theme(
                              data: ThemeData.dark(),
                              child: Radio(
                                value: 1,
                                groupValue: _currentValue,
                                onChanged: (dynamic value) {
                                  setState(() {
                                    _currentValue = value;
                                  });
                                },
                                focusColor:
                                    Theme.of(context).colorScheme.background,
                                activeColor:
                                    Theme.of(context).colorScheme.background,
                              ),
                            ),
                            Text(
                              locale.home!,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.background,
                              ),
                            ),
                            VerticalDivider(
                              thickness: 0.5,
                              color: Theme.of(context).colorScheme.background,
                              indent: 30,
                              endIndent: 30,
                            ),
                            Theme(
                              data: ThemeData.dark(),
                              child: Radio(
                                value: 2,
                                focusColor:
                                    Theme.of(context).colorScheme.background,
                                activeColor:
                                    Theme.of(context).colorScheme.background,
                                groupValue: _currentValue,
                                onChanged: (dynamic value) {
                                  setState(() {
                                    _currentValue = value;
                                  });
                                },
                              ),
                            ),
                            Text(
                              locale.office!,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.background,
                              ),
                            ),
                            VerticalDivider(
                              thickness: 0.5,
                              color: Theme.of(context).colorScheme.background,
                              indent: 30,
                              endIndent: 30,
                            ),
                            Theme(
                              data: ThemeData.dark(),
                              child: Radio(
                                value: 3,
                                hoverColor:
                                    Theme.of(context).colorScheme.background,
                                focusColor:
                                    Theme.of(context).colorScheme.background,
                                activeColor:
                                    Theme.of(context).colorScheme.background,
                                groupValue: _currentValue,
                                onChanged: (dynamic value) {
                                  setState(() {
                                    _currentValue = value;
                                  });
                                },
                              ),
                            ),
                            Text(
                              locale.others!,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.background,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
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
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ListTile(
                              leading: FadedScaleAnimation(
                                child: Image.asset(
                                  'assets/Icons/green_location.png',
                                  scale: 5,
                                ),
                              ),
                              title: Text(
                                'B121 - Galaxy Residency, Hemiltone Tower,' +
                                    '\n' +
                                    'New York, USA.',
                                style:
                                    TextStyle(fontSize: 12, color: iconColor),
                              ),
                            ),
                            EntryField(
                              label: locale.addLandmark,
                              hint: locale.writeaddressLandmark,
                            ),
                            CustomButton(
                              text: locale.saveAddress!.toUpperCase(),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, PageRoutes.manageAddress);
                              },
                            ),
                            SizedBox(
                              height: 16,
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
