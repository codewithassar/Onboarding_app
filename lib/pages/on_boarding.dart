import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/image1.png',
      'title': 'Trade anytime anywhere',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
    },
    {
      'image': 'assets/image3.png',
      'title': 'Save and invest at the same time',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
    },
    {
      'image': 'assets/image2.png',
      'title': 'Transact fast and easy',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
    },
  ];

  void _nextPage() {
    if (currentIndex < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2E4A47), Color(0xFF1B232A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: onboardingData.length,
                    onPageChanged: (index) {
                      setState(() => currentIndex = index);
                    },
                    itemBuilder: (context, index) {
                      return Hero(
                        tag: onboardingData[index]['image']!,
                        child: Image.asset(
                          onboardingData[index]['image']!,
                          height: 369,
                          width: 331.72,
                        ),
                      );
                    },
                  ),
                ),
                Column(
                  children: [
                    Text(
                      onboardingData[currentIndex]['title']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        onboardingData[currentIndex]['description']!,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onboardingData.length,
                        (index) => _buildDot(isActive: index == currentIndex),
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: _nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF58D68D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 80,
                          vertical: 16,
                        ),
                      ),
                      child: Text(
                        currentIndex == onboardingData.length - 1
                            ? 'Finish'
                            : 'Next',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDot({required bool isActive}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10,
      width: isActive ? 20 : 10,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
