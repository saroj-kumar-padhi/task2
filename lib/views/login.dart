import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello/views/phone.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.4,
            decoration: const BoxDecoration(
              color: Color(0xffFFF5EC),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
            ),
            child: Center(
              child: Image.asset("assest/logo.png"), // Corrected asset path
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          longButton(
              color: const Color(0xffFC8019),
              buttonText: 'Login',
              textColor: const Color(0xffFFFFFF)),
          longButton(
              color: const Color(0xffFFFFFF),
              buttonText: 'Signup',
              textColor: const Color(0xffFC8019)),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text("By Continue, you are agreeing to the"),
                ),
                TermsAndPolicyText()
              ],
            ),
          )
          // Terms of Services & Privacy Policy
        ],
      ),
    );
  }

  Padding longButton(
      {required Color color,
      required String buttonText,
      required Color textColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Get.to(const Phone());
          },
          style: ElevatedButton.styleFrom(
            side: const BorderSide(
              color: Color(0xffFC8019),
              width: 1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            backgroundColor: color,
            padding: const EdgeInsets.all(16.0),
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 18.0,
              color: textColor, // Text color
            ),
          ),
        ),
      ),
    );
  }
}

class TermsAndPolicyText extends StatelessWidget {
  const TermsAndPolicyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Terms of Services',
                style: TextStyle(
                  color: Color(0xffFC8019),
                ),
              ),
              TextSpan(text: ' & ', style: TextStyle(color: Colors.black)),
              TextSpan(
                text: 'Privacy Policy',
                style: TextStyle(color: Color(0xffFC8019)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
