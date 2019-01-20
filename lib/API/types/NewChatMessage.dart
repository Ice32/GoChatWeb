class NewChatMessage {
  String text;
  String channelId;
  NewChatMessage(this.text, this.channelId);

  Map<String, dynamic> toJson() => {
    'text': text,
    'channelId': channelId,
  };
}
