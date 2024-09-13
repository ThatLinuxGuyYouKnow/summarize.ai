import 'package:aisummarizer/Reusbale%20Components/button.dart';
import 'package:aisummarizer/Reusbale%20Components/summarizeButton.dart';
import 'package:aisummarizer/State%20Management/summary_alert.dart';
import 'package:aisummarizer/ai_interactions/gpt_functions.dart';
import 'package:aisummarizer/summaryScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'Reusbale Components/appBar.dart';
import 'Reusbale Components/resuableTextField.dart';

class SummarizerScreen extends StatefulWidget {
  SummarizerScreen({super.key});

  @override
  State<SummarizerScreen> createState() => _SummarizerScreenState();
}

class _SummarizerScreenState extends State<SummarizerScreen> {
  final TextEditingController rawArticleLink = TextEditingController();
  String? summaryText;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double paddingWidth = screenWidth * .05;
    bool bigScreen = false;
    if (screenWidth >= 900) {
      paddingWidth = screenWidth * 0.2;
      bigScreen = true;
    }
    return Scaffold(
      appBar: ReusableAppBar('Summarize Articles'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingWidth),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.035),
              Row(
                mainAxisAlignment: bigScreen
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Paste the article link here',
                    style: GoogleFonts.ubuntu(
                        textStyle: const TextStyle(fontSize: 15)),
                  ),
                  SizedBox(width: screenWidth * 0.001),
                  const Icon(Icons.paste),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              ReusableTextField(
                borderColor: Colors.purpleAccent,
                controller: rawArticleLink,
              ),
              SizedBox(height: screenHeight * 0.05),
              Row(
                children: [
                  SummarizeButton(onTapped: () async {
                    setState(() {
                      isLoading = true;
                    });
                    String? summary =
                        await GptFunctions().summarizeArticleSequence(
                      context: context,
                      articleUrlToSummarize: rawArticleLink.text.trim(),
                    );
                    setState(() {
                      summaryText = summary;
                      isLoading = false;
                    });
                  }),
                ],
              ),
              if (isLoading) const CircularProgressIndicator(),
              Consumer<SummaryNotifier>(
                builder: (context, summaryNotifier, child) {
                  if (summaryNotifier.summaryIsAvailable) {
                    return ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SummaryScreen(
                              summaryText: summaryText!,
                            ),
                          ),
                        );
                      },
                      child: Text('View Summary'),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
