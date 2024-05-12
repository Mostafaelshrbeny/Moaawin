import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:handyzone/Components/custom_button.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Routes/routes.dart';
import 'package:handyzone/Theme/colors.dart';

class ListOfProviders extends StatefulWidget {
  @override
  _ListOfProvidersState createState() => _ListOfProvidersState();
}

class Providers {
  String title;
  String? subtitle;
  String jobs;
  String rate;
  String rating;
  String image;

  Providers(
      this.title, this.subtitle, this.jobs, this.rate, this.rating, this.image);
}

class _ListOfProvidersState extends State<ListOfProviders> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int? _currentSortValue = -1;
  int? _currentGenderValue = -1;
  int _value = 6;

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    List<String?> sortList = [locale.jobs, locale.rate, locale.rating];
    List<String?> genderList = [locale.female, locale.male, locale.any];
    List<Providers> _providersList = [
      Providers(
        'Emili Anderson',
        locale.cleaner,
        '187',
        '\$12',
        '4.5',
        'assets/Providers/Emili.png',
      ),
      Providers(
        'Alisha Patel',
        locale.cleaner,
        '112',
        '\$10',
        '4.3',
        'assets/Providers/Alisha.png',
      ),
      Providers(
        'Linda Haydon',
        locale.cleaner,
        '226',
        '\$9',
        '3.9',
        'assets/Providers/Linda.png',
      ),
      Providers(
        'Peter Johnson',
        locale.cleaner,
        '199',
        '\$12',
        '4.2',
        'assets/Providers/Peter.png',
      ),
      Providers(
        'Emili Anderson',
        locale.cleaner,
        '187',
        '\$12',
        '4.5',
        'assets/Providers/Emili.png',
      ),
      Providers(
        'Alisha Patel',
        locale.cleaner,
        '112',
        '\$10',
        '4.3',
        'assets/Providers/Alisha.png',
      ),
      Providers(
        'Linda Haydon',
        locale.cleaner,
        '226',
        '\$9',
        '3.9',
        'assets/Providers/Linda.png',
      ),
      Providers(
        'Peter Johnson',
        locale.cleaner,
        '199',
        '\$12',
        '4.2',
        'assets/Providers/Peter.png',
      ),
    ];
    return FadedSlideAnimation(
      child: Scaffold(
        // backgroundColor: theme.colorScheme.background,
        key: _scaffoldKey,
        endDrawer: Blur(
          colorOpacity: 0.85,
          blur: 3,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          overlay: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 56),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          locale.sortAndFilters!,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        locale.reset!,
                        style: TextStyle(
                            fontSize: 16,
                            color: iconColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  locale.sortBy!.padLeft(12).padRight(12),
                  style: TextStyle(
                      fontSize: 15,
                      color: iconColor,
                      fontWeight: FontWeight.w600),
                  textDirection: Directionality.of(context),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: sortList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return RadioListTile(
                      dense: true,
                      value: index,
                      title: Text(
                        sortList[index]!,
                        style: TextStyle(fontSize: 18),
                      ),
                      groupValue: _currentSortValue,
                      onChanged: (dynamic value) {
                        setState(
                          () {
                            _currentSortValue = value;
                          },
                        );
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  locale.priceRange!.padLeft(18).padRight(20),
                  style:
                      TextStyle(color: iconColor, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$40'.padLeft(10).padRight(10),
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    Text('\$100'.padLeft(10).padRight(18),
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18)),
                  ],
                ),
                Slider(
                  value: _value.toDouble(),
                  min: 1.0,
                  max: 100,
                  //  divisions: 10,
                  activeColor: theme.primaryColor,
                  inactiveColor: Colors.grey,

                  onChanged: (double newValue) {
                    setState(() {
                      _value = newValue.round();
                    });
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  locale.gender!.padLeft(13).padRight(20),
                  style:
                      TextStyle(color: iconColor, fontWeight: FontWeight.w600),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: genderList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return RadioListTile(
                      dense: true,
                      value: index,
                      title: Text(
                        genderList[index]!,
                        style: TextStyle(fontSize: 18),
                      ),
                      groupValue: _currentGenderValue,
                      onChanged: (dynamic value) {
                        setState(
                          () {
                            _currentGenderValue = value;
                          },
                        );
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                CustomButton(
                  text: locale.apply,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 130),
          child: Column(
            children: [
              AppBar(
                backgroundColor: theme.colorScheme.background,
                actions: [SizedBox.shrink()],
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
              ),
              Expanded(
                child: Container(
                  color: theme.colorScheme.background,
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: SingleChildScrollView(
                          child: Text(
                            locale.carpetShampooing!,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 25, fontWeight: FontWeight.w500),
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                      Expanded(
                        child: FadedScaleAnimation(
                          child: IconButton(
                              icon: Image.asset(
                                'assets/Handyzone/filters.png',
                                scale: 2,
                              ),

                              // color: C
                              // olors.black,
                              onPressed: () =>
                                  _scaffoldKey.currentState!.openEndDrawer()),
                          // durationInMilliseconds: 800,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
          child: ListView.builder(
            shrinkWrap: false,
            //padding: EdgeInsets.symmetric(vertical: 16),
            physics: BouncingScrollPhysics(),
            itemCount: _providersList.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: theme.colorScheme.background,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    padding: EdgeInsets.only(left: 20, bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, PageRoutes.providerProfile);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            onTap: () => Navigator.pushNamed(
                                context, PageRoutes.providerProfile,
                                arguments: index),
                            contentPadding: EdgeInsets.all(0),
                            title: Text(
                              _providersList[index].title,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text(
                              _providersList[index].subtitle!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: iconColor,
                                  fontSize: 15),
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    locale.job!,
                                    style: TextStyle(
                                      color: iconColor,
                                    ),
                                  ),
                                  Text(
                                    _providersList[index].jobs,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    locale.rat!,
                                    style: TextStyle(
                                      color: iconColor,
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: _providersList[index].rate,
                                      style: DefaultTextStyle.of(context)
                                          .style
                                          .copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '/hr',
                                            style: TextStyle(fontSize: 10)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Spacer(),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    locale.rating!,
                                    style: TextStyle(
                                      color: iconColor,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      FadedScaleAnimation(
                                        child: Icon(
                                          Icons.star,
                                          size: 14,
                                          color: Color(0xffffae22),
                                        ),
                                        // durationInMilliseconds: 800,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        _providersList[index].rating,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Spacer(
                                flex: 4,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    end: 16,
                    bottom: 12,
                    child: FadedScaleAnimation(
                      child: Image.asset(
                        _providersList[index].image,
                        scale: 2.7,
                      ),
                      // durationInMilliseconds: 800,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      beginOffset: Offset(0.3, 0.3),
      endOffset: Offset(0, 0),
      slideCurve: Curves.linearToEaseOut,
    );
  }
}
