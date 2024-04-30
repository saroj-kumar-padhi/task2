import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello/controllers/authController.dart';

class Phone extends StatelessWidget {
  const Phone({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    final Size size = MediaQuery.of(context).size;
    return Obx(() {
      return Scaffold(
        body: authController.isLoading.value == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Center(
                          child: Text(
                        "Welcome back!",
                        style: GoogleFonts.openSans(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      )),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      "Enter your mobile number, We will",
                      style: GoogleFonts.openSans(
                          fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    Text("send you OTP",
                        style: GoogleFonts.openSans(
                            fontSize: 12, fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: size.height * .05,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: authController.phoneAuthController,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Colors.grey), // Border color when focused
                          ),
                          label: Text(
                            "Mobile Number",
                            style: TextStyle(color: Colors.grey),
                          ),
                          border: OutlineInputBorder(),
                          hintText: 'Enter a search term',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    longButton(
                        color: const Color(0xffFC8019),
                        buttonText: 'Next',
                        textColor: Colors.white),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: SignUp(),
                    )
                  ],
                ),
              ),
      );
    });
  }

  Padding longButton({
    required Color color,
    required String buttonText,
    required Color textColor,
  }) {
    AuthController authController = Get.put(AuthController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            authController.phoneAuth();
          },
          style: ElevatedButton.styleFrom(
            side: const BorderSide(
              color: Color(0xffFC8019), // Border color
              width: 1, // Border width
            ),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(5.0), // Set border radius here
            ),
            backgroundColor: color, // Background color
            padding: const EdgeInsets.all(14.0), // Optional padding
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 16.0,
              color: textColor, // Text color
            ),
          ),
        ),
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Don’t have an account? ',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: 'Signup',
                style: TextStyle(color: Color(0xffFC8019)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
