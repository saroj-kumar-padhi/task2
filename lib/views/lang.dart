import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/lagModel.dart';

class Lag extends StatelessWidget {
  const Lag({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    List<Language> laguageTile = [
      Language(text: "Bangla", color: const Color(0xff46E3E3)),
      Language(text: "English", color: const Color(0xffF2C94C)),
      Language(text: "Gujarati", color: const Color(0xffB73451)),
      Language(text: "Hindi", color: const Color(0xff7B61FF)),
      Language(text: "Kannada", color: const Color(0xffFC8019)),
      Language(text: "Marathi", color: const Color(0xff008B00)),
      Language(text: "Malayalam", color: const Color(0xff7B61FF)),
      Language(text: "Punjabi", color: const Color(0xff2196F3)),
      Language(text: "Tamil", color: const Color(0xffB73451)),
      Language(text: "Telugu", color: const Color(0xff263238)),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Choose your app Language",
                    style: GoogleFonts.openSans(
                        fontSize: 17, fontWeight: FontWeight.w600),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 2,
                color: Colors.white,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: Color(0xffC4C4C4),
                      ),
                      onPressed: () {},
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Color(0xFFC4C4C4)),
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3.5 / 2,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      height: size.height * 0.1,
                      width: size.width * 0.2,
                      decoration: BoxDecoration(
                        color: laguageTile[index].color,
                        borderRadius:
                            BorderRadius.circular(10), // Set border radius here
                      ),
                      margin: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(laguageTile[index].text),
                      ),
                    );
                  },
                  itemCount: 10,
                ),
              ),
            ),
            longButton(
              buttonText: "Next",
              color: const Color(0xffFC8019),
              textColor: Colors.white,
            )
          ],
        ),
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
          onPressed: () {},
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
