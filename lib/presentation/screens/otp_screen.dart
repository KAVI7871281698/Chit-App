import 'package:flutter/material.dart';
import 'package:selvanathan_chit/presentation/screens/success_screen.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_colors.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
              const SizedBox(height: 15),

              /// ⬅ Back Button
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, size: 26),
                ),
              ),

              const SizedBox(height: 8),

              /// 🟢 Title
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppStrings.welcome,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                        color: Colors.green.shade800,
                      ),
                    ),
                    TextSpan(
                      text: AppStrings.companyName,
                      style: const TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.w700,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: size.height * 0.03),

              /// 📄 Image
              SizedBox(
                height: size.height * 0.12,
                child: Image.asset("assets/otp.png"),
              ),

              const SizedBox(height: 20),

              /// OTP Title
              const Text(
                AppStrings.otpTitle,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 10),

              /// Message Description
              const Text(
                AppStrings.otpMessage,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 30),

              Container(
                padding: EdgeInsets.only(bottom: 10),
                margin: EdgeInsets.only(right: 180),
                child: Text(
                  AppStrings.enterotp,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),

              /// 🔢 Enter OTP Boxes (6 Boxes)
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ), // overall row spacing
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    6,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                      ), // space between each box
                      child: Container(
                        width: 36,
                        height: 43,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.successGreen,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text("", style: TextStyle(fontSize: 22)),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              /// 🔁 Timer + Resend Row
              Padding(
                padding: const EdgeInsets.only(left: 28), // 👈 Only top padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.resendOtp,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.successGreen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      "30 Sec",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.successGreen,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 35),

              /// VERIFY Button
              Padding(padding: const EdgeInsets.only(top: 40)),
              SizedBox(
                width: size.width * 0.70,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const OtpSuccessScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.successGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "VERIFY",
                    style: TextStyle(
                      fontSize: 18,
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
    );
  }
}
