import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Routes/routes.dart';
import 'package:handyzone/Theme/colors.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class AfterPaymentDone extends StatefulWidget {
  @override
  _AfterPaymentDoneState createState() => _AfterPaymentDoneState();
}

class BookingStatus {
  String? title;
  String? subtitle;
  String image;

  BookingStatus(this.title, this.subtitle, this.image);
}

class _AfterPaymentDoneState extends State<AfterPaymentDone> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    List<BookingStatus> _bookingStatus = [
      BookingStatus(locale.bookingRequestSent, locale.requestedOn,
          'assets/Bookings/ic_BookingRequestsent.png'),
      BookingStatus(locale.bookingConfirmed, locale.confirmedOn,
          'assets/Bookings/ic_BookingConfirmed.png'),
      BookingStatus(locale.startAJob, locale.jobCompleted,
          'assets/Bookings/ic_Started a Job .png'),
      BookingStatus(locale.jobs, locale.amountPaid,
          'assets/Bookings/ic_Job Completed.png'),
    ];

    return Scaffold(
      backgroundColor: bookingBackgroundColor,
      appBar: AppBar(
        title: FadedScaleAnimation(
          child: Text('Booking ID 25141'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                locale.bookingStatus!,
                // textAlign: TextAlign.left,
                style: TextStyle(
                  color: iconColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Stack(
              children: [
                ListView.builder(
                  // padding: EdgeInsets.only(bottom: 200),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _bookingStatus.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          height: 100,
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xfff8f9fd),
                              index == 3
                                  ? theme.colorScheme.background
                                  : Color(0xfff8f9fd),
                              index == 3
                                  ? theme.colorScheme.background
                                  : Color(0xfff8f9fd),
                            ],
                          )),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 16),
                            leading: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                FadedScaleAnimation(
                                  child: Image.asset(
                                    'assets/Icons/tick.png',
                                    scale: 2,
                                  ),
                                ),
                              ],
                            ),
                            title: Text(
                              _bookingStatus[index].title!,
                              style: theme.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                            subtitle: index == 3
                                ? RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: _bookingStatus[index].subtitle,
                                        style: theme.textTheme.bodyLarge!
                                            .copyWith(
                                                color: iconColor, fontSize: 12),
                                      ),
                                      TextSpan(
                                        text: ' \$24.00',
                                        style: theme.textTheme.bodyLarge!
                                            .copyWith(
                                                color: theme.primaryColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                      ),
                                    ]),
                                  )
                                : Text(
                                    _bookingStatus[index].subtitle!,
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                        color: iconColor, fontSize: 12),
                                  ),
                          ),
                        ),
                        PositionedDirectional(
                          end: 16,
                          bottom: 0,
                          child: FadedScaleAnimation(
                            child: Image.asset(
                              _bookingStatus[index].image,
                              scale: 3,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                PositionedDirectional(
                    top: 76,
                    start: 3,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: FadedScaleAnimation(
                        child: Text(
                          '. . . . . .' +
                              '. . . . . .'.padLeft(22) +
                              '. . . . . .'.padLeft(22),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: iconColor),
                        ),
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 150,
            )
          ],
        ),
      ),
      bottomSheet: FadedSlideAnimation(
        child: SolidBottomSheet(
            //toggleVisibilityOnTap: true,
            draggableBody: true,
            maxHeight: 265,
            headerBar: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 70,
                    height: 5,
                    color: Color(0xfff5f6fa),
                  ),
                ),
                ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                  leading: Image.asset('assets/HomeClean/ic_carpet.png'),
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      locale.carpetShampooing!,
                      style: theme.textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Image.asset(
                        'assets/Icons/bookings.png',
                        scale: 3,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '21 June, 2020',
                        style: theme.textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      CircleAvatar(
                        radius: 2,
                        backgroundColor: iconColor,
                      ),
                      Text(
                        '  10:00 am',
                        style: theme.textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      )
                    ],
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(locale.address!,
                        style: theme.textTheme.bodyLarge!
                            .copyWith(color: iconColor)),
                    Text(
                      locale.home!,
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text('B121 - Galaxy Residency, Hemiltone Tower,' +
                        '\n' +
                        'New York, USA' +
                        '\n'),
                    Text(locale.description!,
                        style: theme.textTheme.bodyLarge!
                            .copyWith(color: iconColor)),
                    Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry.'),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.asset(
                            'assets/Handyzone/servicerequestpic1.jpg',
                            height: 60,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.asset(
                            'assets/Handyzone/servicerequestpic1.jpg',
                            height: 60,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
        beginOffset: Offset(0.3, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
      bottomNavigationBar: ListTile(
        tileColor: Theme.of(context).primaryColor,
        onTap: () {
          Navigator.pushNamed(context, PageRoutes.addReview);
        },
        title: Text(
          locale.workRatings!,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 16, color: Theme.of(context).colorScheme.background),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.star,
              size: 20,
              color: Color(0xffffba53),
            ),
            Icon(
              Icons.star,
              size: 20,
              color: Color(0xffffba53),
            ),
            Icon(
              Icons.star,
              color: Color(0xffffba53),
              size: 20,
            ),
            Icon(
              Icons.star,
              size: 20,
              color: Color(0xffffba53),
            ),
            Icon(
              Icons.star,
              size: 20,
              color: Color(0xffffba53),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: theme.colorScheme.background,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  TextButton socialButton(String icon, String text, Color color) {
    return TextButton.icon(
      icon: ImageIcon(
        AssetImage(icon),
        color: color,
        size: 13,
      ),
      onPressed: () {},
      label: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: color, fontSize: 13),
      ),
    );
  }
}
