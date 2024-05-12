import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:handyzone/Components/custom_button.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Routes/routes.dart';
import 'package:handyzone/Theme/colors.dart';

class ProviderReview extends StatefulWidget {
  @override
  _ProviderReviewState createState() => _ProviderReviewState();
}

class ProvidersData {
  String image;
  String name;
  String date;

  ProvidersData(this.image, this.name, this.date);
}

class _ProviderReviewState extends State<ProviderReview> {
  List<ProvidersData> _providersData = [
    ProvidersData(
        'assets/Reviews/Jassica.png', 'Jassica Haydon', '20 Dec, 2020'),
    ProvidersData('assets/Reviews/Peter.png', 'Peter George', '18 Dec, 2020'),
    ProvidersData(
        'assets/Reviews/Illiana.png', 'Illiana Jackson', '22 Nov, 2020'),
  ];
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.background,
          toolbarHeight: 100,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
            ),
          ),
          title: ListTile(
            contentPadding: EdgeInsets.only(top: 20),
            title: FadedScaleAnimation(
              child: Text(
                'Emili Anderson',
                style: theme.textTheme.bodyLarge!.copyWith(fontSize: 24),
              ),
              // durationInMilliseconds: 800,
            ),
            subtitle: Text(
              locale.cleaner!,
              style: TextStyle(color: iconColor, fontWeight: FontWeight.w600),
            ),
            trailing: Column(
              children: [
                Icon(Icons.keyboard_arrow_up),
                Text(locale.top!),
              ],
            ),
          ),
        ),
        // backgroundColor: Color(0xffEBF3F9),
        body: Stack(
          children: [
            ListView(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 36, right: 36, top: 16, bottom: 8),
                  child: Text(
                    locale.latestReviews!,
                    style: TextStyle(
                        color: iconColor, fontWeight: FontWeight.w600),
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _providersData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 16, right: 20, left: 20),
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                          color: theme.colorScheme.background,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.all(0),
                            leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage(_providersData[index].image),
                            ),
                            title: Text(_providersData[index].name),
                            subtitle: Text(_providersData[index].date),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FadedScaleAnimation(
                                  child: Icon(
                                    Icons.star,
                                    color: Color(0xffffae22),
                                    size: 18,
                                  ),
                                  // durationInMilliseconds: 1000,
                                ),
                                FadedScaleAnimation(
                                  child: Icon(
                                    Icons.star,
                                    color: Color(0xffffae22),
                                    size: 18,
                                  ),
                                  // durationInMilliseconds: 1000,
                                ),
                                FadedScaleAnimation(
                                  child: Icon(
                                    Icons.star,
                                    color: Color(0xffffae22),
                                    size: 18,
                                  ),
                                  // durationInMilliseconds: 1000,
                                ),
                                FadedScaleAnimation(
                                  child: Icon(
                                    Icons.star,
                                    color: Color(0xffffae22),
                                    size: 18,
                                  ),
                                  // durationInMilliseconds: 1000,
                                ),
                                FadedScaleAnimation(
                                  child: Icon(
                                    Icons.star,
                                    color: Color(0xffffae22),
                                    size: 18,
                                  ),
                                  // durationInMilliseconds: 1000,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur ilors adipisicing elit, sed do eiusmoditem por incidi dunt ut labore et dolore magna. aliqua.',
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.black,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () async {
                              await showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  backgroundColor: Colors.transparent,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Container(
                                      height: 200,
                                      child: ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: 2,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                end: 8),
                                            child: Image.asset(
                                              'assets/Handyzone/servicerequestpic1.jpg',
                                              height: 70,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.asset(
                                    'assets/Handyzone/servicerequestpic1.jpg',
                                    height: 70,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.asset(
                                    'assets/Handyzone/servicerequestpic1.jpg',
                                    height: 70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            PositionedDirectional(
                bottom: 20,
                start: 0,
                end: 0,
                child: CustomButton(
                  text: locale.hireRequest,
                  onTap: () {
                    Navigator.pushNamed(context, PageRoutes.confirmInformation);
                  },
                ))
          ],
        ));
  }
}
