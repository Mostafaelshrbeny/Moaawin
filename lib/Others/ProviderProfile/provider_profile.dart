import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:handyzone/Components/custom_button.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Routes/routes.dart';

class ProviderProfile extends StatefulWidget {
  @override
  _ProviderProfileState createState() => _ProviderProfileState();
}

class _ProviderProfileState extends State<ProviderProfile> {
  List<String> portfolioImages = [
    'assets/portfolio/Layer 674.png',
    'assets/portfolio/Layer 674-1.png',
    'assets/portfolio/Layer 675.png',
    'assets/portfolio/Layer 2397.png',
    'assets/portfolio/Layer 2397-1.png',
    'assets/portfolio/Layer 2397-2.png',
    'assets/portfolio/Layer 2397-3.png',
  ];

  @override
  Widget build(BuildContext context) {
    int? index = ModalRoute.of(context)!.settings.arguments as int?;
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          FadedScaleAnimation(
            child: Image.asset(
              'assets/Handyzone/headerprofilebg.png',
              height: 280,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            // durationInMilliseconds: 600,
          ),
          PositionedDirectional(
            top: 68,
            width: MediaQuery.of(context).size.width,
            child: Hero(
              tag: 'provider$index',
              child: Image.asset(
                'assets/Handyzone/provider_profile.png',
                height: 212,
              ),
            ),
          ),
          ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 100),
            children: [
              SizedBox(height: 240),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Emili Anderson',
                      style: theme.textTheme.titleLarge,
                    ),
                    Text(
                      locale.cleaner! + '\n',
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: theme.hintColor),
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adiscingeliy,sed do eluismod' +
                          '\n',
                      style: theme.textTheme.bodyMedium!.copyWith(height: 1.5),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, PageRoutes.providerReview);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                locale.job!,
                                style: theme.textTheme.bodyLarge!
                                    .copyWith(color: theme.hintColor),
                              ),
                              Text(
                                '187',
                                style: theme.textTheme.titleMedium,
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                locale.rat!,
                                style: theme.textTheme.bodyLarge!
                                    .copyWith(color: theme.hintColor),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '\$12',
                                      style: theme.textTheme.titleMedium,
                                    ),
                                    TextSpan(
                                      text: '/hr',
                                      style: theme.textTheme.bodyLarge!
                                          .copyWith(color: theme.hintColor),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                locale.rating!,
                                style: theme.textTheme.bodyLarge!
                                    .copyWith(color: theme.hintColor),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Color(0xffffae22),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' 4.5',
                                          style: theme.textTheme.titleMedium,
                                        ),
                                        TextSpan(
                                          text: '(187)',
                                          style: theme.textTheme.bodyLarge!
                                              .copyWith(color: theme.hintColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.keyboard_arrow_down),
                            color: theme.hintColor,
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsetsDirectional.only(start: 20, top: 20),
                height: 180,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      locale.workPortfolio!,
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: theme.hintColor),
                    ),
                    SizedBox(height: 16),
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
                                  itemCount: portfolioImages.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          EdgeInsetsDirectional.only(end: 8),
                                      child:
                                          Image.asset(portfolioImages[index]),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 100,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: portfolioImages.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsetsDirectional.only(end: 8),
                              child: FadedScaleAnimation(
                                child: Image.asset(portfolioImages[index]),
                                // durationInMilliseconds: 600,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 24,
            height: 56,
            width: MediaQuery.of(context).size.width,
            child: CustomButton(
              text: locale.hireRequest,
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.confirmInformation);
              },
            ),
          ),
        ],
      ),
    );
  }
}
