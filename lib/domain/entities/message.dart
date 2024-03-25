enum FromWho { me, hers}

class Message{
  final String text;
  final String? imagerURL;
  final FromWho  fromWho;

  Message ({
    required this.text,
    this.imagerURL,
    required this.fromWho
  });
}
