import 'package:flutter/material.dart';
import 'package:tard/screens/HomePage.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double paddingValue = screenSize.width * 0.04;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(paddingValue),
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
                      fontSize: screenSize.width * 0.06,
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.01),
                // User's name
                Text(
                  'Abdullah alshehri', // Replace with dynamic name if needed
                  style: TextStyle(
                    color: Color(0xff6B3C8A),
                    fontSize: screenSize.width * 0.07,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.1),
                // Log in as text
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Log in as',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: screenSize.width * 0.06,
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.02),
                // Role buttons
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: screenSize.height * 0.02,
                    crossAxisSpacing: screenSize.width * 0.04,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        child: _buildRoleCard(
                          'customer',
                          Icons.person,
                          Colors.purple,
                          Colors.white,
                          screenSize,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        child: _buildRoleCard(
                          'Delivery',
                          Icons.local_shipping,
                          Colors.purple,
                          Colors.white,
                          screenSize,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        child: _buildRoleCard(
                          'store',
                          Icons.store,
                          Colors.purple,
                          Colors.white,
                          screenSize,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        child: _buildRoleCard(
                          'warehouse',
                          Icons.warehouse,
                          Colors.purple,
                          Colors.white,
                          screenSize,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenSize.height * 0.02),
                // Help text
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Help...?',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: screenSize.width * 0.065,
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.02),
                // Footer text
                Text(
                  'SAUD MADE',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: screenSize.width * 0.045,
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
      Color borderColor, Size screenSize) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(screenSize.width * 0.03),
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
          Icon(
            icon,
            size: screenSize.width * 0.15,
            color: iconColor,
          ),
          SizedBox(height: screenSize.height * 0.015),
          Text(
            role,
            style: TextStyle(
              color: iconColor,
              fontWeight: FontWeight.bold,
              fontSize: screenSize.width * 0.06,
            ),
          ),
        ],
      ),
    );
  }
}
