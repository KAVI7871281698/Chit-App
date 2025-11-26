import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../screens/login_form_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const SizedBox(height: 35),

              /// ---------------- TITLE ----------------
              Column(
                children: [
                  Text(
                    AppStrings.welcome,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: Colors.green.shade800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppStrings.companyName,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              /// ---------------- IMAGE ----------------
              SizedBox(
                height: size.height * 0.42,
                child: Image.asset(
                  "assets/loginscreen.png",
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 45),

              /// ---------------- LOGIN BUTTON ----------------
              SizedBox(
                width: size.width * 0.70,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to Login Form Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginFormScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 15),
              const Text("(or)", style: TextStyle(color: Colors.black54, fontSize: 15)),
              const SizedBox(height: 15),

              /// ---------------- ENQUIRY BUTTON ----------------
              SizedBox(
                width: size.width * 0.70,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.green, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Enquiry",
                    style: TextStyle(color: Colors.green, fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
