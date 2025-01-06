import '../../../popular/domain/entities/user_entity.dart';
import '../repositories/favorite_repository.dart';

class AddFavoriteUseCase {
  final FavoriteRepository repository;

  AddFavoriteUseCase(this.repository);

  Future<void> call(UserEntity user) => repository.addFavorite(user);
}