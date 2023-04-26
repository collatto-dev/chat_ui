class UserData {
  UserData({
    required this.userId,
    required this.userName,
  });

  static const String _keyUserId = "user_id";
  static const String _keyUserName = "user_name";

  final String? userId;
  final String? userName;

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
        userId: json[_keyUserId],
        userName: json[_keyUserName]);
  }

  Map<String, dynamic> toJson() => {
    _keyUserId : userId,
    _keyUserName : userName,
  };
}