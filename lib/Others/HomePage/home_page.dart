import 'dart:io';

import 'package:animation_wrappers/animation_wrappers.dart';
// import 'package:buy_this_app/buy_this_app.dart';
import 'package:flutter/material.dart';

import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Routes/routes.dart';
import 'package:handyzone/Theme/colors.dart';

class HomePageUI extends StatefulWidget {
  @override
  _HomePageUIState createState() => _HomePageUIState();
}

class PopularService {
  String image;
  String? text;

  PopularService(this.image, this.text);
}

class _HomePageUIState extends State<HomePageUI> {
  @override
  void initState() {
    super.initState();
    _checkForBuyNow();
  }

  void _checkForBuyNow() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // if (!sharedPreferences.containsKey("key_buy_this_shown") &&
    //     AppConfig.isDemoMode) {
    //   Future.delayed(Duration(seconds: 10), () async {
    //     if (mounted) {
    //       BuyThisApp.showSubscribeDialog(context);
    //       sharedPreferences.setBool("key_buy_this_shown", true);
    //     }
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<PopularService> popularService = [
      PopularService('assets/PopularService/HomeClean.png', locale.homeClean),
      PopularService(
          'assets/PopularService/Electrician.png', locale.electrician),
      PopularService('assets/PopularService/Gardening.png', locale.gardening),
      PopularService('assets/PopularService/Carpenter.png', locale.carpenter),
      PopularService('assets/PopularService/Painter.png', locale.painter),
      PopularService('assets/PopularService/Plumber.png', locale.plumber),
      PopularService('assets/PopularService/Movers.png', locale.movers),
      PopularService(
          'assets/PopularService/HairAndBeauty.png', locale.hairAndBeauty),
      PopularService(
          'assets/PopularService/HomeSanitize.png', locale.homeSanitize),
    ];

    return Builder(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: iconColor,
                ),
                Text('Home',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: iconColor,
                        )),
              ],
            ),
            actions: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, PageRoutes.account);
                      },
                      child: FadedScaleAnimation(
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/Profiles/hatMam.png'),
                        ),
                        scaleDuration: Duration(milliseconds: 1000),
                      ),
                    ),
                    PositionedDirectional(
                      top: 3,
                      end: 3,
                      child: CircleAvatar(
                        radius: 3,
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: FadedSlideAnimation(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        "assets/Handyzone/top.png",
                        scale: 3,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        "assets/Handyzone/Handyzone.png",
                        scale: 3,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 70, left: 90, right: 90),
                      child: TextField(
                        readOnly: true,
                        onTap: () {
                          Navigator.pushNamed(context, PageRoutes.searchPage);
                        },
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              letterSpacing: 0.5,
                              fontSize: 14,
                            ),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            filled: true,
                            hintText: locale.searchService,
                            fillColor: Theme.of(context).colorScheme.surface,
                            prefixIcon: Icon(
                              Icons.search,
                              size: 24,
                              color: iconColor,
                            )),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    locale.popularServices!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    shrinkWrap: true,
                    itemCount: popularService.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.7),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Navigator.pushNamed(
                            context, PageRoutes.servicesPage,
                            arguments: index),
                        child: Stack(
                          children: [
                            Container(
                              color: Theme.of(context).colorScheme.surface,
                              width: double.infinity,
                              height: double.infinity,
                              margin: EdgeInsets.only(bottom: 20),
                            ),
                            PositionedDirectional(
                              bottom: 28,
                              start: 12,
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  popularService[index].text!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: Color(0xff808080)),
                                ),
                              ),
                            ),
                            PositionedDirectional(
                              bottom: 0,
                              end: 4,
                              child: FadedScaleAnimation(
                                  child: Image.asset(
                                    popularService[index].image,
                                    scale: 2.25,
                                  ),
                                  scaleDuration: Duration(milliseconds: 1000)),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            beginOffset: Offset(0, 0.8),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
        );
      },
    );
  }
}
