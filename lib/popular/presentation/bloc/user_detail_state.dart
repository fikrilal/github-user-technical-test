import 'package:equatable/equatable.dart';

import '../../domain/entities/user_detail_entity.dart';

abstract class UserDetailState extends Equatable {
  const UserDetailState();

  @override
  List<Object?> get props => [];
}

class UserDetailInitial extends UserDetailState {}

class UserDetailLoading extends UserDetailState {}

class UserDetailLoaded extends UserDetailState {
  final UserDetailEntity userDetail;

  const UserDetailLoaded(this.userDetail);

  @override
  List<Object?> get props => [userDetail];
}

class UserDetailError extends UserDetailState {
  final String message;

  const UserDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
