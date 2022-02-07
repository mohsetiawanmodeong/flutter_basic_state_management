import 'package:flutter/material.dart';
import 'package:bwa_bsm/theme.dart';

void main() {
  runApp(const PaymentApps());
}

class PaymentApps extends StatefulWidget {
  const PaymentApps({Key? key}) : super(key: key);

  @override
  State<PaymentApps> createState() => _PaymentAppsState();
}

class _PaymentAppsState extends State<PaymentApps> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    Widget option(int index, String title, String subTitle, String pricing) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selectedIndex == index
                  ? const Color(0xff007DFF)
                  : const Color(0xff4D5B7C),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  selectedIndex == index
                      ? Image.asset(
                          'assets/check_two.png',
                          width: 18,
                          height: 18,
                        )
                      : Image.asset(
                          'assets/check.png',
                          width: 18,
                          height: 18,
                        ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: plantTextStyle,
                      ),
                      Text(
                        subTitle,
                        style: descTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(width: 91),
                  Text(
                    pricing,
                    style: priceTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 32, right: 32),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/icon_one.png',
                width: 267,
                height: 200,
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upgrade to',
                  style: titleTextStyle,
                ),
                const SizedBox(width: 6),
                Text(
                  'Pro',
                  style: titleProTextStyle,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Go unlock all features and \nbuild your own business bigger',
              style: subTitleTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    Widget checkoutButton() {
      return Column(
        children: [
          Container(
            width: 311,
            height: 51.23,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff007DFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(71),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Checkout Now',
                style: buttonTextStyle,
              ),
            ),
          )
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff04112F),
        body: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              SizedBox(height: 50),
              option(0, 'Monthly', 'Good for starting up', '\$20'),
              option(1, 'Quarterly', 'Focusing on building', '\$55'),
              option(2, 'Yearly', 'Steady company', '\$220'),
              SizedBox(height: 50),
              selectedIndex == -1 ? SizedBox() : checkoutButton(),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
