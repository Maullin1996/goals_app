import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:goals_app/models/purpose_entity.dart';
import '../Providers/providers.dart';

import 'package:goals_app/config/design/tokens.dart';
import 'package:goals_app/presentation/widgets/widgets.dart';

class FormsScreen extends ConsumerStatefulWidget {
  final PurposeEntity? purposeEntity;
  const FormsScreen({super.key, this.purposeEntity});

  @override
  ConsumerState<FormsScreen> createState() => _FormsScreenState();
}

class _FormsScreenState extends ConsumerState<FormsScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _noteController;
  final TextEditingController _todoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Using a more appropriate data structure for todos
  late final Map<String, bool> _todos;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.purposeEntity?.title);
    _noteController = TextEditingController(
      text: widget.purposeEntity?.description,
    );
    if (widget.purposeEntity?.activities == null) {
      _todos = {};
    } else {
      _todos = widget.purposeEntity!.activities;
    }
  }

  @override
  void dispose() {
    // Properly dispose controllers to prevent memory leaks
    _titleController.dispose();
    _noteController.dispose();
    _todoController.dispose();
    super.dispose();
  }

  void _addTodo() {
    if (_formKey.currentState!.validate() && _todoController.text.isNotEmpty) {
      setState(() {
        _todos[_todoController.text] = false;
        _todoController.clear();
      });
    }
  }

  void _toggleTodoStatus(String todoKey) {
    setState(() {
      _todos[todoKey] = !(_todos[todoKey] ?? false);
    });
  }

  void _deleteTodo(String todoKey) {
    setState(() {
      _todos.remove(todoKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Edit TO-DO',
            style: textTheme.displayMedium?.copyWith(
              color: AppColors.onBackground,
            ),
          ),
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        floatingActionButton: FloatingActionButtonCustom(
          onPressed: () {
            if (widget.purposeEntity?.date == null) {
              ref
                  .read(listStorageProvider.notifier)
                  .addList(
                    PurposeEntity(
                      title: _titleController.text,
                      description: _noteController.text,
                      date: DateTime.now(),
                      activities: _todos,
                    ),
                  );
            } else {
              final entityProvider = entityProviderFamily(
                widget.purposeEntity!.date,
              );
              ref
                  .read(entityProvider.notifier)
                  .updateTitle(_titleController.text);
              ref
                  .read(entityProvider.notifier)
                  .updateDescription(_noteController.text);
              ref.read(entityProvider.notifier).updateTodo(_todos);
            }

            context.pop();
          },
          iconTheme: Icons.save,
        ),
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xmedium,
              vertical: AppSpacing.small,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      title: 'Title',
                      controller: _titleController,
                      textStyle: textTheme.displayMedium!.copyWith(
                        color: AppColors.onSecondary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.medium),
                    Text(
                      'Description',
                      style: textTheme.displayMedium?.copyWith(
                        color: AppColors.onSecondary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.small),
                    NoteTextField(controller: _noteController),
                    const SizedBox(height: AppSpacing.medium),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _todos.length,
                      itemBuilder: (context, index) {
                        final todoEntry = _todos.entries.elementAt(index);
                        final todoText = todoEntry.key;
                        final isCompleted = todoEntry.value;

                        return Container(
                          margin: const EdgeInsets.only(
                            bottom: AppRadius.small,
                          ),
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
                                onChanged:
                                    (_) => _toggleTodoStatus.call(
                                      todoText,
                                    ), // Null check
                              ),
                              Expanded(
                                child: Text(
                                  todoText,
                                  style:
                                      isCompleted
                                          ? const TextStyle(
                                            color: AppColors.backGroundText,
                                          )
                                          : null,
                                ),
                              ),
                              IconButton(
                                onPressed:
                                    () => _deleteTodo.call(
                                      todoText,
                                    ), // Null check
                                icon: const Icon(
                                  Icons.delete,
                                  color: AppColors.primaryVariant,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: AppSpacing.medium),
                    CustomTextFormField(
                      title: 'Write your TODO here',
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Write a TODO'
                                  : null,
                      controller: _todoController,
                      textStyle: textTheme.bodyLarge!.copyWith(
                        color: AppColors.backGroundText,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.medium),
                    Center(
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: const WidgetStatePropertyAll(
                            AppColors.primary,
                          ),
                        ),
                        onPressed: _addTodo,
                        child: Text(
                          'Add a TODO',
                          style: textTheme.displaySmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
