class ChatUtils {
  getGroupUid({required String person1, required String person2}) {
    List<String> users = [person1, person2];
    users.sort();
    return "${users[0]}_${users[1]}";
  }
}
