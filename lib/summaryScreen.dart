import 'package:aisummarizer/Reusbale%20Components/appBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryScreen extends StatelessWidget {
  final String summaryText;
  SummaryScreen({super.key, required this.summaryText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar('Article Summary'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          summaryText,
          style: GoogleFonts.ubuntu(textStyle: const TextStyle(fontSize: 15)),
        ),
      ),
    );
  }
}
