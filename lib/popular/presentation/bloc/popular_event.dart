import 'package:equatable/equatable.dart';

abstract class PopularEvent extends Equatable {
  const PopularEvent();

  @override
  List<Object?> get props => [];
}

class FetchUsersEvent extends PopularEvent {
  final bool forceRefresh;

  const FetchUsersEvent({this.forceRefresh = false});

  @override
  List<Object?> get props => [forceRefresh];
}
