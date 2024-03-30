import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class AppState<T> with _$AppState<T> {
  const AppState._();

  const factory AppState.init() = _init<T>;
  const factory AppState.loading() = _loading;
  const factory AppState.success(final T data) = _success<T>;
  const factory AppState.error(final Exception exception) = _error;

  bool get isInit => maybeWhen(init: () => true, orElse: () => false);

  bool get isLoading => maybeWhen(loading: () => true, orElse: () => false);

  bool get isSuccess => maybeMap(success: (_) => true, orElse: () => false);

  bool get isError => maybeWhen(error: (_) => true, orElse: () => false);

  T? get data => maybeWhen(success: (data) => data, orElse: () => null);
}
