/// A class that represents a purpose entity with various attributes.
class PurposeEntity {
  /// The title of the purpose.
  final String title;

  /// The date associated with the purpose.
  final DateTime date;

  /// The description of the purpose.
  final String description;

  /// A map of activities related to the purpose, where the key is the activity name and the value is a boolean indicating if it's completed.
  final Map<String, bool> activities;

  /// A boolean indicating if the purpose is currently being posted.
  final bool isPosting;

  /// Creates a new [PurposeEntity].
  ///
  /// If [date] is not provided, it defaults to January 1, 2015.
  PurposeEntity({
    this.title = '',
    DateTime? date,
    this.description = '',
    this.activities = const {},
    this.isPosting = false,
  }) : date = date ?? DateTime(2015, 1, 1);

  /// Creates a copy of this [PurposeEntity] but with the given fields replaced with the new values.
  PurposeEntity copyWith({
    String? title,
    DateTime? date,
    String? description,
    Map<String, bool>? activities,
    bool? isPosting,
  }) => PurposeEntity(
    title: title ?? this.title,
    date: date ?? this.date,
    description: description ?? this.description,
    activities: activities ?? this.activities,
    isPosting: isPosting ?? this.isPosting,
  );
}
