import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Theme/colors.dart';

class Transaction {
  String? title;
  String subtitle;
  String amount;
  String date;
  Color color;

  Transaction(this.title, this.subtitle, this.amount, this.date, this.color);
}

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<Transaction> _transactions = [
      Transaction(locale.carpetCleaning, 'Emili Anderson', '\$24.00',
          '21 Jun, 11:02 a.m.', Colors.red),
      Transaction(locale.addedToWallet, 'Bank of USA', '\$200.00',
          '20 Jun, 11:02 a.m.', Colors.green),
      Transaction(locale.laptopRepair, 'Emili Anderson', '\$24.00',
          '21 Jun, 11:02 a.m.', Colors.red),
      Transaction(locale.homeSanitize, 'Emili Anderson', '\$24.00',
          '21 Jun, 11:02 a.m.', Colors.red),
      Transaction(locale.sentToBank, 'Emili Anderson', '\$24.00',
          '21 Jun, 11:02 a.m.', Colors.red),
      Transaction(locale.bodyMassage, 'Emili Anderson', '\$24.00',
          '21 Jun, 11:02 a.m.', Colors.red),
      Transaction(locale.addedToWallet, 'BAnk to USA', '\$200.00',
          '20 Jun, 11:02 a.m.', Colors.green),
      Transaction(locale.laptopRepair, 'Emili Anderson', '\$24.00',
          '21 Jun, 11:02 a.m.', Colors.red),
      Transaction(locale.homeSanitize, 'Emili Anderson', '\$24.00',
          '21 Jun, 11:02 a.m.', Colors.red),
      Transaction(locale.sentToBank, 'Emili Anderson', '\$24.00',
          '21 Jun, 11:02 a.m.', Colors.red),
      Transaction(locale.bodyMassage, 'Emili Anderson', '\$24.00',
          '21 Jun, 11:02 a.m.', Colors.red),
    ];
    return Scaffold(
      appBar: AppBar(),
      body: FadedSlideAnimation(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$159.50',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 24,
                            letterSpacing: 0.11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          locale.availableBalance!,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              fontSize: 15,
                              color: iconColor),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: FadedScaleAnimation(
                      child: Image.asset(
                        "assets/Handyzone/vct_verification.png",
                      ),
                      // durationInMilliseconds: 800,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    //margin: EdgeInsets.only(top: 184),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              socialButton('assets/Icons/down_arrow.png',
                                  "  " + locale.addMoney!),
                              Container(
                                width: 1,
                                height: 25,
                                color: Theme.of(context).colorScheme.background,
                              ),
                              socialButton('assets/Icons/up_arrow.png',
                                  "  " + locale.sentToBank!)
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: 4),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ListView.builder(
                                itemCount: _transactions.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                      _transactions[index].title!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    subtitle: Text(
                                      _transactions[index].subtitle,
                                      style: TextStyle(fontSize: 12, height: 2),
                                    ),
                                    trailing: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 2, top: 4),
                                          child: Text(
                                            _transactions[index].amount,
                                            style: TextStyle(
                                              color: _transactions[index].color,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          _transactions[index].date,
                                          style: TextStyle(
                                              fontSize: 12, color: iconColor),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        beginOffset: Offset(0.3, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }

  TextButton socialButton(String icon, String text) {
    return TextButton.icon(
      icon: ImageIcon(
        AssetImage(icon),
        color: Theme.of(context).colorScheme.background,
        size: 20,
      ),
      onPressed: () {},
      label: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Theme.of(context).colorScheme.background),
      ),
    );
  }
}
