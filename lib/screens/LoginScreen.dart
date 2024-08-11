import 'package:flutter/material.dart';
import 'package:tard/screens/OTPScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    // Welcome text
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'welcome',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Title
                    const Text(
                      'TO TARD',
                      style: TextStyle(
                        color: Color(0xff6B3C8A),
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    SizedBox(height: 30),
                    // Image or Icon
                    Container(
                      height: 150,
                      child: Image.asset("assets/images/login_header.png",width: 130,height: 260,
                      fit: BoxFit.fill,), // Add your image asset here
                    ),
                    SizedBox(height: 30),
                    // Login by mobile number text
                    RichText(
                      text: TextSpan(
                        text: 'Login By ',
                        style: TextStyle(color: Color(0xff6B3C8A), fontSize: 26,fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'mobile number',
                            style: TextStyle(
                                color: Colors.orange, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    // Mobile number input field
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter Mobile Number', // 'Enter mobile number' in Arabic
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        // Country code
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 17),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text('+966'),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    // Login button
                    SizedBox(

                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OtpScreen(),
                          ));

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff6B3C8A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12,horizontal: 60),
                        ),
                        child: Text(
                          'Login', // 'Login' in Arabic
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 120),
                    // Problem logging in text
                    RichText(
                      text: TextSpan(
                        text: 'If you have a problem logging in...',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' click here',
                            style: TextStyle(
                                color: Colors.orange, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Text(
                'SAUD MADE',
                style: TextStyle(
                  color: Color(0xff6B3C8A),
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
