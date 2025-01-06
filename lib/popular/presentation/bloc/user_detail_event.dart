import 'package:equatable/equatable.dart';

abstract class UserDetailEvent extends Equatable {
  const UserDetailEvent();

  @override
  List<Object?> get props => [];
}

class FetchUserDetailEvent extends UserDetailEvent {
  final String username;

  const FetchUserDetailEvent(this.username);

  @override
  List<Object?> get props => [username];
}