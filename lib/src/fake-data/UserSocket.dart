class UserSocket {
  int id;
  bool isParent;

  UserSocket({this.id, this.isParent});

  factory UserSocket.fromJson(Map<String, dynamic> json) {
    return UserSocket(
      id: json["id"] as int,
      isParent: json["parent"] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'parent': isParent,
      };
}
