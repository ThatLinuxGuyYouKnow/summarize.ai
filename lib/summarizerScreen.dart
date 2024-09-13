import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Reusbale Components/appBar.dart';
import 'Reusbale Components/resuableTextField.dart';
import 'Reusbale Components/summarizeButton.dart';
import 'package:provider/provider.dart';
import 'State Management/summary_alert.dart';
import 'ai_interactions/gpt_functions.dart';
import 'summaryScreen.dart';

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

    // Set padding width based on screen size
    double paddingWidth;
    bool bigScreen = false;

    if (screenWidth >= 1200) {
      paddingWidth = screenWidth * 0.4; // Full desktop view
      bigScreen = true;
    } else if (screenWidth >= 900) {
      paddingWidth = screenWidth * 0.2; // Medium tablet/laptop view
      bigScreen = true;
    } else {
      paddingWidth = screenWidth * 0.05; // Mobile view
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
                      textStyle: const TextStyle(fontSize: 15),
                    ),
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
                  SummarizeButton(
                    onTapped: () async {
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
                    },
                  ),
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
                      child: const Text('View Summary'),
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
