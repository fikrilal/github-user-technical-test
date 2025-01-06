import 'package:equatable/equatable.dart';
import '../../../popular/domain/entities/user_entity.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object?> get props => [];
}

class AddFavoriteEvent extends FavoriteEvent {
  final UserEntity user;

  const AddFavoriteEvent(this.user);

  @override
  List<Object?> get props => [user];
}