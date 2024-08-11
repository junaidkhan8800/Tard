import 'package:flutter/material.dart';
import 'package:tard/screens/RoleSelectionScreen.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Background color of the screen
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top Text
                // Text(
                //   'Login',
                //   style: TextStyle(
                //     fontSize: 20,
                //     color: Colors.black,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                SizedBox(height: 20),
                // Icon
                Container(
                  height: 149,
                  width: 149,
                  child: Icon(
                    Icons.mark_email_read,
                    color: Color(0xff6B3C8A),
                    size: 80,
                  ),
                ),
                SizedBox(height: 20),
                // Activation Code Text
                Text(
                  'Activation Code',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6B3C8A),
                  ),
                ),
                SizedBox(height: 60),
                // Instruction Text
                Text(
                  'Please enter the verification code sent to your phone',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(height: 20),
                // OTP Input Fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildOtpBox('5'),
                    _buildOtpBox('8'),
                    _buildOtpBox('6'),
                    _buildOtpBox('8'),
                  ],
                ),
                SizedBox(height: 50),
                // Resend Code Text
                Text(
                  'Resend verification code',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff6B3C8A),
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(height: 40),
                // Verification Button
                SizedBox(

                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RoleSelectionScreen(),
                      ));

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 50),
                    ),
                    child: Text(
                      'verification',
                      style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOtpBox(String digit) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        digit,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
