import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goals_app/models/purpose_entity.dart';

/// A provider that manages a list of [PurposeEntity] objects.
class ListStorageProvider extends StateNotifier<List<PurposeEntity>> {
  /// Creates a [ListStorageProvider] with an initial state.
  ListStorageProvider(super.state);

  /// Adds a new [PurposeEntity] to the list.
  void addList(PurposeEntity newPurpose) {
    state = [newPurpose, ...state];
  }

  /// Removes a [PurposeEntity] from the list by its date.
  void removePurpose(DateTime dateId) {
    state = state.where((entity) => entity.date != dateId).toList();
  }

  /// Updates an existing [PurposeEntity] in the list.
  void updateEntity(PurposeEntity updatedEntity) {
    state =
        state.map((entity) {
          if (entity.date == updatedEntity.date) {
            return updatedEntity;
          }
          return entity;
        }).toList();
  }
}

/// A provider that creates a [ListStorageProvider] with an initial empty list.
final listStorageProvider =
    StateNotifierProvider<ListStorageProvider, List<PurposeEntity>>((ref) {
      return ListStorageProvider([]);
    });
