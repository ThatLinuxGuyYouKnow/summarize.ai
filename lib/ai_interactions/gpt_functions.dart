import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aisummarizer/State%20Mnagement/summary_alert.dart';

class GptFunctions {
  Future<String?> summarizeArticleSequence({
    required String articleUrlToSummarize,
    required BuildContext context,
  }) async {
    print('summarization started');
    final url = Uri.https('chatgpt-42.p.rapidapi.com', '/gpt4');
    final headers = {
      'x-rapidapi-key': dotenv.env['RAPIDAPI_KEY']!,
      'x-rapidapi-host': 'chatgpt-42.p.rapidapi.com',
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      'messages': [
        {
          'role': 'user',
          'content':
              'Do not provide any unrequested text like `Ok`. Please give *only* a 5-7 bullet point summary of the content of the article in the following url: $articleUrlToSummarize',
        },
      ],
      'web_access': true,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        print('code 200');

        print(response.body);
        Provider.of<SummaryNotifier>(context, listen: false)
            .alertSummaryIsAvailable();
        return jsonDecode(response.body)['result'];
      } else {
        Provider.of<SummaryNotifier>(context, listen: false)
            .alertSummaryIsAvailable();

        print(response.body);
        print('Request failed with status: ${response.statusCode}');
        return 'Failed to summarize the article. Please try again later.';
      }
    } catch (e) {
      Provider.of<SummaryNotifier>(context, listen: false)
          .alertSummaryIsAvailable();
      print('code 200');
      print(SummaryNotifier().summaryIsAvailable);

      print('An error occurred: $e');
      return 'An error occurred while summarizing the article. Please try again later.';
    }
  }
}
