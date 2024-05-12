import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Routes/routes.dart';
import 'package:handyzone/Theme/colors.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class StartAJob extends StatefulWidget {
  @override
  _StartAJobState createState() => _StartAJobState();
}

class BookingStatus {
  String? title;
  String? subtitle;
  String image;

  BookingStatus(this.title, this.subtitle, this.image);
}

class _StartAJobState extends State<StartAJob> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    List<BookingStatus> _bookingStatus = [
      BookingStatus(locale.bookingRequestSent, locale.requestedOn,
          'assets/Bookings/ic_BookingRequestsent.png'),
      BookingStatus(locale.bookingConfirmed, locale.confirmedOn,
          'assets/Bookings/ic_BookingConfirmed.png'),
      BookingStatus(locale.startAJob, locale.startedSince,
          'assets/Bookings/ic_Started a Job .png'),
      BookingStatus(locale.jobs, locale.paymentInfoWillAppearHere,
          'assets/Bookings/ic_Job Completednill.png'),
    ];
    return Scaffold(
      backgroundColor: bookingBackgroundColor,
      appBar: AppBar(
        title: FadedScaleAnimation(
          child: Text('Booking ID 25141'),
          // durationInMilliseconds: 600,
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
                              index == 2 ? Colors.white : Color(0xfff8f9fd),
                              index == 2 ? Colors.white : Color(0xfff8f9fd),
                            ],
                          )),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 16),
                            leading: index == 3
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      FadedScaleAnimation(
                                        child: Image.asset(
                                          'assets/Icons/tick_done.png',
                                          scale: 2,
                                        ),
                                        // durationInMilliseconds: 600,
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      FadedScaleAnimation(
                                        child: Image.asset(
                                          'assets/Icons/tick.png',
                                          scale: 2,
                                        ),
                                        // durationInMilliseconds: 600,
                                      ),
                                    ],
                                  ),
                            title: Text(
                              _bookingStatus[index].title!,
                              style: theme.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                            subtitle: Text(
                              _bookingStatus[index].subtitle!,
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(color: iconColor, fontSize: 12),
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
                            // durationInMilliseconds: 600,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                PositionedDirectional(
                    top: 70,
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
                        // durationInMilliseconds: 600,
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
            //   toggleVisibilityOnTap: true,
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
                      'Home',
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
          Navigator.pushNamed(context, PageRoutes.jobCompleted);
        },
        title: Text(
          locale.amountToPay!,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 16, color: Theme.of(context).colorScheme.background),
        ),
        trailing: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: '\$12.00',
                style: theme.textTheme.titleSmall!.copyWith(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.background),
              ),
              TextSpan(
                text: '/hr',
                style: theme.textTheme.bodyLarge!
                    .copyWith(color: theme.colorScheme.background),
              ),
            ],
          ),
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
