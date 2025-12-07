// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionnaire_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionnaireModelImpl _$$QuestionnaireModelImplFromJson(
  Map<String, dynamic> json,
) => _$QuestionnaireModelImpl(
  version: (json['version'] as num).toInt(),
  flowId: json['flowId'] as String,
  steps: (json['steps'] as List<dynamic>)
      .map((e) => StepModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$QuestionnaireModelImplToJson(
  _$QuestionnaireModelImpl instance,
) => <String, dynamic>{
  'version': instance.version,
  'flowId': instance.flowId,
  'steps': instance.steps,
};

_$StepModelImpl _$$StepModelImplFromJson(Map<String, dynamic> json) =>
    _$StepModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      visibilityCondition: json['visibilityCondition'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$StepModelImplToJson(_$StepModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'questions': instance.questions,
      'visibilityCondition': instance.visibilityCondition,
    };

_$QuestionModelImpl _$$QuestionModelImplFromJson(Map<String, dynamic> json) =>
    _$QuestionModelImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      required: json['required'] as bool,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => OptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      visibilityCondition: json['visibilityCondition'] as Map<String, dynamic>?,
      placeholder: json['placeholder'] as String?,
      min: (json['min'] as num?)?.toInt(),
      max: (json['max'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$QuestionModelImplToJson(_$QuestionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'required': instance.required,
      'options': instance.options,
      'visibilityCondition': instance.visibilityCondition,
      'placeholder': instance.placeholder,
      'min': instance.min,
      'max': instance.max,
    };

_$OptionModelImpl _$$OptionModelImplFromJson(Map<String, dynamic> json) =>
    _$OptionModelImpl(id: json['id'] as String, text: json['text'] as String);

Map<String, dynamic> _$$OptionModelImplToJson(_$OptionModelImpl instance) =>
    <String, dynamic>{'id': instance.id, 'text': instance.text};

_$ConditionalLogicModelImpl _$$ConditionalLogicModelImplFromJson(
  Map<String, dynamic> json,
) => _$ConditionalLogicModelImpl(
  showIf: json['showIf'] as String,
  field: json['field'] as String,
  value: json['value'],
);

Map<String, dynamic> _$$ConditionalLogicModelImplToJson(
  _$ConditionalLogicModelImpl instance,
) => <String, dynamic>{
  'showIf': instance.showIf,
  'field': instance.field,
  'value': instance.value,
};
