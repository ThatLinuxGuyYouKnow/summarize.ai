import 'package:aisummarizer/Reusbale%20Components/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Reusbale Components/appBar.dart';
import 'Reusbale Components/resuableTextField.dart';

class SummarizerScreen extends StatelessWidget {
  SummarizerScreen({super.key});
  final TextEditingController rawArticleLink = TextEditingController();
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: ReusableAppBar('Summarize Articles'),
      extendBodyBehindAppBar: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * .05),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.035,
              ),
              Row(
                children: [
                  Text(
                    'Paste the article link here',
                    style: GoogleFonts.ubuntu(
                        textStyle: const TextStyle(fontSize: 15)),
                  ),
                  SizedBox(
                    width: screenWidth * 0.001,
                  ),
                  const Icon(Icons.paste)
                ],
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              ReusableTextField(
                borderColor: Colors.purpleAccent,
                height: screenHeight * 0.3,
                controller: rawArticleLink,
              ),
              SizedBox(height: screenHeight * 0.35),
              ReusableButton(label: 'Summarize')
            ],
          ),
        ),
      ),
    );
  }
}
