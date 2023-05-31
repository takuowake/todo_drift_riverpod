// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoStateData {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isReadyData => throw _privateConstructorUsedError;
  List<TodoItemData> get todoItems => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoStateDataCopyWith<TodoStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoStateDataCopyWith<$Res> {
  factory $TodoStateDataCopyWith(
          TodoStateData value, $Res Function(TodoStateData) then) =
      _$TodoStateDataCopyWithImpl<$Res, TodoStateData>;
  @useResult
  $Res call({bool isLoading, bool isReadyData, List<TodoItemData> todoItems});
}

/// @nodoc
class _$TodoStateDataCopyWithImpl<$Res, $Val extends TodoStateData>
    implements $TodoStateDataCopyWith<$Res> {
  _$TodoStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isReadyData = null,
    Object? todoItems = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: null == isReadyData
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      todoItems: null == todoItems
          ? _value.todoItems
          : todoItems // ignore: cast_nullable_to_non_nullable
              as List<TodoItemData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoStateDataCopyWith<$Res>
    implements $TodoStateDataCopyWith<$Res> {
  factory _$$_TodoStateDataCopyWith(
          _$_TodoStateData value, $Res Function(_$_TodoStateData) then) =
      __$$_TodoStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isReadyData, List<TodoItemData> todoItems});
}

/// @nodoc
class __$$_TodoStateDataCopyWithImpl<$Res>
    extends _$TodoStateDataCopyWithImpl<$Res, _$_TodoStateData>
    implements _$$_TodoStateDataCopyWith<$Res> {
  __$$_TodoStateDataCopyWithImpl(
      _$_TodoStateData _value, $Res Function(_$_TodoStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isReadyData = null,
    Object? todoItems = null,
  }) {
    return _then(_$_TodoStateData(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: null == isReadyData
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      todoItems: null == todoItems
          ? _value._todoItems
          : todoItems // ignore: cast_nullable_to_non_nullable
              as List<TodoItemData>,
    ));
  }
}

/// @nodoc

class _$_TodoStateData implements _TodoStateData {
  _$_TodoStateData(
      {this.isLoading = false,
      this.isReadyData = false,
      final List<TodoItemData> todoItems = const []})
      : _todoItems = todoItems;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isReadyData;
  final List<TodoItemData> _todoItems;
  @override
  @JsonKey()
  List<TodoItemData> get todoItems {
    if (_todoItems is EqualUnmodifiableListView) return _todoItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todoItems);
  }

  @override
  String toString() {
    return 'TodoStateData(isLoading: $isLoading, isReadyData: $isReadyData, todoItems: $todoItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoStateData &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isReadyData, isReadyData) ||
                other.isReadyData == isReadyData) &&
            const DeepCollectionEquality()
                .equals(other._todoItems, _todoItems));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isReadyData,
      const DeepCollectionEquality().hash(_todoItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoStateDataCopyWith<_$_TodoStateData> get copyWith =>
      __$$_TodoStateDataCopyWithImpl<_$_TodoStateData>(this, _$identity);
}

abstract class _TodoStateData implements TodoStateData {
  factory _TodoStateData(
      {final bool isLoading,
      final bool isReadyData,
      final List<TodoItemData> todoItems}) = _$_TodoStateData;

  @override
  bool get isLoading;
  @override
  bool get isReadyData;
  @override
  List<TodoItemData> get todoItems;
  @override
  @JsonKey(ignore: true)
  _$$_TodoStateDataCopyWith<_$_TodoStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TempTodoItemData {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime? get limit => throw _privateConstructorUsedError;
  bool get isNotify => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TempTodoItemDataCopyWith<TempTodoItemData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TempTodoItemDataCopyWith<$Res> {
  factory $TempTodoItemDataCopyWith(
          TempTodoItemData value, $Res Function(TempTodoItemData) then) =
      _$TempTodoItemDataCopyWithImpl<$Res, TempTodoItemData>;
  @useResult
  $Res call({String title, String description, DateTime? limit, bool isNotify});
}

/// @nodoc
class _$TempTodoItemDataCopyWithImpl<$Res, $Val extends TempTodoItemData>
    implements $TempTodoItemDataCopyWith<$Res> {
  _$TempTodoItemDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? limit = freezed,
    Object? isNotify = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isNotify: null == isNotify
          ? _value.isNotify
          : isNotify // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TempTodoItemDataCopyWith<$Res>
    implements $TempTodoItemDataCopyWith<$Res> {
  factory _$$_TempTodoItemDataCopyWith(
          _$_TempTodoItemData value, $Res Function(_$_TempTodoItemData) then) =
      __$$_TempTodoItemDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description, DateTime? limit, bool isNotify});
}

/// @nodoc
class __$$_TempTodoItemDataCopyWithImpl<$Res>
    extends _$TempTodoItemDataCopyWithImpl<$Res, _$_TempTodoItemData>
    implements _$$_TempTodoItemDataCopyWith<$Res> {
  __$$_TempTodoItemDataCopyWithImpl(
      _$_TempTodoItemData _value, $Res Function(_$_TempTodoItemData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? limit = freezed,
    Object? isNotify = null,
  }) {
    return _then(_$_TempTodoItemData(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isNotify: null == isNotify
          ? _value.isNotify
          : isNotify // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TempTodoItemData implements _TempTodoItemData {
  _$_TempTodoItemData(
      {this.title = '',
      this.description = '',
      this.limit = null,
      this.isNotify = true});

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final DateTime? limit;
  @override
  @JsonKey()
  final bool isNotify;

  @override
  String toString() {
    return 'TempTodoItemData(title: $title, description: $description, limit: $limit, isNotify: $isNotify)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TempTodoItemData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.isNotify, isNotify) ||
                other.isNotify == isNotify));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, description, limit, isNotify);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TempTodoItemDataCopyWith<_$_TempTodoItemData> get copyWith =>
      __$$_TempTodoItemDataCopyWithImpl<_$_TempTodoItemData>(this, _$identity);
}

abstract class _TempTodoItemData implements TempTodoItemData {
  factory _TempTodoItemData(
      {final String title,
      final String description,
      final DateTime? limit,
      final bool isNotify}) = _$_TempTodoItemData;

  @override
  String get title;
  @override
  String get description;
  @override
  DateTime? get limit;
  @override
  bool get isNotify;
  @override
  @JsonKey(ignore: true)
  _$$_TempTodoItemDataCopyWith<_$_TempTodoItemData> get copyWith =>
      throw _privateConstructorUsedError;
}
