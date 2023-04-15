class RoomData {

  RoomData({
    this.roomName,
    this.memberList,
    this.myName,
  });

  static const String _keyRoomName = "room_name";
  static const String _keyMemberList = "member_list";
  static const String _keyMyName = "my_name";

  final String? roomName;
  final List<String>? memberList;
  final String? myName;

  factory RoomData.fromJson(Map<String, dynamic> json) {
    return RoomData(
      roomName: json[_keyRoomName],
      memberList: json[_keyMemberList],
      myName: json[_keyMyName],
    );
  }

  Map<String, dynamic> toJson() => {
    _keyRoomName: roomName,
    _keyMemberList: memberList,
    _keyMyName: myName,
  };
}