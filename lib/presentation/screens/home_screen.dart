import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,

      // ------------------- APP BAR -----------------------
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.green.shade800, size: 30),
        title: Row(
          children: [
            Text("Home",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.green.shade800)),

            const Spacer(),

            Icon(FontAwesomeIcons.whatsapp, color: Colors.green.shade700, size: 27),
            const SizedBox(width: 15),
            Icon(Icons.notifications_none,
                color: Colors.green.shade700, size: 27),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 10),

              // ------------------- WELCOME TEXT -----------------------
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Welcome to ",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    TextSpan(
                      text: "Selvanathan Chit!",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // ------------------- MAIN BANNER -----------------------
              Container(
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset("assets/homescreenimg1.png", fit: BoxFit.cover),
              ),

              const SizedBox(height: 10),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.circle, size: 8, color: Colors.green),
                    SizedBox(width: 5),
                    Icon(Icons.circle, size: 8, color: Colors.grey),
                    SizedBox(width: 5),
                    Icon(Icons.circle, size: 8, color: Colors.grey),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ------------------- VIEW CHIT GROUPS BUTTON  -----------------------
              Center(
                child: Container(
                  width: size.width * 0.65,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "View Chit Groups",
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // ------------------- CHIT SCHEME ANALYZER -----------------------
              Container(
                width: size.width,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.shade400, width: 1.8),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  children: [

                    const Text(
                      "Chit Scheme Analyzer",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Colors.green,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // INPUT ROW 1
                    Row(
                      children: [
                        Expanded(
                          child: chitInput("Investment ₹", "ex: 1,00,000"),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: chitInput("Month", "ex: 12"),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // INPUT — EMI
                    chitInput("EMI ₹", "ex: 5,000"),

                    const SizedBox(height: 12),
                    const Text(
                      "Note:\nEnter Values In Multiples Of Lakhs In Investment",
                      style: TextStyle(fontSize: 11, color: Colors.black54),
                      textAlign: TextAlign.left,
                    ),

                    const SizedBox(height: 15),

                    // ENTER BUTTON
                    Container(
                      width: size.width * 0.35,
                      height: 45,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF2ECC71), Color(0xFF27AE60)],
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "ENTER",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),

      // ------------------- BOTTOM NAVIGATION -----------------------
      bottomNavigationBar: Container(
        height: 75,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.green.shade300)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navButton(Icons.home, "Home", true),
            navButton(Icons.article_outlined, "Plans", false),
            navButton(Icons.receipt_long_rounded, "Payments", false),
            navButton(Icons.person_outline, "Profile", false),
          ],
        ),
      ),
    );
  }

  // ********** CUSTOM INPUT FIELD **********
  Widget chitInput(String title, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
        const SizedBox(height: 4),
        Container(
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.green, width: 1.4),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(hint, style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
          ),
        ),
      ],
    );
  }

  // ********** BOTTOM NAV ICON **********
  Widget navButton(IconData icon, String label, bool active) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 28, color: active ? Colors.green : Colors.grey),
        Text(label,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: active ? Colors.green : Colors.grey)),
      ],
    );
  }
}
