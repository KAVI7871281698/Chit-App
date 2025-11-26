import 'package:flutter/material.dart';
import 'package:selvanathan_chit/core/constants/app_strings.dart';
import '../../core/constants/app_colors.dart';
import '../screens/home_screen.dart'; // ← ADD THIS IMPORT

class OtpSuccessScreen extends StatefulWidget {
  const OtpSuccessScreen({super.key});

  @override
  State<OtpSuccessScreen> createState() => _OtpSuccessScreenState();
}

class _OtpSuccessScreenState extends State<OtpSuccessScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeText;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(curve: Curves.elasticOut, parent: _controller),
    );

    _fadeText = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();

    /// 🔥 Auto move to Home after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            /// ✔ Animated Success Icon
            ScaleTransition(
              scale: _scaleAnimation,
              child: const Icon(
                Icons.verified_rounded,
                size: 110,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 25),

            /// ✨ Fade in text
            FadeTransition(
              opacity: _fadeText,
              child: const Text(
                AppStrings.successMessage,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
