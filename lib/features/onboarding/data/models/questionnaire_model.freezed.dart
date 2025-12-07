// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'questionnaire_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuestionnaireModel _$QuestionnaireModelFromJson(Map<String, dynamic> json) {
  return _QuestionnaireModel.fromJson(json);
}

/// @nodoc
mixin _$QuestionnaireModel {
  int get version => throw _privateConstructorUsedError;
  String get flowId => throw _privateConstructorUsedError;
  List<StepModel> get steps => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionnaireModelCopyWith<QuestionnaireModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionnaireModelCopyWith<$Res> {
  factory $QuestionnaireModelCopyWith(
          QuestionnaireModel value, $Res Function(QuestionnaireModel) then) =
      _$QuestionnaireModelCopyWithImpl<$Res, QuestionnaireModel>;
  @useResult
  $Res call({int version, String flowId, List<StepModel> steps});
}

/// @nodoc
class _$QuestionnaireModelCopyWithImpl<$Res, $Val extends QuestionnaireModel>
    implements $QuestionnaireModelCopyWith<$Res> {
  _$QuestionnaireModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? flowId = null,
    Object? steps = null,
  }) {
    return _then(_value.copyWith(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      flowId: null == flowId
          ? _value.flowId
          : flowId // ignore: cast_nullable_to_non_nullable
              as String,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<StepModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionnaireModelImplCopyWith<$Res>
    implements $QuestionnaireModelCopyWith<$Res> {
  factory _$$QuestionnaireModelImplCopyWith(_$QuestionnaireModelImpl value,
          $Res Function(_$QuestionnaireModelImpl) then) =
      __$$QuestionnaireModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int version, String flowId, List<StepModel> steps});
}

/// @nodoc
class __$$QuestionnaireModelImplCopyWithImpl<$Res>
    extends _$QuestionnaireModelCopyWithImpl<$Res, _$QuestionnaireModelImpl>
    implements _$$QuestionnaireModelImplCopyWith<$Res> {
  __$$QuestionnaireModelImplCopyWithImpl(_$QuestionnaireModelImpl _value,
      $Res Function(_$QuestionnaireModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? flowId = null,
    Object? steps = null,
  }) {
    return _then(_$QuestionnaireModelImpl(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      flowId: null == flowId
          ? _value.flowId
          : flowId // ignore: cast_nullable_to_non_nullable
              as String,
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<StepModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionnaireModelImpl implements _QuestionnaireModel {
  const _$QuestionnaireModelImpl(
      {required this.version,
      required this.flowId,
      required final List<StepModel> steps})
      : _steps = steps;

  factory _$QuestionnaireModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionnaireModelImplFromJson(json);

  @override
  final int version;
  @override
  final String flowId;
  final List<StepModel> _steps;
  @override
  List<StepModel> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  String toString() {
    return 'QuestionnaireModel(version: $version, flowId: $flowId, steps: $steps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionnaireModelImpl &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.flowId, flowId) || other.flowId == flowId) &&
            const DeepCollectionEquality().equals(other._steps, _steps));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, version, flowId,
      const DeepCollectionEquality().hash(_steps));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionnaireModelImplCopyWith<_$QuestionnaireModelImpl> get copyWith =>
      __$$QuestionnaireModelImplCopyWithImpl<_$QuestionnaireModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionnaireModelImplToJson(
      this,
    );
  }
}

abstract class _QuestionnaireModel implements QuestionnaireModel {
  const factory _QuestionnaireModel(
      {required final int version,
      required final String flowId,
      required final List<StepModel> steps}) = _$QuestionnaireModelImpl;

  factory _QuestionnaireModel.fromJson(Map<String, dynamic> json) =
      _$QuestionnaireModelImpl.fromJson;

  @override
  int get version;
  @override
  String get flowId;
  @override
  List<StepModel> get steps;
  @override
  @JsonKey(ignore: true)
  _$$QuestionnaireModelImplCopyWith<_$QuestionnaireModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StepModel _$StepModelFromJson(Map<String, dynamic> json) {
  return _StepModel.fromJson(json);
}

/// @nodoc
mixin _$StepModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<QuestionModel> get questions => throw _privateConstructorUsedError;
  Map<String, dynamic>? get visibilityCondition =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StepModelCopyWith<StepModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepModelCopyWith<$Res> {
  factory $StepModelCopyWith(StepModel value, $Res Function(StepModel) then) =
      _$StepModelCopyWithImpl<$Res, StepModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      List<QuestionModel> questions,
      Map<String, dynamic>? visibilityCondition});
}

/// @nodoc
class _$StepModelCopyWithImpl<$Res, $Val extends StepModel>
    implements $StepModelCopyWith<$Res> {
  _$StepModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? questions = null,
    Object? visibilityCondition = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
      visibilityCondition: freezed == visibilityCondition
          ? _value.visibilityCondition
          : visibilityCondition // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StepModelImplCopyWith<$Res>
    implements $StepModelCopyWith<$Res> {
  factory _$$StepModelImplCopyWith(
          _$StepModelImpl value, $Res Function(_$StepModelImpl) then) =
      __$$StepModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      List<QuestionModel> questions,
      Map<String, dynamic>? visibilityCondition});
}

/// @nodoc
class __$$StepModelImplCopyWithImpl<$Res>
    extends _$StepModelCopyWithImpl<$Res, _$StepModelImpl>
    implements _$$StepModelImplCopyWith<$Res> {
  __$$StepModelImplCopyWithImpl(
      _$StepModelImpl _value, $Res Function(_$StepModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? questions = null,
    Object? visibilityCondition = freezed,
  }) {
    return _then(_$StepModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
      visibilityCondition: freezed == visibilityCondition
          ? _value._visibilityCondition
          : visibilityCondition // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StepModelImpl implements _StepModel {
  const _$StepModelImpl(
      {required this.id,
      required this.title,
      required final List<QuestionModel> questions,
      final Map<String, dynamic>? visibilityCondition})
      : _questions = questions,
        _visibilityCondition = visibilityCondition;

  factory _$StepModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StepModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  final List<QuestionModel> _questions;
  @override
  List<QuestionModel> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  final Map<String, dynamic>? _visibilityCondition;
  @override
  Map<String, dynamic>? get visibilityCondition {
    final value = _visibilityCondition;
    if (value == null) return null;
    if (_visibilityCondition is EqualUnmodifiableMapView)
      return _visibilityCondition;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'StepModel(id: $id, title: $title, questions: $questions, visibilityCondition: $visibilityCondition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            const DeepCollectionEquality()
                .equals(other._visibilityCondition, _visibilityCondition));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      const DeepCollectionEquality().hash(_questions),
      const DeepCollectionEquality().hash(_visibilityCondition));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StepModelImplCopyWith<_$StepModelImpl> get copyWith =>
      __$$StepModelImplCopyWithImpl<_$StepModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StepModelImplToJson(
      this,
    );
  }
}

abstract class _StepModel implements StepModel {
  const factory _StepModel(
      {required final String id,
      required final String title,
      required final List<QuestionModel> questions,
      final Map<String, dynamic>? visibilityCondition}) = _$StepModelImpl;

  factory _StepModel.fromJson(Map<String, dynamic> json) =
      _$StepModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  List<QuestionModel> get questions;
  @override
  Map<String, dynamic>? get visibilityCondition;
  @override
  @JsonKey(ignore: true)
  _$$StepModelImplCopyWith<_$StepModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) {
  return _QuestionModel.fromJson(json);
}

/// @nodoc
mixin _$QuestionModel {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get required => throw _privateConstructorUsedError;
  List<OptionModel>? get options => throw _privateConstructorUsedError;
  Map<String, dynamic>? get visibilityCondition =>
      throw _privateConstructorUsedError;
  String? get placeholder => throw _privateConstructorUsedError;
  int? get min => throw _privateConstructorUsedError;
  int? get max => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionModelCopyWith<QuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionModelCopyWith<$Res> {
  factory $QuestionModelCopyWith(
          QuestionModel value, $Res Function(QuestionModel) then) =
      _$QuestionModelCopyWithImpl<$Res, QuestionModel>;
  @useResult
  $Res call(
      {String id,
      String type,
      String title,
      bool required,
      List<OptionModel>? options,
      Map<String, dynamic>? visibilityCondition,
      String? placeholder,
      int? min,
      int? max});
}

/// @nodoc
class _$QuestionModelCopyWithImpl<$Res, $Val extends QuestionModel>
    implements $QuestionModelCopyWith<$Res> {
  _$QuestionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? required = null,
    Object? options = freezed,
    Object? visibilityCondition = freezed,
    Object? placeholder = freezed,
    Object? min = freezed,
    Object? max = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      required: null == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<OptionModel>?,
      visibilityCondition: freezed == visibilityCondition
          ? _value.visibilityCondition
          : visibilityCondition // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      placeholder: freezed == placeholder
          ? _value.placeholder
          : placeholder // ignore: cast_nullable_to_non_nullable
              as String?,
      min: freezed == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int?,
      max: freezed == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionModelImplCopyWith<$Res>
    implements $QuestionModelCopyWith<$Res> {
  factory _$$QuestionModelImplCopyWith(
          _$QuestionModelImpl value, $Res Function(_$QuestionModelImpl) then) =
      __$$QuestionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      String title,
      bool required,
      List<OptionModel>? options,
      Map<String, dynamic>? visibilityCondition,
      String? placeholder,
      int? min,
      int? max});
}

/// @nodoc
class __$$QuestionModelImplCopyWithImpl<$Res>
    extends _$QuestionModelCopyWithImpl<$Res, _$QuestionModelImpl>
    implements _$$QuestionModelImplCopyWith<$Res> {
  __$$QuestionModelImplCopyWithImpl(
      _$QuestionModelImpl _value, $Res Function(_$QuestionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? required = null,
    Object? options = freezed,
    Object? visibilityCondition = freezed,
    Object? placeholder = freezed,
    Object? min = freezed,
    Object? max = freezed,
  }) {
    return _then(_$QuestionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      required: null == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool,
      options: freezed == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<OptionModel>?,
      visibilityCondition: freezed == visibilityCondition
          ? _value._visibilityCondition
          : visibilityCondition // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      placeholder: freezed == placeholder
          ? _value.placeholder
          : placeholder // ignore: cast_nullable_to_non_nullable
              as String?,
      min: freezed == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int?,
      max: freezed == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionModelImpl implements _QuestionModel {
  const _$QuestionModelImpl(
      {required this.id,
      required this.type,
      required this.title,
      required this.required,
      final List<OptionModel>? options,
      final Map<String, dynamic>? visibilityCondition,
      this.placeholder,
      this.min,
      this.max})
      : _options = options,
        _visibilityCondition = visibilityCondition;

  factory _$QuestionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionModelImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String title;
  @override
  final bool required;
  final List<OptionModel>? _options;
  @override
  List<OptionModel>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _visibilityCondition;
  @override
  Map<String, dynamic>? get visibilityCondition {
    final value = _visibilityCondition;
    if (value == null) return null;
    if (_visibilityCondition is EqualUnmodifiableMapView)
      return _visibilityCondition;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? placeholder;
  @override
  final int? min;
  @override
  final int? max;

  @override
  String toString() {
    return 'QuestionModel(id: $id, type: $type, title: $title, required: $required, options: $options, visibilityCondition: $visibilityCondition, placeholder: $placeholder, min: $min, max: $max)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.required, required) ||
                other.required == required) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            const DeepCollectionEquality()
                .equals(other._visibilityCondition, _visibilityCondition) &&
            (identical(other.placeholder, placeholder) ||
                other.placeholder == placeholder) &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      title,
      required,
      const DeepCollectionEquality().hash(_options),
      const DeepCollectionEquality().hash(_visibilityCondition),
      placeholder,
      min,
      max);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionModelImplCopyWith<_$QuestionModelImpl> get copyWith =>
      __$$QuestionModelImplCopyWithImpl<_$QuestionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionModelImplToJson(
      this,
    );
  }
}

abstract class _QuestionModel implements QuestionModel {
  const factory _QuestionModel(
      {required final String id,
      required final String type,
      required final String title,
      required final bool required,
      final List<OptionModel>? options,
      final Map<String, dynamic>? visibilityCondition,
      final String? placeholder,
      final int? min,
      final int? max}) = _$QuestionModelImpl;

  factory _QuestionModel.fromJson(Map<String, dynamic> json) =
      _$QuestionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get title;
  @override
  bool get required;
  @override
  List<OptionModel>? get options;
  @override
  Map<String, dynamic>? get visibilityCondition;
  @override
  String? get placeholder;
  @override
  int? get min;
  @override
  int? get max;
  @override
  @JsonKey(ignore: true)
  _$$QuestionModelImplCopyWith<_$QuestionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OptionModel _$OptionModelFromJson(Map<String, dynamic> json) {
  return _OptionModel.fromJson(json);
}

/// @nodoc
mixin _$OptionModel {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OptionModelCopyWith<OptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionModelCopyWith<$Res> {
  factory $OptionModelCopyWith(
          OptionModel value, $Res Function(OptionModel) then) =
      _$OptionModelCopyWithImpl<$Res, OptionModel>;
  @useResult
  $Res call({String id, String text});
}

/// @nodoc
class _$OptionModelCopyWithImpl<$Res, $Val extends OptionModel>
    implements $OptionModelCopyWith<$Res> {
  _$OptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OptionModelImplCopyWith<$Res>
    implements $OptionModelCopyWith<$Res> {
  factory _$$OptionModelImplCopyWith(
          _$OptionModelImpl value, $Res Function(_$OptionModelImpl) then) =
      __$$OptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String text});
}

/// @nodoc
class __$$OptionModelImplCopyWithImpl<$Res>
    extends _$OptionModelCopyWithImpl<$Res, _$OptionModelImpl>
    implements _$$OptionModelImplCopyWith<$Res> {
  __$$OptionModelImplCopyWithImpl(
      _$OptionModelImpl _value, $Res Function(_$OptionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
  }) {
    return _then(_$OptionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptionModelImpl implements _OptionModel {
  const _$OptionModelImpl({required this.id, required this.text});

  factory _$OptionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OptionModelImplFromJson(json);

  @override
  final String id;
  @override
  final String text;

  @override
  String toString() {
    return 'OptionModel(id: $id, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionModelImplCopyWith<_$OptionModelImpl> get copyWith =>
      __$$OptionModelImplCopyWithImpl<_$OptionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionModelImplToJson(
      this,
    );
  }
}

abstract class _OptionModel implements OptionModel {
  const factory _OptionModel(
      {required final String id,
      required final String text}) = _$OptionModelImpl;

  factory _OptionModel.fromJson(Map<String, dynamic> json) =
      _$OptionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$OptionModelImplCopyWith<_$OptionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ConditionalLogicModel _$ConditionalLogicModelFromJson(
    Map<String, dynamic> json) {
  return _ConditionalLogicModel.fromJson(json);
}

/// @nodoc
mixin _$ConditionalLogicModel {
  String get showIf => throw _privateConstructorUsedError;
  String get field => throw _privateConstructorUsedError;
  dynamic get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConditionalLogicModelCopyWith<ConditionalLogicModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConditionalLogicModelCopyWith<$Res> {
  factory $ConditionalLogicModelCopyWith(ConditionalLogicModel value,
          $Res Function(ConditionalLogicModel) then) =
      _$ConditionalLogicModelCopyWithImpl<$Res, ConditionalLogicModel>;
  @useResult
  $Res call({String showIf, String field, dynamic value});
}

/// @nodoc
class _$ConditionalLogicModelCopyWithImpl<$Res,
        $Val extends ConditionalLogicModel>
    implements $ConditionalLogicModelCopyWith<$Res> {
  _$ConditionalLogicModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showIf = null,
    Object? field = null,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      showIf: null == showIf
          ? _value.showIf
          : showIf // ignore: cast_nullable_to_non_nullable
              as String,
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConditionalLogicModelImplCopyWith<$Res>
    implements $ConditionalLogicModelCopyWith<$Res> {
  factory _$$ConditionalLogicModelImplCopyWith(
          _$ConditionalLogicModelImpl value,
          $Res Function(_$ConditionalLogicModelImpl) then) =
      __$$ConditionalLogicModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String showIf, String field, dynamic value});
}

/// @nodoc
class __$$ConditionalLogicModelImplCopyWithImpl<$Res>
    extends _$ConditionalLogicModelCopyWithImpl<$Res,
        _$ConditionalLogicModelImpl>
    implements _$$ConditionalLogicModelImplCopyWith<$Res> {
  __$$ConditionalLogicModelImplCopyWithImpl(_$ConditionalLogicModelImpl _value,
      $Res Function(_$ConditionalLogicModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showIf = null,
    Object? field = null,
    Object? value = freezed,
  }) {
    return _then(_$ConditionalLogicModelImpl(
      showIf: null == showIf
          ? _value.showIf
          : showIf // ignore: cast_nullable_to_non_nullable
              as String,
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConditionalLogicModelImpl implements _ConditionalLogicModel {
  const _$ConditionalLogicModelImpl(
      {required this.showIf, required this.field, required this.value});

  factory _$ConditionalLogicModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConditionalLogicModelImplFromJson(json);

  @override
  final String showIf;
  @override
  final String field;
  @override
  final dynamic value;

  @override
  String toString() {
    return 'ConditionalLogicModel(showIf: $showIf, field: $field, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionalLogicModelImpl &&
            (identical(other.showIf, showIf) || other.showIf == showIf) &&
            (identical(other.field, field) || other.field == field) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, showIf, field, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConditionalLogicModelImplCopyWith<_$ConditionalLogicModelImpl>
      get copyWith => __$$ConditionalLogicModelImplCopyWithImpl<
          _$ConditionalLogicModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionalLogicModelImplToJson(
      this,
    );
  }
}

abstract class _ConditionalLogicModel implements ConditionalLogicModel {
  const factory _ConditionalLogicModel(
      {required final String showIf,
      required final String field,
      required final dynamic value}) = _$ConditionalLogicModelImpl;

  factory _ConditionalLogicModel.fromJson(Map<String, dynamic> json) =
      _$ConditionalLogicModelImpl.fromJson;

  @override
  String get showIf;
  @override
  String get field;
  @override
  dynamic get value;
  @override
  @JsonKey(ignore: true)
  _$$ConditionalLogicModelImplCopyWith<_$ConditionalLogicModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
