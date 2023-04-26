import 'package:chat_ui/model/user_data.dart';
import 'package:chat_ui/model/chat_history_model.dart';

class RoomData {

  RoomData({
    this.roomId,
    this.roomName,
    this.memberList,
    this.histories,
  });

  static const String keyRoomId = "room_id";
  static const String keyRoomName = "room_name";
  static const String keyMemberList = "member_list";
  static const String keyHistories = "histories";

  final String? roomId;
  final String? roomName;
  final List<UserData>? memberList;
  final List<ChatHistoryModel>? histories;

  factory RoomData.fromJson(Map<String, dynamic> json) {
    return RoomData(
      roomId: json[keyRoomId],
      roomName: json[keyRoomName],
      memberList: _toUserDataList(json),
      histories: _toHistories(json)
    );
  }

  Map<String, dynamic> toJson() {
    // List<Map<String, dynamic>> membersJson = [];
    // memberList?.forEach((userModel) {
    //   membersJson.add(userModel.toJson());
    // });
    return {
      keyRoomId: roomId,
      keyRoomName: roomName,
      keyMemberList: getMembersJson(memberList),
      keyHistories: histories,
    };
  }

  static List<UserData>? _toUserDataList(Map<String, dynamic> json) {
    final membersJson = json[keyMemberList];
    if (membersJson == null) {
      return null;
    }

    List<UserData> userDataList = [];
    for (Map<String, dynamic> memberJson in membersJson) {
      userDataList.add(UserData.fromJson(memberJson));
    }
    return userDataList;
  }

  static List<ChatHistoryModel>? _toHistories(Map<String, dynamic> json) {
    final historiesJson = json[keyHistories];
    if (historiesJson == null) {
      return null;
    }

    List<ChatHistoryModel> histories = [];
    for (Map<String, dynamic> historyJson in historiesJson) {
      histories.add(ChatHistoryModel.fromJson(historyJson));
    }
    return histories;
  }

  static List<Map<String, dynamic>> getMembersJson(List<UserData>? memberList) {
    List<Map<String, dynamic>> membersJson = [];
    memberList?.forEach((userModel) {
      membersJson.add(userModel.toJson());
    });
    return membersJson;
  }
}