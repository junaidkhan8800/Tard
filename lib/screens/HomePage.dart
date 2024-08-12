import 'package:flutter/material.dart';
import 'package:tard/screens/PickupPointScreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double paddingValue = screenSize.width * 0.04;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Good evening Abdullah',
          style: TextStyle(
            color: Color(0xff6B3C8A),
            fontSize: screenSize.width * 0.05,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Color(0xff6B3C8A)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(paddingValue),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LocationInfo(screenSize: screenSize),
                ],
              ),
            ),
            StatusCards(screenSize: screenSize),
            Padding(
              padding: EdgeInsets.all(paddingValue),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for the shipment',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(paddingValue),
                child: Text(
                  'How we serve you',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ServiceIcon(
                  icon: Icons.local_shipping,
                  label: 'Send shipment',
                  screenSize: screenSize,
                ),
                ServiceIcon(
                  icon: Icons.unarchive,
                  label: 'Receive shipment',
                  screenSize: screenSize,
                ),
                ServiceIcon(
                  icon: Icons.replay,
                  label: 'Return shipment',
                  screenSize: screenSize,
                ),
              ],
            ),
            BalanceCard(screenSize: screenSize),
            Container(
              height: screenSize.height * 0.18,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3, // Number of locations
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {},
                  child: const CashbackPromoCard(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LocationInfo extends StatelessWidget {
  final Size screenSize;

  const LocationInfo({super.key, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: Padding(
            padding: EdgeInsets.all(screenSize.width * 0.015),
            child: Text(
              'Jeddah, Al-Falah Muhammad',
              style: TextStyle(
                fontSize: screenSize.width * 0.03,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: EdgeInsets.all(screenSize.width * 0.015),
            child: Text(
              '2500',
              style: TextStyle(
                fontSize: screenSize.width * 0.03,
                fontWeight: FontWeight.bold,
                color: Color(0xff6B3C8A),
              ),
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: EdgeInsets.all(screenSize.width * 0.015),
            child: Text(
              '130 R.s',
              style: TextStyle(
                fontSize: screenSize.width * 0.03,
                fontWeight: FontWeight.bold,
                color: Color(0xff6B3C8A),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class StatusCards extends StatelessWidget {
  final Size screenSize;

  const StatusCards({super.key, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatusCard('5', 'Under process', Colors.yellow[100]!, screenSize),
        _buildStatusCard('3', 'On way', Colors.lightBlue[100]!, screenSize),
        _buildStatusCard('20', 'Complete', Colors.lightGreen[100]!, screenSize),
        _buildStatusCard('2', 'Canceled', Colors.red[100]!, screenSize),
      ],
    );
  }

  Widget _buildStatusCard(String number, String label, Color color, Size screenSize) {
    return Container(
      width: screenSize.width * 0.18,
      height: screenSize.height * 0.12,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: screenSize.width * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenSize.width * 0.03,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final Size screenSize;

  const ServiceIcon({
    Key? key,
    required this.icon,
    required this.label,
    required this.screenSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const PickupPointScreen(),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(screenSize.width * 0.04),
            decoration: BoxDecoration(
              color: Color(0xff6B3C8A),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              size: screenSize.width * 0.1,
              color: Colors.white,
            ),
          ),
          SizedBox(height: screenSize.height * 0.01),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: screenSize.width * 0.035,
            ),
          ),
        ],
      ),
    );
  }
}

class BalanceCard extends StatelessWidget {
  final Size screenSize;

  const BalanceCard({super.key, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(screenSize.width * 0.04),
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.width * 0.05,
        vertical: screenSize.height * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My balance',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenSize.width * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.01),
                Text(
                  '250 SAR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenSize.width * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Card(
            color: Color(0xff6B3C8A),
            child: Padding(
              padding: EdgeInsets.all(screenSize.width * 0.04),
              child: Icon(Icons.wallet_giftcard, color: Colors.white),
            ),
          ),
          SizedBox(width: screenSize.width * 0.02),
          Card(
            color: Color(0xff6B3C8A),
            child: Padding(
              padding: EdgeInsets.all(screenSize.width * 0.04),
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class CashbackPromoCard extends StatelessWidget {
  const CashbackPromoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.all(screenSize.width * 0.02),
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.width * 0.05,
        vertical: screenSize.height * 0.02,
      ),
      decoration: BoxDecoration(
        color: Color(0xff6B3C8A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cashback Promo',
            style: TextStyle(
              color: Colors.white,
              fontSize: screenSize.width * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Up to 70%',
            style: TextStyle(
              color: Colors.orange,
              fontSize: screenSize.width * 0.05,
            ),
          ),
        ],
      ),
    );
  }
}
