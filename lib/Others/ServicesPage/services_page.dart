import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Routes/routes.dart';

class Service {
  String image;
  String? title;
  String subtitle;
  Service(this.image, this.title, this.subtitle);
}

class ServicesPageUI extends StatefulWidget {
  @override
  _ServicesPageUIState createState() => _ServicesPageUIState();
}

class _ServicesPageUIState extends State<ServicesPageUI> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    List<Service> _serviceList = [
      Service('assets/HomeClean/ic_carpet.png', locale.carpetShampooing,
          '\$20 ' + locale.onwards!),
      Service('assets/HomeClean/ic_sofa.png', locale.sofaShampooing,
          '\$22 ' + locale.onwards!),
      Service('assets/HomeClean/ic_bedroon.png', locale.bedroomDeepCleaning,
          '\$35 ' + locale.onwards!),
      Service('assets/HomeClean/ic_fullhome.png', locale.fullHomeDeepCleaning,
          '\$55 ' + locale.onwards!),
      Service('assets/HomeClean/ic_aqrm.png', locale.aquariumCleaning,
          '\$10 ' + locale.onwards!),
      Service('assets/HomeClean/ic_wasahroom.png', locale.toiletCleaning,
          '\$12 ' + locale.onwards!),
      Service('assets/HomeClean/ic_floor.png',
          locale.floorScrubbingAndPolishing, '\$18 ' + locale.onwards!),
      Service('assets/HomeClean/ic_carpet.png', locale.carpetShampooing,
          '\$20 ' + locale.onwards!),
      Service('assets/HomeClean/ic_sofa.png', locale.sofaShampooing,
          '\$22 ' + locale.onwards!),
      Service('assets/HomeClean/ic_bedroon.png', locale.bedroomDeepCleaning,
          '\$35 ' + locale.onwards!),
      Service('assets/HomeClean/ic_fullhome.png', locale.fullHomeDeepCleaning,
          '\$55 ' + locale.onwards!),
    ];

    return Scaffold(
      appBar: AppBar(),
      body: FadedSlideAnimation(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/Handyzone/headerbg.png',
                  height: 200,
                  width: MediaQuery.of(context).size.width * 1.4,
                  fit: BoxFit.fill,
                ),
                Positioned.directional(
                  textDirection: Directionality.of(context),
                  start: 12,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 30),
                    child: Text(
                      locale.homeClean!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 0.11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                PositionedDirectional(
                  end: 72,
                  bottom: 0,
                  child: FadedScaleAnimation(
                    child: Image.asset(
                      'assets/Profiles/img_cleaner.png',
                      scale: 3,
                    ),
                    // durationInMilliseconds: 800,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: theme.colorScheme.background,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      physics: BouncingScrollPhysics(),
                      itemCount: _serviceList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, PageRoutes.serviceRequest);
                            },
                            leading: FadedScaleAnimation(
                              child: Image.asset(_serviceList[index].image),
                              // durationInMilliseconds: 800,
                            ),
                            title: Text(_serviceList[index].title!),
                            subtitle: Text(_serviceList[index].subtitle),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                            ),
                          ),
                        );
                      })),
            )
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
