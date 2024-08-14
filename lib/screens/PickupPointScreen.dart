import 'package:flutter/material.dart';
import 'package:tard/screens/UpcomingTripsScreen.dart';

class PickupPointScreen extends StatelessWidget {
  const PickupPointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Pickup Point')),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/img_4.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
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
              Center(
                child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => LocationPickerBottomSheet(),
                      isScrollControlled: true,
                    );
                  },
                  child: Text('Pick Location',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => ShippingInfoBottomSheet(),
                      isScrollControlled: true,
                    );
                  },
                  child: Text('Shipping Information',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShippingInfoBottomSheet extends StatefulWidget {
  @override
  _ShippingInfoBottomSheetState createState() =>
      _ShippingInfoBottomSheetState();
}

class _ShippingInfoBottomSheetState extends State<ShippingInfoBottomSheet> {
  int selectedSize = 1; // 0 = Small, 1 = Medium, 2 = Large
  int weight = 1;
  bool isFragile = true;
  bool affectedByHeat = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: DraggableScrollableSheet(
        expand: false,
        builder: (_, controller) => Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            controller: controller,
            children: [
              Text(
                'Shipping Information',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6B3C8A)),
              ),
              SizedBox(height: 20),
              // Shipment Type
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<String>(
                        value: 'طرد',
                        isExpanded: true,
                        underline: SizedBox(),
                        items: <String>['طرد', 'مستندات', 'هدية']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, textAlign: TextAlign.center),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {},
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  // Weight Picker
                  Row(
                    children: [
                      Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: IconButton(
                                onPressed: () {
                                  if (weight > 1) {
                                    setState(() {
                                      weight--;
                                    });
                                  }
                                },
                                icon: Icon(
                                  Icons.remove,
                                )),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('$weight kg',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: Icon(
                                  Icons.add,
                                )),
                          )),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Size Options
              Text(
                "Size",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSizeOption('صغير', '20cm x 20cm', 0),
                  _buildSizeOption('وسط', '50cm x 50cm', 1),
                  _buildSizeOption('كبير', '80cm x 80cm', 2),
                ],
              ),
              SizedBox(height: 20),
              // Details and Image

              Text(
                "Details",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'اكتب تفاصيل الشحنة',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.image, color: Colors.grey),
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.add, color: Colors.orange),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              // Fragile and Heat Affected
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildToggleOption('Fragile shipment', isFragile, (value) {
                    setState(() {
                      isFragile = value;
                    });
                  }),
                  _buildToggleOption('Affected by heat', affectedByHeat,
                      (value) {
                    setState(() {
                      affectedByHeat = value;
                    });
                  }),
                ],
              ),
              SizedBox(height: 20),
              // Price and Continue Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Approx price\n28 SAR',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UpcomingTripsScreen(),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff6B3C8A),
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: Text('Continue',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSizeOption(String label, String dimensions, int index) {
    bool isSelected = selectedSize == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = index;
        });
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              border:
                  Border.all(color: isSelected ? Colors.orange : Colors.grey),
              borderRadius: BorderRadius.circular(8),
              color: isSelected ? Colors.orange.shade50 : Colors.white,
            ),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/img.png",
                  width: 30,
                  height: 30,
                ),
                Text(label,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.orange : Colors.grey)),
                SizedBox(height: 4),
                Text(dimensions, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleOption(
      String label, bool value, Function(bool) onChanged) {
    return Row(
      children: [
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.orange,
        ),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}

class LocationPickerBottomSheet extends StatelessWidget {
  const LocationPickerBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      builder: (_, controller) => Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          controller: controller,
          children: [
            Text('My favorite location',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.grey)),
            Row(
              children: [
                Card(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Text('Home',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.grey)),
                )),
                Card(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Text('Work',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.grey)),
                )),
                Card(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Text('Etc',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.grey)),
                )),
              ],
            ),
            SizedBox(height: 20),
            Text('Nearest TARD points',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.grey)),
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3, // Number of locations
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const ShowPopUp();
                      },
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/logo.png",
                              height: 14,
                              width: 14,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text('MKJ-A-53',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.grey)),
                            SizedBox(
                              width: 8,
                            ),
                            Text('2.2 km',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff6B3C8A), width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Sender\'s location',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Recipient\'s location',
                  prefixIcon: Icon(Icons.location_on),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: Text('Confirm Location',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShowPopUp extends StatelessWidget {
  const ShowPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 14,
                  width: 14,
                ),
                SizedBox(width: 8),
                Text(
                  'MK-J-A-53',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xff6B3C8A)),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 10),
            _buildTimeRow('Sunday', '24 h'),
            Divider(),
            _buildTimeRow('Monday', '24 h'),
            Divider(),
            _buildTimeRow('Tuesday', '24 h'),
            Divider(),
            _buildTimeRow('Wednesday', '24 h'),
            Divider(),
            _buildTimeRow('Thursday', '24 h'),
            Divider(),
            _buildTimeRow('Friday', 'From 2:30PM to 11:30PM'),
            Divider(),
            _buildTimeRow('Saturday', 'From 2:30PM to 11:30PM'),
            SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: Text(
                    'Select',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeRow(String day, String time) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final paddingVertical = screenWidth * 0.01; // Adjust padding based on screen width
        final fontSize = screenWidth * 0.06; // Adjust font size based on screen width

        return Padding(
          padding: EdgeInsets.symmetric(vertical: paddingVertical),
          child: Row(
            children: [
              Text(
                day,
                style: TextStyle(fontSize: fontSize),
              ),
              Spacer(),
              Text(
                time,
                style: TextStyle(fontSize: fontSize),
              ),
            ],
          ),
        );
      },
    );
  }

}

