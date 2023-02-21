import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_project_stt/chat_bubble.dart';
import 'package:flutter_project_stt/send_request_https.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speech_to_text/speech_to_text.dart';

void main() {
  runApp(const speechtext());
}

class speechtext extends StatefulWidget {
  const speechtext({Key? key}) : super(key: key);

  @override
  State<speechtext> createState() => _speechtextState();
}

class _speechtextState extends State<speechtext> {
  SpeechToText sst = new SpeechToText();
  final List<chat_bubble> messages = [];
  var text = '';
  var islistening = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          leading: SvgPicture.asset('icons/icons8-adobe-illustrator.svg'),
          backgroundColor: Colors.blueGrey[900],
          centerTitle: true,
          title: const Text(
            'CHAT GPT :)',
            style: TextStyle(
              fontFamily: 'AbrilFatface',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        floatingActionButton: AvatarGlow(
          endRadius: 70.5,
          glowColor: Colors.orange.shade500,
          animate: islistening,
          repeat: true,
          duration: const Duration(milliseconds: 2000),
          repeatPauseDuration: const Duration(milliseconds: 100),
          showTwoGlows: true,
          child: GestureDetector(
            onTapDown: (details) async {
              if (!islistening) {
                var available = await sst.initialize();
                if (available) {
                  setState(() {
                    islistening = true;
                    sst.listen(onResult: (result) {
                      text = result.recognizedWords;
                    });
                  });
                }
              }
            },
            onTapUp: (details) async {
              setState(() {
                islistening = false;
              });
              sst.stop();
              if (text != '') {
                messages.add(chat_bubble(text: text, type: chat_owner.human));
                var msg = await send_request.sendrequest(text);
                msg = msg.trim();
                text = '';
                setState(() {
                  messages.add(chat_bubble(text: msg, type: chat_owner.bot));
                });
              }
            },
            child: CircleAvatar(
              backgroundColor: Colors.orange.shade500,
              radius: 35,
              child: Icon(
                islistening ? Icons.mic : Icons.mic_none,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blueGrey[900],
                    borderRadius: BorderRadius.circular(12)),
                height: 650,
                width: double.maxFinite,
                margin: const EdgeInsets.fromLTRB(15, 15, 15, 3),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    var pointer = messages[index];
                    return bubble(chat_text: pointer.text, type: pointer.type);
                  },
                ),
              ),
            ),
            const Text(
              'Developed by Abdul Hamid',
              style: TextStyle(
                  color: Colors.blueGrey, fontFamily: 'Cookie', fontSize: 17),
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              'OpenAI',
              style: TextStyle(
                color: Colors.blueGrey,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bubble({required String? chat_text, required chat_owner? type}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: CircleAvatar(
            backgroundColor: Colors.orange,
            radius: 25,
            child: type == chat_owner.bot
                ? SvgPicture.asset(
                    'icons/robot.svg',
                  )
                : SvgPicture.asset('icons/avatar.svg'),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: Text(
              ' $chat_text',
              style: const TextStyle(
                fontFamily: 'AbrilFatface',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
