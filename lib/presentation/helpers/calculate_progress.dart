/// Calculates the progress of activities as a percentage.
///
/// Takes a map of activities where the key is the activity name and the value
/// is a boolean indicating if the activity is completed. Returns the progress
/// as a percentage string.
String calculateProgress(Map<String, bool> activities) {
  int total = 0;

  // Iterate through the activities and count the completed ones.
  activities.forEach((key, value) {
    if (value) {
      total++;
    }
  });

  // Calculate the percentage of completed activities.
  return '${total * 100 ~/ activities.length}%';
}
