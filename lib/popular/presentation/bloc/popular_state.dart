import 'package:equatable/equatable.dart';
import '../../domain/entities/user_entity.dart';

abstract class PopularState extends Equatable {
  const PopularState();

  @override
  List<Object?> get props => [];
}

class PopularInitial extends PopularState {}

class PopularLoading extends PopularState {}

class PopularLoaded extends PopularState {
  final List<UserEntity> users;

  const PopularLoaded(this.users);

  @override
  List<Object?> get props => [users];
}

class PopularError extends PopularState {
  final String message;

  const PopularError(this.message);

  @override
  List<Object?> get props => [message];
}
