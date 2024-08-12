import 'package:flutter/material.dart';
import 'package:tard/screens/RoleSelectionScreen.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[900], // Background color of the screen
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(screenSize.width * 0.04),
          child: Container(
            padding: EdgeInsets.all(screenSize.width * 0.06),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(screenSize.width * 0.05),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenSize.height * 0.02),
                // Icon
                Container(
                  height: screenSize.height * 0.18,
                  width: screenSize.width * 0.35,
                  child: Icon(
                    Icons.mark_email_read,
                    color: Color(0xff6B3C8A),
                    size: screenSize.width * 0.2,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.03),
                // Activation Code Text
                Text(
                  'Activation Code',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.065,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6B3C8A),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.07),
                // Instruction Text
                Text(
                  'Please enter the verification code sent to your phone',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenSize.width * 0.04,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.03),
                // OTP Input Fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildOtpBox('5', screenSize),
                    _buildOtpBox('8', screenSize),
                    _buildOtpBox('6', screenSize),
                    _buildOtpBox('8', screenSize),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.06),
                // Resend Code Text
                Text(
                  'Resend verification code',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.035,
                    color: Color(0xff6B3C8A),
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.05),
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
                        borderRadius: BorderRadius.circular(screenSize.width * 0.03),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: screenSize.height * 0.02,
                        horizontal: screenSize.width * 0.2,
                      ),
                    ),
                    child: Text(
                      'verification',
                      style: TextStyle(
                        fontSize: screenSize.width * 0.045,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
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

  Widget _buildOtpBox(String digit, Size screenSize) {
    return Container(
      width: screenSize.width * 0.12,
      height: screenSize.height * 0.07,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(screenSize.width * 0.03),
      ),
      child: Text(
        digit,
        style: TextStyle(
          fontSize: screenSize.width * 0.06,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
