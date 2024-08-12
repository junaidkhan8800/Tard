import 'package:flutter/material.dart';
import 'package:tard/screens/LoginScreen.dart';

class Onboardingscreen extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);

  Onboardingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          OnboardingPage(
            title: 'You hear about speed?',
            description: 'TARD is faster..!!',
            imageAsset: 'assets/images/img.png',
          ),
          OnboardingPage(
            title: 'You hear about tracking?',
            description: 'TARD is Live..!!',
            imageAsset: 'assets/images/img_1.png',
          ),
          OnboardingPage(
            title: 'You hear about protection?',
            description: 'TARD is Hi protection..!!',
            imageAsset: 'assets/images/img_2.png',
            isLastPage: true,
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageAsset;
  final bool isLastPage;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.imageAsset,
    this.isLastPage = false,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(flex: 2),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              imageAsset,
              height: screenSize.height * 0.4,
              width: screenSize.width * 0.8,
              fit: BoxFit.contain,
            ),
          ),
          Spacer(flex: 1),
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: screenSize.width * 0.08, // Scales with screen width
              fontWeight: FontWeight.bold,
              color: Color(0xffED672A),
            ),
          ),
          SizedBox(height: screenSize.height * 0.02),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenSize.width * 0.07, // Scales with screen width
                color: Color(0xff492581),
              ),
            ),
          ),
          Spacer(flex: 2),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.02),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.05, // Scales with screen width
                  ),
                ),
              ),
            ),
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
