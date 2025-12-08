import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_breastfeeding/core/constants/app_constants.dart';
import 'package:smart_breastfeeding/core/di/injection.dart';
import 'package:smart_breastfeeding/core/navigation/app_router.dart';
import 'package:smart_breastfeeding/core/theme/app_theme.dart';
import 'package:smart_breastfeeding/core/theme/theme_cubit.dart';
import 'package:smart_breastfeeding/core/utils/theme_extensions.dart';
import 'package:smart_breastfeeding/features/onboarding/data/models/questionnaire_model.dart';

/// Onboarding review page - shows all answers in a list format for confirmation
class OnboardingReviewPage extends StatefulWidget {
  final Map<String, dynamic> answers;
  final QuestionnaireModel? questionnaire;

  const OnboardingReviewPage({
    super.key,
    required this.answers,
    this.questionnaire,
  });

  @override
  State<OnboardingReviewPage> createState() => _OnboardingReviewPageState();
}

class _OnboardingReviewPageState extends State<OnboardingReviewPage> {
  late Map<String, dynamic> _answers;

  @override
  void initState() {
    super.initState();
    _answers = Map<String, dynamic>.from(widget.answers);
  }

  void _updateSex(String newSex) {
    setState(() {
      _answers['childSex'] = newSex;
    });

    // Update theme based on sex
    context.read<ThemeCubit>().setThemeFromChildSex(newSex);
  }

  void _updateName(String newName) {
    setState(() {
      _answers['childName'] = newName;
    });
  }

  Future<void> _updateBirthDate(ThemeVariant variant) async {
    final currentDate =
        DateTime.tryParse(_answers['childBirthDate'] as String? ?? '') ??
        DateTime.now();

    final newDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppTheme.getPrimaryColor(variant),
              onPrimary: AppTheme.white,
              surface: AppTheme.white,
              onSurface: AppTheme.textDarkPrimary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (newDate != null) {
      setState(() {
        _answers['childBirthDate'] = newDate.toIso8601String();
      });
    }
  }

  Future<void> _updatePhoto() async {
    final variant = context.read<ThemeCubit>().state;

    // Show dialog to choose camera or gallery
    final source = await showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Scegli sorgente'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(
                Icons.camera_alt,
                color: AppTheme.getPrimaryColor(variant),
              ),
              title: const Text('Fotocamera'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            ListTile(
              leading: Icon(
                Icons.photo_library,
                color: AppTheme.getPrimaryColor(variant),
              ),
              title: const Text('Galleria'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annulla'),
          ),
        ],
      ),
    );

    if (source == null) return;

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _answers['childPhoto'] = pickedFile.path;
      });
    }
  }

  Future<void> _editAnswer(String questionId) async {
    final question = _findQuestion(questionId);
    if (question == null) return;

    final currentAnswer = _answers[questionId];
    final variant = context.read<ThemeCubit>().state;

    // Show dialog based on question type
    dynamic newAnswer;

    switch (question.type) {
      case 'single_choice':
        newAnswer = await _showSingleChoiceDialog(
          question,
          currentAnswer,
          variant,
        );
        break;
      case 'multiple_choice':
        newAnswer = await _showMultipleChoiceDialog(
          question,
          currentAnswer,
          variant,
        );
        break;
      case 'text':
        newAnswer = await _showTextDialog(question, currentAnswer, variant);
        break;
      case 'number':
        newAnswer = await _showNumberDialog(question, currentAnswer, variant);
        break;
      case 'date':
        newAnswer = await _showDateDialog(question, currentAnswer, variant);
        break;
      case 'time':
        newAnswer = await _showTimeDialog(question, currentAnswer, variant);
        break;
      default:
        return;
    }

    if (newAnswer != null) {
      setState(() {
        _answers[questionId] = newAnswer;
      });
    }
  }

  QuestionModel? _findQuestion(String questionId) {
    if (widget.questionnaire == null) return null;

    for (final step in widget.questionnaire!.steps) {
      for (final question in step.questions) {
        if (question.id == questionId) {
          return question;
        }
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = context.watch<ThemeCubit>().state;

    // Extract baby info
    final childName = _answers['childName'] as String? ?? '';
    final childSex = _answers['childSex'] as String? ?? '';
    final childBirthDate = _answers['childBirthDate'] as String? ?? '';
    final childPhoto = _answers['childPhoto'] as String? ?? '';

    return Scaffold(
      backgroundColor: AppTheme.getThemeForVariant(
        currentTheme,
      ).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.getThemeForVariant(
          currentTheme,
        ).scaffoldBackgroundColor,
        title: const Text('Conferma il tuo piano'),
        automaticallyImplyLeading: false, // No back button
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  // Baby info card
                  _BabyInfoCard(
                    name: childName,
                    sex: childSex,
                    birthDate: childBirthDate,
                    photoPath: childPhoto,
                    variant: currentTheme,
                    onSexChanged: _updateSex,
                    onNameChanged: _updateName,
                    onBirthDateTap: () => _updateBirthDate(currentTheme),
                    onPhotoTap: _updatePhoto,
                  ),
                  const SizedBox(height: 32),

                  // Section title
                  Text(
                    'Riepilogo risposte',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // All answers list
                  _AnswersList(
                    answers: _answers,
                    questionnaire: widget.questionnaire,
                    variant: currentTheme,
                    onEdit: _editAnswer,
                  ),
                ],
              ),
            ),

            // Confirm button
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _confirmAndComplete(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.getPrimaryColor(currentTheme),
                    foregroundColor: AppTheme.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Conferma e crea il piano',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmAndComplete(BuildContext context) async {
    final prefs = getIt<SharedPreferences>();
    await prefs.setBool(AppConstants.keyOnboardingCompleted, true);

    if (context.mounted) {
      context.go(AppRoutes.home);
    }
  }

  // Dialog methods for editing answers
  Future<String?> _showSingleChoiceDialog(
    QuestionModel question,
    dynamic currentAnswer,
    ThemeVariant variant,
  ) async {
    String? selectedOption = currentAnswer as String?;

    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(question.title),
        content: StatefulBuilder(
          builder: (context, setState) => Column(
            mainAxisSize: MainAxisSize.min,
            children: (question.options ?? []).map((option) {
              return RadioListTile<String>(
                title: Text(option.text),
                value: option.id,
                groupValue: selectedOption,
                activeColor: AppTheme.getPrimaryColor(variant),
                onChanged: (value) {
                  setState(() {
                    selectedOption = value;
                  });
                },
              );
            }).toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annulla'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, selectedOption),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.getPrimaryColor(variant),
              foregroundColor: AppTheme.white,
            ),
            child: const Text('Conferma'),
          ),
        ],
      ),
    );
  }

  Future<List<String>?> _showMultipleChoiceDialog(
    QuestionModel question,
    dynamic currentAnswer,
    ThemeVariant variant,
  ) async {
    List<String> selectedOptions = currentAnswer is List
        ? List<String>.from(currentAnswer)
        : [];

    return showDialog<List<String>>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(question.title),
        content: StatefulBuilder(
          builder: (context, setState) => Column(
            mainAxisSize: MainAxisSize.min,
            children: (question.options ?? []).map((option) {
              final isSelected = selectedOptions.contains(option.id);
              return CheckboxListTile(
                title: Text(option.text),
                value: isSelected,
                activeColor: AppTheme.getPrimaryColor(variant),
                onChanged: (checked) {
                  setState(() {
                    if (checked == true) {
                      selectedOptions.add(option.id);
                    } else {
                      selectedOptions.remove(option.id);
                    }
                  });
                },
              );
            }).toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annulla'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, selectedOptions),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.getPrimaryColor(variant),
              foregroundColor: AppTheme.white,
            ),
            child: const Text('Conferma'),
          ),
        ],
      ),
    );
  }

  Future<String?> _showTextDialog(
    QuestionModel question,
    dynamic currentAnswer,
    ThemeVariant variant,
  ) async {
    final controller = TextEditingController(
      text: currentAnswer?.toString() ?? '',
    );

    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(question.title),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Inserisci la risposta',
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getPrimaryColor(variant)),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annulla'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, controller.text),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.getPrimaryColor(variant),
              foregroundColor: AppTheme.white,
            ),
            child: const Text('Conferma'),
          ),
        ],
      ),
    );
  }

  Future<String?> _showNumberDialog(
    QuestionModel question,
    dynamic currentAnswer,
    ThemeVariant variant,
  ) async {
    final controller = TextEditingController(
      text: currentAnswer?.toString() ?? '',
    );

    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(question.title),
        content: TextField(
          controller: controller,
          autofocus: true,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Inserisci un numero',
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getPrimaryColor(variant)),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annulla'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, controller.text),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.getPrimaryColor(variant),
              foregroundColor: AppTheme.white,
            ),
            child: const Text('Conferma'),
          ),
        ],
      ),
    );
  }

  Future<String?> _showDateDialog(
    QuestionModel question,
    dynamic currentAnswer,
    ThemeVariant variant,
  ) async {
    final currentDate =
        DateTime.tryParse(currentAnswer?.toString() ?? '') ?? DateTime.now();

    final newDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppTheme.getPrimaryColor(variant),
              onPrimary: AppTheme.white,
              surface: AppTheme.white,
              onSurface: AppTheme.textDarkPrimary,
            ),
          ),
          child: child!,
        );
      },
    );

    return newDate?.toIso8601String();
  }

  Future<String?> _showTimeDialog(
    QuestionModel question,
    dynamic currentAnswer,
    ThemeVariant variant,
  ) async {
    TimeOfDay currentTime = TimeOfDay.now();

    if (currentAnswer != null) {
      final parts = currentAnswer.toString().split(':');
      if (parts.length >= 2) {
        currentTime = TimeOfDay(
          hour: int.tryParse(parts[0]) ?? 0,
          minute: int.tryParse(parts[1]) ?? 0,
        );
      }
    }

    final newTime = await showTimePicker(
      context: context,
      initialTime: currentTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppTheme.getPrimaryColor(variant),
              onPrimary: AppTheme.white,
              surface: AppTheme.white,
              onSurface: AppTheme.textDarkPrimary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (newTime != null) {
      return '${newTime.hour.toString().padLeft(2, '0')}:${newTime.minute.toString().padLeft(2, '0')}';
    }
    return null;
  }
}

/// Baby info card widget
class _BabyInfoCard extends StatelessWidget {
  final String name;
  final String sex;
  final String birthDate;
  final String photoPath;
  final ThemeVariant variant;
  final Function(String) onSexChanged;
  final Function(String) onNameChanged;
  final VoidCallback onBirthDateTap;
  final VoidCallback onPhotoTap;

  const _BabyInfoCard({
    required this.name,
    required this.sex,
    required this.birthDate,
    required this.photoPath,
    required this.variant,
    required this.onSexChanged,
    required this.onNameChanged,
    required this.onBirthDateTap,
    required this.onPhotoTap,
  });

  String _getSexLabel(String sex) {
    switch (sex) {
      case 'female':
        return 'Femmina';
      case 'male':
        return 'Maschio';
      case 'other':
        return 'Non specificato';
      default:
        return sex;
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    FocusNode nameFocusNode = FocusNode();

    nameController.text = name;

    ButtonStyle buttonStyle = FilledButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      alignment: Alignment.center,
    );

    return Column(
      children: [
        // Photo
        if (photoPath.isNotEmpty)
          Stack(
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  border: Border.all(
                    color: AppTheme.getPrimaryColor(variant),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: Image.file(File(photoPath), fit: BoxFit.cover),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.getPrimaryColor(variant),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.edit, size: 18, color: Colors.white),
                    onPressed: onPhotoTap,
                  ),
                ),
              ),
            ],
          ),
        if (photoPath.isNotEmpty) const SizedBox(height: 20),

        // Info
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: TextField(
                controller: nameController,
                focusNode: nameFocusNode,
                cursorColor: AppTheme.getPrimaryColor(variant),
                textAlign: TextAlign.center,
                style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: AppTheme.getPrimaryColor(variant),
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: AppTheme.getPrimaryColor(variant),
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: AppTheme.getPrimaryColor(variant),
                      width: 2,
                    ),
                  ),
                  hintStyle: context.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.getPrimaryColor(variant),
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                ),
                onChanged: onNameChanged,
                onSubmitted: (_) => nameFocusNode.unfocus(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: onBirthDateTap,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppTheme.getSurfaceColor(variant),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: AppTheme.getPrimaryColor(variant),
                width: 2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  birthDate.split('T')[0],
                  style: TextStyle(color: AppTheme.getPrimaryColor(variant)),
                ),
                Icon(Icons.cake, color: AppTheme.getPrimaryColor(variant)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: FilledButton(
                  onPressed: () => onSexChanged('male'),
                  style: buttonStyle.copyWith(
                    backgroundColor: WidgetStateProperty.all(
                      _getSexLabel(sex) == 'Maschio'
                          ? AppTheme.getPrimaryColor(ThemeVariant.boy)
                          : AppTheme.getPrimaryLightColor(
                              ThemeVariant.boy,
                            ).withValues(alpha: 0.3),
                    ),
                    foregroundColor: WidgetStateProperty.all(
                      _getSexLabel(sex) == 'Maschio'
                          ? AppTheme.white
                          : AppTheme.getPrimaryColor(ThemeVariant.boy),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.male,
                        color: _getSexLabel(sex) == 'Maschio'
                            ? AppTheme.white
                            : AppTheme.getPrimaryColor(ThemeVariant.boy),
                      ),
                      Text('Maschio'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: FilledButton(
                  onPressed: () => onSexChanged('female'),
                  style: buttonStyle.copyWith(
                    backgroundColor: WidgetStateProperty.all(
                      _getSexLabel(sex) == 'Femmina'
                          ? AppTheme.getPrimaryColor(ThemeVariant.girl)
                          : AppTheme.getPrimaryLightColor(
                              ThemeVariant.girl,
                            ).withValues(alpha: 0.3),
                    ),
                    foregroundColor: WidgetStateProperty.all(
                      _getSexLabel(sex) == 'Femmina'
                          ? AppTheme.white
                          : AppTheme.getPrimaryColor(ThemeVariant.girl),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.female,
                        color: _getSexLabel(sex) == 'Femmina'
                            ? AppTheme.white
                            : AppTheme.getPrimaryColor(ThemeVariant.girl),
                      ),
                      Text('Femmina'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: FilledButton(
                  onPressed: () => onSexChanged('other'),
                  style: buttonStyle.copyWith(
                    backgroundColor: WidgetStateProperty.all(
                      _getSexLabel(sex) == 'Altro'
                          ? AppTheme.getPrimaryColor(ThemeVariant.neutral)
                          : AppTheme.getPrimaryLightColor(
                              ThemeVariant.neutral,
                            ).withValues(alpha: 0.3),
                    ),
                    foregroundColor: WidgetStateProperty.all(
                      _getSexLabel(sex) == 'Altro'
                          ? AppTheme.white
                          : AppTheme.getPrimaryColor(ThemeVariant.neutral),
                    ),
                  ),
                  child: Text('Altro'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Answers list widget
class _AnswersList extends StatelessWidget {
  final Map<String, dynamic> answers;
  final QuestionnaireModel? questionnaire;
  final ThemeVariant variant;
  final Function(String) onEdit;

  const _AnswersList({
    required this.answers,
    this.questionnaire,
    required this.variant,
    required this.onEdit,
  });

  // Questions to skip in the list (already shown in baby info card)
  static const _skipQuestions = {
    'childName',
    'childSex',
    'childBirthDate',
    'childPhoto',
  };

  QuestionModel? _findQuestion(String questionId) {
    if (questionnaire == null) return null;

    for (final step in questionnaire!.steps) {
      for (final question in step.questions) {
        if (question.id == questionId) {
          return question;
        }
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // Filter out baby info questions
    final filteredAnswers = Map<String, dynamic>.from(answers)
      ..removeWhere((key, value) => _skipQuestions.contains(key));

    if (filteredAnswers.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: filteredAnswers.entries.map((entry) {
        final question = _findQuestion(entry.key);
        return _AnswerItem(
          questionId: entry.key,
          questionTitle: question?.title,
          questionType: question?.type,
          questionOptions: question?.options,
          answer: entry.value,
          variant: variant,
          onEdit: () => onEdit(entry.key),
        );
      }).toList(),
    );
  }
}

/// Single answer item widget
class _AnswerItem extends StatelessWidget {
  final String questionId;
  final String? questionTitle;
  final String? questionType;
  final List<OptionModel>? questionOptions;
  final dynamic answer;
  final ThemeVariant variant;
  final VoidCallback onEdit;

  const _AnswerItem({
    required this.questionId,
    this.questionTitle,
    this.questionType,
    this.questionOptions,
    required this.answer,
    required this.variant,
    required this.onEdit,
  });

  String _formatQuestionId(String id) {
    // Convert camelCase to readable format
    return id
        .replaceAllMapped(RegExp(r'([A-Z])'), (match) => ' ${match.group(0)}')
        .trim();
  }

  String _getDisplayTitle() {
    if (questionTitle != null && questionTitle!.isNotEmpty) {
      // Remove placeholders from title
      return questionTitle!.replaceAll(RegExp(r'\{[^}]+\}'), '...').trim();
    }
    return _formatQuestionId(questionId);
  }

  String _getDisplayAnswer() {
    if (answer == null) return '';

    final type = questionType ?? '';

    switch (type) {
      case 'single_choice':
        // Find option text
        if (questionOptions != null) {
          final option = questionOptions!.firstWhere(
            (opt) => opt.id == answer,
            orElse: () =>
                OptionModel(id: answer.toString(), text: answer.toString()),
          );
          return option.text;
        }
        return answer.toString();

      case 'multiple_choice':
        // Join multiple option texts
        if (questionOptions != null && answer is List) {
          return (answer as List)
              .map((id) {
                final option = questionOptions!.firstWhere(
                  (opt) => opt.id == id,
                  orElse: () =>
                      OptionModel(id: id.toString(), text: id.toString()),
                );
                return option.text;
              })
              .join(', ');
        }
        return answer.toString();

      case 'date':
        return answer.toString().split('T')[0];

      case 'photo':
        return '📷 Foto caricata';

      default:
        return answer.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        title: Text(
          _getDisplayTitle(),
          style: Theme.of(
            context,
          ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            _getDisplayAnswer(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.edit, color: AppTheme.getPrimaryColor(variant)),
          onPressed: onEdit,
        ),
      ),
    );
  }
}
