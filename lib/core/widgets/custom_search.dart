class SearchUtils {

  static List<T> byStringField<T>(
    List<T> list,
    String query,
    String Function(T) getField,
  ) {
    final lowerQuery = query.toLowerCase().trim();
    return list.where((item) {
      final field = getField(item).toLowerCase();
      return field.contains(lowerQuery);
    }).toList();
  }
}
