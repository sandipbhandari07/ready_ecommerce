import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wucommerce/colors/appcolors.dart';
import 'package:wucommerce/screens/welcomeback_screen.dart';
import 'package:wucommerce/screens/welcomeback_screen.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void navigateToNextScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomebackScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (_pageIndex != onboard_data.length - 1)
                    TextButton(
                      onPressed: () {
                        _pageController.animateToPage(
                          onboard_data.length - 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(
                            color: _getPageColor(_pageIndex),
                            fontFamily: 'RobotoMono'),
                      ),
                    ),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  itemCount: onboard_data.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnBoardContent(
                    image: onboard_data[index].image,
                    title: onboard_data[index].title,
                    description: onboard_data[index].description,
                    color: _getPageColor(index),
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    onboard_data.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                        color: _getPageColor(_pageIndex),
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_pageIndex == onboard_data.length - 1) {
                          navigateToNextScreen(context);
                        } else {
                          _pageController.nextPage(
                            curve: Curves.ease,
                            duration: const Duration(milliseconds: 300),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor:
                            _getPageColor(_pageIndex), // Button color
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/arrow.svg",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Color _getPageColor(int index) {
    switch (index) {
      case 0:
        return AppColors.page1;
      case 1:
        return AppColors.page2;
      case 2:
        return AppColors.page3;
      default:
        return Colors.black;
    }
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
    required this.color,
  }) : super(key: key);

  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboard> onboard_data = [
  Onboard(
    image: "assets/images/markets.png",
    title: "Search Products",
    description:
        "High-quality product designed to enhance your daily healthy life with ease and efficiency.",
  ),
  Onboard(
    image: "assets/images/carts.png",
    title: "Add to Cart",
    description:
        "Add to Cart for a premium product that combines quality, convenience and unbeatable performance.",
  ),
  Onboard(
    image: "assets/images/payments.png",
    title: "Secure Payment",
    description:
        "Secure your purchase with fast, reliable payment options for a seamless checkout experience.",
  ),
];

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.color,
  }) : super(key: key);

  final String image, title, description;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 250,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.w100,
              color: color,
              fontFamily: 'MontseBold'),
        ),
        SizedBox(height: 10.0), // adjust the height as needed
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(color: color, fontFamily: 'Montse'),
        ),
        const Spacer(),
      ],
    );
  }
}
