import 'package:flutter/material.dart';
import 'package:tard/screens/TripDetailsScreen.dart';

class UpcomingTripsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.people, color: Colors.orange),
            Icon(Icons.arrow_forward, color: Colors.orange),
            Icon(Icons.local_shipping, color: Colors.orange),
            Icon(Icons.arrow_forward, color: Colors.orange),
            Icon(Icons.car_rental, color: Colors.purple),
            Icon(Icons.arrow_forward, color: Colors.orange),
            Icon(Icons.description, color: Colors.orange),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "Upcoming available Trips",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "JEDDAH",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.purple,
                        ),
                      ),
                      Row(
                        children: List.generate(
                          6,
                              (index) => Icon(
                            Icons.circle,
                            size: 8,
                            color: Colors.orangeAccent,
                          ),
                        ),
                      ),
                      Icon(Icons.flight_takeoff, color: Colors.purple),
                      Row(
                        children: List.generate(
                          6,
                              (index) => Icon(
                            Icons.circle,
                            size: 8,
                            color: Colors.orangeAccent,
                          ),
                        ),
                      ),
                      Text(
                        "Riyadh",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Container(
                    width: 80,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: index == 0 ? Colors.orange : Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ["Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"][index],
                          style: TextStyle(
                            color: index == 0 ? Colors.white : Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          (16 - index).toString(),
                          style: TextStyle(
                            color: index == 0 ? Colors.white : Colors.purple,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for the shipment',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        'filter',
                        style: TextStyle(color: Colors.orange),
                      ),
                      Icon(Icons.filter_list, color: Colors.orange),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        'Show all',
                        style: TextStyle(color: Colors.orange),
                      ),
                      Icon(Icons.arrow_forward, color: Colors.orange),
                    ],
                  ),
                ),
              ],
            ),
            // Use Expanded or Flexible to avoid overflow issues
            Expanded(
              child: TripListPage(),
            ),
          ],
        ),
      ),
    );
  }
}

class TripListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,  // Number of trips
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => TripDetailsScreen(),
            ));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '3837390',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Number of trip',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Duration',
                            style: TextStyle(color: Colors.orange),
                          ),
                          SizedBox(width: 4),
                          Text(
                            '10',
                            style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.directions_car, color: Colors.purple),
                          SizedBox(width: 8),
                          Text(
                            'remaining',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(width: 4),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '1:45:03',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),

                  // Route Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '0.2 km',
                            style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Near you',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: List.generate(
                              6,
                                  (index) => Icon(
                                Icons.circle,
                                size: 8,
                                color: Colors.orangeAccent,
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text('07 Dec 2024'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '08:10am',
                            style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(
                                'start',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.flight_takeoff, color: Colors.purple),
                              SizedBox(width: 8),
                              Text(
                                '5:40pm',
                                style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Text('Arrive'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),

                  // Footer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '26 SAR',
                        style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 16),
                      Radio(
                        value: 1,
                        groupValue: index,
                        onChanged: (value) {},
                        activeColor: Colors.orange,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}



