import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../Providers/providers.dart';

import 'package:goals_app/config/design/tokens.dart';
import '../helpers/calculate_progress.dart';
import '../widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listTodos = ref.watch(listStorageProvider);
    final TextTheme textStyle = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('TODO List', style: textStyle.displayLarge),
          ),
          backgroundColor: AppColors.primaryVariant,
        ),
        floatingActionButton: FloatingActionButtonCustom(
          onPressed: () {
            context.push('/form');
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppSpacing.small),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your List of Purposes',
                  style: textStyle.bodyLarge?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: listTodos.length,
                  itemBuilder: (BuildContext context, int index) {
                    final todo = listTodos[index];
                    return GestureDetector(
                      onTap: () => context.push('/details', extra: todo),
                      child: Card(
                        color: AppColors.background,
                        child: ListTile(
                          title: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  todo.title,
                                  style: textStyle.displaySmall?.copyWith(
                                    color: AppColors.onSecondary,
                                  ),
                                ),
                              ),
                              Text(
                                todo.date.toString().substring(0, 10),
                                style: textStyle.bodyMedium,
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                todo.description,
                                style: textStyle.bodyMedium?.copyWith(
                                  color: Colors.black54,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                              SizedBox(height: AppSpacing.xssmall),
                              Text(
                                'Progress: ${calculateProgress(todo.activities)}',
                                style: textStyle.bodyMedium?.copyWith(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
