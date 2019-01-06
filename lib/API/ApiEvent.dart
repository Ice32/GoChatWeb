class ApiEvent {
  Object data;
  String type;

  ApiEvent(this.type);

  Map<String, dynamic> toJson() => {
    'data': data,
    'type': type,
  };
}
