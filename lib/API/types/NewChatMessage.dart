class NewChatMessage {
  String text;
  String channelId;
  String username;
  NewChatMessage(this.text, this.channelId, this.username);

  Map<String, dynamic> toJson() => {
    'text': text,
    'channelId': channelId,
    'username': username,
  };
}
