import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello/controllers/authController.dart';
import 'package:hello/views/phone.dart';
import 'package:pinput/pinput.dart';

class OTP extends StatelessWidget {
  final String verficationCode;

  const OTP({super.key, required this.verficationCode});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    final Size size = MediaQuery.of(context).size;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: const Color(0xffE4E4E4)),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.03,
          ),
          Center(
            child: Text(
              "Enter verification code",
              style: GoogleFonts.openSans(
                  fontSize: 27, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            "We send verification code",
            style:
                GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          Text(
            "to +91 ${authController.phoneAuthController.text}",
            style:
                GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Pinput(
              controller: authController.otpController,
              length: 6,
              defaultPinTheme: defaultPinTheme,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Align(alignment: Alignment.centerLeft, child: OTPText()),
          ),
          longButton(
              color: const Color(0xffFC8019),
              buttonText: 'Login',
              textColor: Colors.white,
              verficationCode: verficationCode),
          const Spacer(),
          const Padding(padding: EdgeInsets.only(bottom: 35), child: SignUp())
        ],
      ),
    );
  }

  Padding longButton(
      {required Color color,
      required String buttonText,
      required Color textColor,
      required String verficationCode}) {
    final AuthController authController = Get.put(AuthController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            authController.verifyPhoneNumber(verficationCode: verficationCode);
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

class OTPText extends StatelessWidget {
  const OTPText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Didn’t you get OTP? ',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              TextSpan(text: ' & ', style: TextStyle(color: Colors.black)),
              TextSpan(
                text: ' Resend OTP',
                style: TextStyle(color: Color(0xffFC8019)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
