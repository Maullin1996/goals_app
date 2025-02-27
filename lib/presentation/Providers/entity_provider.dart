import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goals_app/models/purpose_entity.dart';
import 'package:goals_app/presentation/Providers/list_storage_provider.dart';

/// A provider that manages the state of a [PurposeEntity].
class EntityProvider extends StateNotifier<PurposeEntity> {
  /// Creates an [EntityProvider] with an initial [PurposeEntity].
  EntityProvider({required PurposeEntity initialEntity}) : super(initialEntity);

  /// Updates the title of the current [PurposeEntity].
  void updateTitle(String newTitle) {
    state = state.copyWith(title: newTitle);
  }

  /// Updates the description of the current [PurposeEntity].
  void updateDescription(String newDescription) {
    state = state.copyWith(description: newDescription);
  }

  /// Updates the activities of the current [PurposeEntity].
  void updateTodo(Map<String, bool> todo) {
    state = state.copyWith(activities: todo);
  }

  /// Toggles the completion status of a specific activity in the current [PurposeEntity].
  void toggleTodo(String todoKey) {
    if (state.activities.containsKey(todoKey)) {
      final changeState = {
        ...state.activities,
        todoKey: !state.activities[todoKey]!,
      };
      state = state.copyWith(activities: changeState);
    }
  }
}

/// A provider family that creates an [EntityProvider] for a specific date.
final entityProviderFamily =
    StateNotifierProvider.family<EntityProvider, PurposeEntity, DateTime>((
      ref,
      dateId,
    ) {
      // Find the entity with this date ID from the list provider
      final entities = ref.read(listStorageProvider);
      final entity = entities.firstWhere(
        (entity) => entity.date == dateId,
        orElse: () => PurposeEntity(date: dateId),
      );

      // Create provider with the found entity
      return EntityProvider(initialEntity: entity);
    });
