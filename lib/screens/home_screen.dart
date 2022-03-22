import 'package:covid_dashboard/config/palette.dart';
import 'package:covid_dashboard/config/styles.dart';
import 'package:covid_dashboard/data/data.dart';
import 'package:covid_dashboard/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String _country = 'SL';
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(screenHeight),
          _buildPreventionTips(screenHeight),
          _buildYourOwnTest(screenHeight),
        ],
      ),
    );
  }
  SliverToBoxAdapter _buildHeader(double screenHeight){
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  <Widget>[
                const Text(
                  'COVID-19',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                CountryDropdown(
                  countries: const ['SL', 'IN', 'FR', 'IT', 'UK', 'USA'],
                  country: _country,
                  onChanged: (val) => setState(() => _country = val!),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Are you feeling sick?',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22.0,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                const Text(
                  'If you feel sick with any COVID-19 symptoms, please call or text us immediately for help.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 25.0,
                        ),
                        backgroundColor: Colors.red,
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.phone, color: Colors.white,),
                      label: const Text(
                        'Call Now',
                        style: Styles.buttonTextStyle,
                      ),
                    ),
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        backgroundColor: Colors.blue,
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.chat_bubble, color: Colors.white,),
                      label: const Text(
                        'Send SMS',
                        style: Styles.buttonTextStyle,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

SliverToBoxAdapter _buildPreventionTips (double screenHeight){
  return SliverToBoxAdapter(
    child: Container(
      padding: const EdgeInsets.all(20.0),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  <Widget>[
           const Text(
            'Prevention Tips',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height:20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: prevenstions.map((e) => Column(
              children: <Widget>[
                Image.asset(e.keys.first, height: screenHeight * 0.12),
                SizedBox(height: screenHeight * 0.015),
                Text(
                  e.values.first,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
           ).toList()
          ),
        ],
      ),
    ),
  );
}

SliverToBoxAdapter _buildYourOwnTest (double screenHeight){
  return SliverToBoxAdapter(
    child: Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      padding: const EdgeInsets.all(10.0),
      height: screenHeight * 0.15,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFAD9FE4), Palette.primaryColor],
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset('assets/images/own_test.png'),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              const Text(
                'Do your own test!',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              const Text(
                'Follow the instructions\nto do your own test.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
