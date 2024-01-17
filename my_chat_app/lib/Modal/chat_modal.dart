class ChatModal {
  String msj, type;
  DateTime time;

  ChatModal({required this.msj, required this.time, required this.type});

  factory ChatModal.fromMap({required Map data}) => ChatModal(
    msj: data['msg'],
    time: DateTime.fromMillisecondsSinceEpoch(data['time']),
    type: data['type'],
  );

  Map<String, dynamic> get toMap => {
    'msg': msj,
    'type': type,
    'time': time.millisecondsSinceEpoch,
  };
}