import 'package:equatable/equatable.dart';
import 'package:flutter_demo_project/api/bloc/base_state.dart';
import 'package:flutter_demo_project/core/theme/app_theme.dart';

abstract interface class ApiState extends Equatable
    with AppTheme
    implements BaseState {
  const ApiState();
  @override
  List<Object> get props => [];
}

final class ApiInitial extends ApiState {}

final class ApiSuccess extends ApiState {
  final dynamic data;
  const ApiSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

final class ApiLoading extends ApiState {}

final class ApiError extends ApiState {
  final String errorMessage;
  const ApiError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class ApiConnectionError extends ApiState {
  final String connectionErrorMessage;
  const ApiConnectionError({
    this.connectionErrorMessage = 'No internet connection',
  });

  @override
  List<Object> get props => [connectionErrorMessage];
}
