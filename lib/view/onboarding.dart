import 'package:flutter/material.dart';
import 'package:petshop/view/component.dart';
import 'package:petshop/view/login.dart';
import 'package:petshop/view/onboarding_items.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OndboardingState();
}

class _OndboardingState extends State<Onboarding> {
  final controller = OnboardingItems();
  final pageController = PageController();
  bool isLastPage = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: isLastPage? getStarted() : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Skip Button
            TextButton(
                onPressed: () =>
                    pageController.jumpToPage(controller.items.length - 1),
                child: Text("Skip")),

            // Indicator
            SmoothPageIndicator(
              controller: pageController,
              count: controller.items.length,
              onDotClicked: (index) => pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeIn),
              effect: WormEffect(
                  dotHeight: 12, dotWidth: 12, activeDotColor: primaryColor),
            ),

            // Next Button
            TextButton(
                onPressed: () => pageController.nextPage(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeIn),
                child: Text("Next")),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: PageView.builder(
          onPageChanged: (index)=> setState(()=> isLastPage = index == controller.items.length - 1),
          itemCount: controller.items.length,
          controller: pageController,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.items[index].title,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                ),
                // const SizedBox(height: 15),
                Image.asset(controller.items[index].image),
                const SizedBox(height: 34.3),
                Text(
                  controller.items[index].descriptions,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // Get Strated Button
  Widget getStarted() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: primaryColor,
      ),
      width: MediaQuery.of(context).size.width * .9,
      height: 55,
      child: TextButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
          },
          child: Text(
            "Get Started",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
