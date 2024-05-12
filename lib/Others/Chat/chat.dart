import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Routes/routes.dart';
import 'package:handyzone/Theme/colors.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class Providers {
  String title;
  String? subtitle;
  String time;
  String image;
  Providers(this.title, this.subtitle, this.time, this.image);
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    List<Providers> _providersList = [
      Providers(
        'Emili Anderson',
        locale.noWorriesMamIWillDoIt,
        '20 min',
        'assets/Providers/Emili.png',
      ),
      Providers(
        'Alisha Patel',
        locale.noWorriesMamIWillDoIt,
        '20 min',
        'assets/Providers/Alisha.png',
      ),
      Providers(
        'Linda Haydon',
        locale.noWorriesMamIWillDoIt,
        '20 min',
        'assets/Providers/Linda.png',
      ),
      Providers(
        'Peter Johnson',
        locale.noWorriesMamIWillDoIt,
        '20 min',
        'assets/Providers/Peter.png',
      ),
      Providers(
        'Emili Anderson',
        locale.noWorriesMamIWillDoIt,
        '20 min',
        'assets/Providers/Emili.png',
      ),
      Providers(
        'Alisha Patel',
        locale.noWorriesMamIWillDoIt,
        '20 min',
        'assets/Providers/Alisha.png',
      ),
      Providers(
        'Linda Haydon',
        locale.noWorriesMamIWillDoIt,
        '20 min',
        'assets/Providers/Linda.png',
      ),
      Providers(
        'Peter Johnson',
        locale.noWorriesMamIWillDoIt,
        '20 min',
        'assets/Providers/Peter.png',
      ),
    ];
    return DefaultTabController(
      length: 2,
      child: FadedSlideAnimation(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              locale.chats!,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            backgroundColor: theme.colorScheme.background,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: Colors.black,
                  indicatorColor: theme.primaryColor,
                  labelColor: theme.primaryColor,
                  tabs: [
                    Tab(
                      text: locale.liveChat,
                    ),
                    Tab(text: locale.archive),
                  ],
                ),
              ),
            ),
          ),
          backgroundColor: theme.scaffoldBackgroundColor,
          body: TabBarView(
            children: [
              LiveChat(theme: theme, providersList: _providersList),
              LiveChat(theme: theme, providersList: _providersList),
              // FlutterLogo(),
              // FlutterLogo(),
            ],
          ),
        ),
        beginOffset: Offset(0.3, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}

class LiveChat extends StatelessWidget {
  const LiveChat({
    Key? key,
    required this.theme,
    required List<Providers> providersList,
  })  : _providersList = providersList,
        super(key: key);

  final ThemeData theme;
  final List<Providers> _providersList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
      child: ListView.builder(
        padding: EdgeInsets.all(8),
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
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                padding: EdgeInsets.only(left: 20, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, PageRoutes.chatConversation);
                      },
                      child: ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text(
                          _providersList[index].title,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              _providersList[index].subtitle!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: iconColor,
                                  fontSize: 12),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              _providersList[index].time,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: iconColor,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        //  trailing: Text(_providersList[index].time),
                      ),
                    ),
                  ],
                ),
              ),
              PositionedDirectional(
                end: 16,
                bottom: 12,
                child: FadedScaleAnimation(
                  child: Image.asset(
                    _providersList[index].image,
                    scale: 4.2,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
