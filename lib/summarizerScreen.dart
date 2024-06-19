import 'package:aisummarizer/Reusbale%20Components/button.dart';
import 'package:aisummarizer/State%20Mnagement/summary_alert.dart';
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

    return Scaffold(
      appBar: ReusableAppBar('Summarize Articles'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * .05),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.035),
              Row(
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
                height: screenHeight * 0.3,
                controller: rawArticleLink,
              ),
              SizedBox(height: screenHeight * 0.35),
              ReusableButton(
                label: 'Summarize',
                onPressed: () async {
                  print('button clicked!!!');
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
