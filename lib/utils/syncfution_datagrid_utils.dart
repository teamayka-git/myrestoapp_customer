class SyncfutionDataGridUtils {
  List<int> getRawPerPageArray(int item) {
    List<int> items = [10, 20, 30, 40, 50];

    int index = items.indexWhere((element) => element == item);
    if (index != -1) {
      items.removeAt(index);
      items.insert(0, item);
    }

    return items;
  }
}
