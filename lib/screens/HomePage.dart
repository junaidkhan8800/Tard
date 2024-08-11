import 'package:flutter/material.dart';
import 'package:tard/screens/PickupPointScreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Good evening Abdullah', style: TextStyle(color: Color(0xff6B3C8A))),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Color(0xff6B3C8A)),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LocationInfo(),
              ],
            ),
          ),
          Divider(),
          StatusCards(),


          Padding(
            padding: const EdgeInsets.all(16.0),
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
              padding: const EdgeInsets.all(16.0),
              child: Text('How we serve you', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ServiceIcon(
                icon: Icons.local_shipping,
                label: 'Send shipment',
              ),
              ServiceIcon(
                icon: Icons.unarchive,
                label: 'Receive shipment',
              ),
              ServiceIcon(
                icon: Icons.replay,
                label: 'Return shipment',
              ),
            ],
          ),


          BalanceCard(),


          Container(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3, // Number of locations
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                },
                child: const CashbackPromoCard(),
              ),
            ),
          ),




        ],



      ),
    );
  }
}

class LocationInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text('Jeddah, Al-Falah Muhammad', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        )),
        Card(child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text('2500', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xff6B3C8A))),
        )),
        Card(child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text('130 R.s', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xff6B3C8A))),
        )),
      ],
    );
  }
}


class StatusCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatusCard('5', 'Under process', Colors.yellow[100]!),
        _buildStatusCard('3', 'On way', Colors.lightBlue[100]!),
        _buildStatusCard('20', 'Complete', Colors.lightGreen[100]!),
        _buildStatusCard('2', 'Canceled', Colors.red[100]!),
      ],
    );
  }


  Widget _buildStatusCard(String number, String label, Color color) {
    return Container(
      width: 70,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(number, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text(label, textAlign: TextAlign.center,style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.grey)),
        ],
      ),
    );
  }
}


class ServiceIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const ServiceIcon({Key? key, required this.icon, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const PickupPointScreen(),
        ));
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xff6B3C8A),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 40, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(label, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}


class BalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                Text('My balance', style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text('250 SAR', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          
          Card(color: Color(0xff6B3C8A),child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.wallet_giftcard, color: Colors.white),
          )),
          SizedBox(width: 8),
          Card(color: Color(0xff6B3C8A),child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.add, color: Colors.white),
          )),

        ],
      ),
    );
  }
}

class CashbackPromoCard extends StatelessWidget {
  const CashbackPromoCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Color(0xff6B3C8A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Cashback Promo', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          Text('Up to 70%', style: TextStyle(color: Colors.orange, fontSize: 20)),
        ],
      ),
    );
  }
}