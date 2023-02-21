enum chat_owner { bot, human }

// ignore: camel_case_types
class chat_bubble {
  String? text;
  chat_owner? type;
  chat_bubble({required this.text, required this.type}) {
    text = text;
    type = type;
  }
}
