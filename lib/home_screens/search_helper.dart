// search_helper.dart
List<String> filterItems(List<String> allItems, String query) {
  if (query.isEmpty) {
    return allItems;
  } else {
    return allItems
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
