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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 150),
          // Image.asset(imageAsset, height: 170,width: 175,), // Replace with your images
          Align(
              alignment: Alignment.center,
              child: Image.asset(
                imageAsset,
                height: 300,
                width: 300,
              )),
          // Replace with your images
          SizedBox(height: 30),
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xffED672A),
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35, color: Color(0xff492581)),
            ),
          ),
          SizedBox(height: 120),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
                },
                child: Text('Skip'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
