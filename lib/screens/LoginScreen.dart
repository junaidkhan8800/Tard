import 'package:flutter/material.dart';
import 'package:tard/screens/OTPScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.05,
            vertical: screenSize.height * 0.02,
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    // Welcome text
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: screenSize.width * 0.06, // Adaptive font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.01),
                    // Title
                    Text(
                      'TO TARD',
                      style: TextStyle(
                        color: Color(0xff6B3C8A),
                        fontWeight: FontWeight.bold,
                        fontSize: screenSize.width * 0.09, // Adaptive font size
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    // Image or Icon
                    Container(
                      height: screenSize.height * 0.2,
                      child: Image.asset(
                        "assets/images/login_header.png",
                        width: screenSize.width * 0.35,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    // Login by mobile number text
                    RichText(
                      text: TextSpan(
                        text: 'Login By ',
                        style: TextStyle(
                          color: Color(0xff6B3C8A),
                          fontSize: screenSize.width * 0.065, // Adaptive font size
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'mobile number',
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    // Mobile number input field
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter Mobile Number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: screenSize.width * 0.02),
                        // Country code
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.045,
                            vertical: screenSize.height * 0.022,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text('+966'),
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    // Login button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const OtpScreen(),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff6B3C8A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: screenSize.height * 0.015,
                            horizontal: screenSize.width * 0.2,
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: screenSize.width * 0.04,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.15),
                    // Problem logging in text
                    RichText(
                      text: TextSpan(
                        text: 'If you have a problem logging in...',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenSize.width * 0.035,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' click here',
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                  ],
                ),
              ),
              Center(
                child: Text(
                  'SAUD MADE',
                  style: TextStyle(
                    color: Color(0xff6B3C8A),
                    fontSize: screenSize.width * 0.055,
                    fontWeight: FontWeight.bold,
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
