import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:goals_app/models/purpose_entity.dart';

import 'package:goals_app/presentation/widgets/widgets.dart';

import '../../config/design/tokens.dart';
import '../../presentation/Providers/providers.dart';

class DetailsScreen extends ConsumerWidget {
  final PurposeEntity purposeEntity;
  const DetailsScreen({super.key, required this.purposeEntity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entityProvider = entityProviderFamily(purposeEntity.date);
    final currentEntity = ref.watch(entityProvider);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          currentEntity.title,
          style: textTheme.displayMedium?.copyWith(
            color: AppColors.onBackground,
          ),
        ),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButtonCustom(
            onPressed: () {
              ref
                  .read(listStorageProvider.notifier)
                  .removePurpose(currentEntity.date);
              context.pop();
            },
            backgroundColor: AppColors.backGroundButtonError,
            iconColor: AppColors.error,
            iconTheme: Icons.delete_forever,
          ),
          SizedBox(height: AppSpacing.small),
          FloatingActionButtonCustom(
            key: Key('button2'),
            onPressed: () {
              context.push('/form', extra: currentEntity);
            },
            iconTheme: Icons.edit,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xmedium,
          vertical: AppSpacing.medium,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              currentEntity.description,
              style: textTheme.bodyLarge?.copyWith(fontSize: 24),
            ),
            SizedBox(height: AppSpacing.medium),
            if (currentEntity.activities.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: currentEntity.activities.length,
                itemBuilder: (BuildContext context, int index) {
                  final entries = currentEntity.activities.entries.toList();
                  final todoKey = entries[index].key;
                  final isCompleted = entries[index].value;

                  return Container(
                    margin: const EdgeInsets.only(bottom: AppRadius.small),
                    child: Row(
                      children: [
                        Checkbox(
                          shape: const CircleBorder(),
                          fillColor: WidgetStateProperty.all(
                            isCompleted
                                ? AppColors.primaryVariant
                                : AppColors.backGroundButton,
                          ),
                          value: isCompleted,
                          onChanged: (value) {
                            ref
                                .read(entityProvider.notifier)
                                .toggleTodo(todoKey);
                          },
                        ),
                        Expanded(
                          child: Text(
                            todoKey,
                            style:
                                isCompleted
                                    ? const TextStyle(
                                      color: AppColors.backGroundText,
                                    )
                                    : null,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
