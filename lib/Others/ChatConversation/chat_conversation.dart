import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Routes/routes.dart';
import 'package:handyzone/Theme/colors.dart';

class ChatConversation extends StatefulWidget {
  @override
  _ChatConversationState createState() => _ChatConversationState();
}

class _ChatConversationState extends State<ChatConversation> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return FadedSlideAnimation(
      child: Scaffold(
        backgroundColor: theme.colorScheme.background,
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.providerProfile);
              },
              child: Stack(
                children: [
                  Image.asset(
                    'assets/Handyzone/headerbg.png',
                    height: 150,
                    width: MediaQuery.of(context).size.width * 1.4,
                    fit: BoxFit.fill,
                  ),
                  Positioned.directional(
                    textDirection: Directionality.of(context),
                    start: 12,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 30),
                      child: Text(
                        'Emili Anderson',
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
                    start: 12,
                    top: 38,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 30),
                      child: Text(
                        locale.cleaner!,
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
                    end: 72,
                    bottom: 0,
                    child: FadedScaleAnimation(
                      child: Image.asset(
                        'assets/Providers/Emili.png',
                        scale: 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: MessageStream(),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                // mainAxisSize: MainAxisSize.min,

                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 12, right: 12, top: 15, bottom: 15),
                          isDense: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(26),
                          ),
                          filled: true,
                          hintText: locale.writeYourMessage,
                          fillColor: Color(0xfff8f9fd),
                          suffixIcon: Icon(
                            Icons.attachment_outlined,
                            size: 21,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: theme.primaryColor,
                    child: Image.asset(
                      'assets/Icons/send.png',
                      alignment: Alignment.center,
                      scale: 2,
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
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<MessageBubble> messageBubbles = [
      MessageBubble(
        sender: 'delivery_partner',
        text: locale.helloMam! + '\n' + locale.howCanIHelpYou!,
        time: '11:58 am',
        isDelivered: false,
        isMe: false,
      ),
      MessageBubble(
        sender: 'user',
        text: locale.iWantToCleanMyCarpet! + '\n' + locale.canYouWashIt!,
        time: '11:59 am',
        isDelivered: false,
        isMe: true,
      ),
      MessageBubble(
        sender: 'delivery_partner',
        text: locale.sureMam! + '\n' + locale.noWorriesMamIWillDoIt!,
        time: '11:59 am',
        isDelivered: false,
        isMe: false,
      ),
      MessageBubble(
        sender: 'user',
        text: locale.iWantToCleanMyCarpet! + '\n' + locale.canYouWashIt!,
        time: '11:59 am',
        isDelivered: false,
        isMe: true,
      ),
      MessageBubble(
        sender: 'delivery_partner',
        text: locale.sureMam! + '\n' + locale.noWorriesMamIWillDoIt!,
        time: '11:59 am',
        isDelivered: false,
        isMe: false,
      ),
      MessageBubble(
        sender: 'user',
        text: locale.iWantToCleanMyCarpet! + '\n' + locale.canYouWashIt!,
        time: '11:59 am',
        isDelivered: false,
        isMe: true,
      ),
      MessageBubble(
        sender: 'delivery_partner',
        text: locale.sureMam! + '\n' + locale.noWorriesMamIWillDoIt!,
        time: '11:59 am',
        isDelivered: false,
        isMe: false,
      ),
    ];
    return ListView(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      children: messageBubbles,
    );
  }
}

class MessageBubble extends StatelessWidget {
  final bool? isMe;
  final String? text;
  final String? sender;
  final String? time;
  final bool? isDelivered;

  MessageBubble(
      {this.sender, this.text, this.time, this.isMe, this.isDelivered});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:
            isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            elevation: 4.0,
            color: isMe! ? Color(0xfff8f9fd) : Color(0xffebf3f9),
            borderRadius: BorderRadius.circular(6.0),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              child: Column(
                crossAxisAlignment:
                    isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    text!,
                    style: isMe!
                        ? Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w500)
                        : Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        time!,
                        style: TextStyle(
                          fontSize: 10.0,
                          color: iconColor,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      isMe!
                          ? Icon(
                              Icons.check_circle,
                              color:
                                  isDelivered! ? Colors.blue : Colors.grey[300],
                              size: 12.0,
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
