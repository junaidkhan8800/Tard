import 'package:flutter/material.dart';
import 'package:tard/screens/HomePage.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  BuildContext? get context => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Welcome text
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'welcome',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                // User's name
                Text(
                  'Abdullah alshehri', // Replace with dynamic name if needed
                  style: TextStyle(
                    color: Color(0xff6B3C8A),
                    fontSize: 28,
                  ),
                ),
                SizedBox(height: 100),
                // Log in as text
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Log in as',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Role buttons
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [

                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ));
                      },
                      child: _buildRoleCard(
                          'customer', Icons.person, Colors.purple,
                          Colors.white),
                    ),


                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                      },
                      child: _buildRoleCard(
                          'Delivery', Icons.local_shipping, Colors.purple,
                          Colors.white),
                    ),


                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ));
                        },
                        child: _buildRoleCard(
                            'store', Icons.store, Colors.purple, Colors.white),
                    ),


                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ));
                        },
                        child: _buildRoleCard('warehouse', Icons.warehouse, Colors.purple,
                            Colors.white),
                    )




                  ],
                ),
                SizedBox(height: 20),
                // Help text
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Help...?',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 26,
                    ),
                  ),
                ),
                Spacer(),
                // Footer text
                Text(
                  'SAUD MADE',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard(String role, IconData icon, Color iconColor,
      Color borderColor) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 55, color: iconColor),
          SizedBox(height: 10),
          Text(
            role,
            style: TextStyle(
              color: iconColor,
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
        ],
      ),
    );
  }
}
