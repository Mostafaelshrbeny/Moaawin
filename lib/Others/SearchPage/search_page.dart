import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Routes/routes.dart';
import 'package:handyzone/Theme/colors.dart';

class SearchPageUI extends StatefulWidget {
  @override
  _SearchPageUIState createState() => _SearchPageUIState();
}

class _SearchPageUIState extends State<SearchPageUI> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Container(
      child: Scaffold(
        backgroundColor: theme.colorScheme.background,
        body: SafeArea(
          child: FadedSlideAnimation(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context)),
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          "assets/Handyzone/top.png",
                          scale: 3,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          locale.howCanWeHelpYou!,
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 65, left: 20, right: 20),
                        child: Stack(
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  filled: true,
                                  hintText: locale.searchService,
                                  fillColor: theme.colorScheme.background,
                                  prefixIcon: Icon(Icons.search)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.6,
                    decoration: BoxDecoration(
                        color: theme.colorScheme.background,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              locale.recentSearches!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  letterSpacing: .5),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          buildListTile(locale.wallPainting!),
                          buildListTile(locale.plantation!),
                          buildListTile(locale.plumbing!),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            beginOffset: Offset(0.3, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
        ),
      ),
    );
  }

  Padding buildListTile(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, PageRoutes.servicesPage);
        },
        child: Row(
          children: [
            Icon(
              Icons.youtube_searched_for_rounded,
              size: 25,
              color: iconColor,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 17, color: iconColor),
            ),
          ],
        ),
      ),
    );
  }
}
