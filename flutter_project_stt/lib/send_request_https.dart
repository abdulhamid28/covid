import 'dart:convert';

import 'package:http/http.dart' as http;

String key = "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";

class send_request {
  // ignore: non_constant_identifier_names
  static String base_url = "https://api.openai.com/v1/completions";
  // static Map<String, String> header = ;
  static Future sendrequest(String? message) async {
    var response = await http.post(Uri.parse(base_url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $key "
        },
        body: jsonEncode({
          "model": "text-davinci-003",
          "prompt": "$message",
          "temperature": 0,
          "max_tokens": 100,
          "top_p": 1,
          "frequency_penalty": 0.0,
          "presence_penalty": 0.0,
          "stop": ["Human", "AI"]
        }));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      var msg = data['choices'][0]['text'];
      return msg;
    }
  }
}
