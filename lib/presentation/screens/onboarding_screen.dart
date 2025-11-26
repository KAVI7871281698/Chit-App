import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_strings.dart';
import '../screens/login_screen.dart';
import '../screens/mobile_login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  final PageController _controller = PageController();

  /// ---------------- SLIDE DATA (ALL 3 PAGES) ----------------
  final List<Map<String, String>> data = [
    {
      "image": "assets/onbording.png",
      "title": AppStrings.title1,
      "subtitle": AppStrings.subtitle1,
    },
    {
      "image": "assets/onbording2.png",
      "title": AppStrings.title2,
      "subtitle": AppStrings.subtitle2,
    },
    {
      "image": "assets/onbording3.png",
      "title": AppStrings.title3,
      "subtitle": AppStrings.subtitle3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.defaultPadding * 2),
          child: Column(
            children: [
              /// =================== TOP LEFT / RIGHT BUTTONS ===================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Back button only on Page 2 & 3
                  currentIndex > 0
                      ? IconButton(
                          icon: const Icon(Icons.arrow_back, size: 28),
                          onPressed: () {
                            _controller.previousPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeOut,
                            );
                          },
                        )
                      : const SizedBox(width: 40), // Same spacing as icon

                  /// SKIP button only on Page 1
                  currentIndex == 0
                      ? TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const MobileLoginScreen())); // ⏩ Skip to last page
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.successGreen,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 22,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                50,
                              ), // capsule button
                            ),
                          ),

                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                "SKIP",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 6),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 18,
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(width: 40),
                ],
              ),

              /// =================== PAGE VIEW ===================
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: data.length,
                  onPageChanged: (index) =>
                      setState(() => currentIndex = index),
                  itemBuilder: (_, i) {
                    return Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.38,
                          child: Image.asset(
                            data[i]["image"]!,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 20),

                        Text(
                          "\"${data[i]["title"]!}\"",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        const SizedBox(height: 12),

                        SizedBox(
                          width: size.width * 0.90,
                          child: Text(
                            data[i]["subtitle"]!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height: 12),

              /// =================== DOT INDICATOR ===================
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  data.length,
                  (index) => buildDot(index),
                ),
              ),

              const SizedBox(height: 22),

              /// =================== NEXT / DONE BUTTON ===================
              SizedBox(
                width: size.width * 0.60,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (currentIndex < 2) {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeOut,
                      );
                    } else {
                      // / 👉 When last screen completed — Navigate to Login/Home
                       Navigator.push(context,
                       MaterialPageRoute(builder: (_) => MobileLoginScreen()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.successGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    currentIndex == 2 ? "DONE" : "NEXT",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  /// Dot UI Builder
  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      margin: const EdgeInsets.only(right: 6),
      width: currentIndex == index ? 22 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: currentIndex == index ? Colors.green : Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
