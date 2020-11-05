import 'package:kid_management/src/fake-data/UserSocket.dart';
import 'package:kid_management/src/fake-data/socket_utils.dart';

class Global {
  // Socket
  static SocketUtils socketUtils;
  static List<UserSocket> dummyUsers;

  // Logged In User
  static UserSocket loggedInUser;

  // Single Chat - To Chat User
  static UserSocket toChatUser;

  static initSocket() {
    if (null == socketUtils) {
      socketUtils = SocketUtils();
    }
  }

  static void initDummyUsers() {
    UserSocket userA = new UserSocket(id: 1000, isParent: true);
    UserSocket userB = new UserSocket(id: 1001, isParent: false);
    dummyUsers = List<UserSocket>();
    dummyUsers.add(userA);
    dummyUsers.add(userB);
  }

  static List<UserSocket> getUsersFor(UserSocket user) {
    List<UserSocket> filteredUsers =
        dummyUsers.where((u) => (!(u.id == user.id))).toList();
    return filteredUsers;
  }
}
