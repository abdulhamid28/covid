import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_stt/speech_text.dart';

void main() {
  runApp(speech_2_text());
  SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent);
}

class speech_2_text extends StatelessWidget {
  const speech_2_text({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: speechtext(),
      debugShowCheckedModeBanner: false,
      title: 'SPEECH TO TEXT',
    );
  }
}
