import 'package:flutter/material.dart';

class TripDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Fetch the width and height of the screen
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Top progress indicator
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.people, color: Colors.orange, size: screenWidth * 0.07),
                    Icon(Icons.arrow_forward, color: Colors.orange, size: screenWidth * 0.07),
                    Icon(Icons.local_shipping, color: Colors.orange, size: screenWidth * 0.07),
                    Icon(Icons.arrow_forward, color: Colors.orange, size: screenWidth * 0.07),
                    Icon(Icons.receipt, color: Colors.purple, size: screenWidth * 0.07),
                  ],
                ),
              ),
              LinearProgressIndicator(
                value: 0.5, // Adjust the progress value as needed
                backgroundColor: Colors.orange[100],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
              ),
              SizedBox(height: screenHeight * 0.02),

              // Shipping details
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.02),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(screenWidth * 0.02),
                        color: Colors.orange,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'delivery',
                            style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'alfalah',
                              style: TextStyle(color: Colors.purple, fontSize: screenWidth * 0.05),
                            ),
                            Icon(Icons.directions_car, color: Colors.purple, size: screenWidth * 0.07),
                            Text(
                              'alsanabil',
                              style: TextStyle(color: Colors.purple, fontSize: screenWidth * 0.05),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              MapUI(),
              PaymentDetailsUI(),
            ],
          ),
        ),
      ),
    );
  }
}

class MapUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        // Order number and tabs
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01, horizontal: screenWidth * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sender",
                  style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                Text(
                  "65856236",
                  style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                Text(
                  "Recipient",
                  style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.02),

        // Sender and recipient details
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Sender Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/sender.png'), // Replace with your image
                            radius: screenWidth * 0.08,
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            "Abdullah alshehri",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple, fontSize: screenWidth * 0.04),
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Text("0570833411", style: TextStyle(fontSize: screenWidth * 0.035)),
                          SizedBox(height: screenHeight * 0.005),
                          Text("waleed@gmail.com", style: TextStyle(fontSize: screenWidth * 0.035)),
                          SizedBox(height: screenHeight * 0.005),
                          Row(
                            children: [
                              Icon(Icons.location_pin, color: Colors.red, size: screenWidth * 0.04),
                              SizedBox(width: screenWidth * 0.01),
                              Expanded(child: Text("جدة,الفلاح,2345,23762 شارع محمد بن زيد", style: TextStyle(fontSize: screenWidth * 0.035))),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Text("07 Dec 2024     12:00 AM", style: TextStyle(fontSize: screenWidth * 0.035)),
                        ],
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.04),
                    // Car and route
                    Column(
                      children: [
                        Icon(Icons.directions_car, color: Colors.purple, size: screenWidth * 0.1),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          "-------------",
                          style: TextStyle(color: Colors.orange, fontSize: screenWidth * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(width: screenWidth * 0.04),
                    // Recipient Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/recipient.png'), // Replace with your image
                            radius: screenWidth * 0.08,
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            "Nasser Al Maqati",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple, fontSize: screenWidth * 0.04),
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Text("0570833411", style: TextStyle(fontSize: screenWidth * 0.035)),
                          SizedBox(height: screenHeight * 0.005),
                          Text("waleed@gmail.com", style: TextStyle(fontSize: screenWidth * 0.035)),
                          SizedBox(height: screenHeight * 0.005),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.location_pin, color: Colors.red, size: screenWidth * 0.04),
                              SizedBox(width: screenWidth * 0.01),
                              Expanded(child: Text("جدة,الفلاح,2345,23762 شارع محمد بن زيد", style: TextStyle(fontSize: screenWidth * 0.035))),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Text("07 Dec 2024     12:00 PM", style: TextStyle(fontSize: screenWidth * 0.035)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                // Map placeholder
                Container(
                  height: screenHeight * 0.25,
                  color: Colors.grey[300], // Replace with your map widget
                  child: Center(
                    child: Text("Map Placeholder", style: TextStyle(fontSize: screenWidth * 0.05)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PaymentDetailsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Shipment type, weight, breakage protection, protect from heat
        Container(
          padding: EdgeInsets.all(screenWidth * 0.04),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shipment type",
                    style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                  ),
                  Text(
                    "weight",
                    style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                  ),
                  Text(
                    "Breakage protection",
                    style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                  ),
                  Text(
                    "Protect from heat",
                    style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("طرد", style: TextStyle(color: Colors.purple, fontSize: screenWidth * 0.05)),
                  Text("5 kg", style: TextStyle(color: Colors.purple, fontSize: screenWidth * 0.05)),
                  Text("YES", style: TextStyle(color: Colors.purple, fontSize: screenWidth * 0.05)),
                  Text("NO", style: TextStyle(color: Colors.purple, fontSize: screenWidth * 0.05)),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Shipment details",
                style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                "A box containing an iPhone, perfume, and clothes.",
                style: TextStyle(color: Colors.black, fontSize: screenWidth * 0.04),
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.02),

        // Service charges
        Container(
          padding: EdgeInsets.all(screenWidth * 0.04),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Service charges:",
                style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tax :", style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.04)),
                  Text("7.5 SAR", style: TextStyle(color: Colors.purple, fontSize: screenWidth * 0.04)),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Regulatory fees:", style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.04)),
                  Text("0.50 SAR", style: TextStyle(color: Colors.purple, fontSize: screenWidth * 0.04)),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Discount %", style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.04)),
                  Text("0 SAR", style: TextStyle(color: Colors.purple, fontSize: screenWidth * 0.04)),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: TextStyle(color: Colors.orange, fontSize: screenWidth * 0.05)),
                  Text("50 SAR", style: TextStyle(color: Colors.orange, fontSize: screenWidth * 0.05)),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.02),

        // Payment method
        Container(
          padding: EdgeInsets.all(screenWidth * 0.04),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange, width: 2.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Radio(
                value: 1,
                groupValue: 1,
                onChanged: (value) {},
                activeColor: Colors.orange,
              ),
              SizedBox(width: screenWidth * 0.02),
              Text("VISA", style: TextStyle(color: Colors.purple, fontSize: screenWidth * 0.05)),
              SizedBox(width: screenWidth * 0.04),
              Text(
                "**** **** **** 1919",
                style: TextStyle(color: Colors.black, fontSize: screenWidth * 0.05),
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.02),

        // Other payment method
        Center(
          child: Text(
            "Use other payment method",
            style: TextStyle(color: Colors.purple, fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
