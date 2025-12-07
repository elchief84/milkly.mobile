import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_breastfeeding/features/onboarding/domain/entities/question_type.dart';

part 'questionnaire_model.freezed.dart';
part 'questionnaire_model.g.dart';

/// Root questionnaire model
@freezed
class QuestionnaireModel with _$QuestionnaireModel {
  const factory QuestionnaireModel({
    required int version,
    required String flowId,
    required List<StepModel> steps,
  }) = _QuestionnaireModel;

  factory QuestionnaireModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionnaireModelFromJson(json);
}

/// Step in the questionnaire
@freezed
class StepModel with _$StepModel {
  const factory StepModel({
    required String id,
    required String title,
    required List<QuestionModel> questions,
    Map<String, dynamic>? visibilityCondition,
  }) = _StepModel;

  factory StepModel.fromJson(Map<String, dynamic> json) =>
      _$StepModelFromJson(json);
}

/// Question in a step
@freezed
class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    required String id,
    required String type,
    required String title,
    required bool required,
    List<OptionModel>? options,
    Map<String, dynamic>? visibilityCondition,
    String? placeholder,
    int? min,
    int? max,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}

/// Option for single/multiple choice questions
@freezed
class OptionModel with _$OptionModel {
  const factory OptionModel({required String id, required String text}) =
      _OptionModel;

  factory OptionModel.fromJson(Map<String, dynamic> json) =>
      _$OptionModelFromJson(json);
}

/// Conditional logic for showing/hiding questions
@freezed
class ConditionalLogicModel with _$ConditionalLogicModel {
  const factory ConditionalLogicModel({
    required String showIf,
    required String field,
    required dynamic value,
  }) = _ConditionalLogicModel;

  factory ConditionalLogicModel.fromJson(Map<String, dynamic> json) =>
      _$ConditionalLogicModelFromJson(json);
}

/// Extension to get QuestionType enum from model
extension QuestionModelExtension on QuestionModel {
  QuestionType get questionType => QuestionType.fromString(type);
}
