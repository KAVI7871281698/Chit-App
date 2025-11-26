import 'package:flutter/material.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_colors.dart';
import '../screens/otp_screen.dart';

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({super.key});

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

              /// Back Icon
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, size: 26),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              const SizedBox(height: 5),

              /// Title
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
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// Image
              SizedBox(
                height: size.height * 0.20,
                child: Image.asset("assets/mobilelogin.png"), // Your image here
              ),

              const SizedBox(height: 10),
              const Text("Login",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),

              const SizedBox(height: 18),

              /// ============ Mobile Number Field =============
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade600, width: 1.4),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(color: Colors.grey.shade600, width: 1.4),
                        ),
                      ),
                      child: const Text(
                        "+91",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ),

                    const SizedBox(width: 8),

                    /// Mobile number input
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter mobile number",
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// SEND OTP Button
              SizedBox(
                width: size.width * 0.70,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const OtpScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.successGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "SEND OTP",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              /// ------- Divider with text (or continue with) ------
              Row(
                children: const [
                  Expanded(child: Divider(color: Colors.grey)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("or continue with", style: TextStyle(color: AppColors.textDark, fontFamily: 'bold')),
                  ),
                  Expanded(child: Divider(color: Colors.grey)),
                ],
              ),

              const SizedBox(height: 25),

              /// Continue as Guest Button
              SizedBox(
                width: size.width * 0.70,
                height: 50,
                
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.green, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "CONTINUE AS GUEST",
                    style: TextStyle(color: AppColors.successGreen, fontSize: 16),
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
