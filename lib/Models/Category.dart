const String categoryTable = 'categoryTable';
class CategoryFields {
  static final List<String> values = [
    /// Add all fields
     categoryID, categoryName
  ];

  static const String categoryID = 'categoryID';
  static const String categoryName = 'categoryName';
}

class Category {
  final int? categoryID;
  final String categoryName;

  const Category({
    this.categoryID,
    required this.categoryName,
  });

  Category copy({
    int? categoryID,
    String? categoryName
  }) =>
      Category(
        categoryID: categoryID ?? this.categoryID,
        categoryName: categoryName ?? this.categoryName
      );

  static Category fromJson(Map<String, Object?> json) => Category(
    categoryID: json[CategoryFields.categoryID] as int?,
    categoryName: json[CategoryFields.categoryName] as String
  );

  Map<String, Object?> toJson() => {
    CategoryFields.categoryID: categoryID,
    CategoryFields.categoryName: categoryName
  };
}