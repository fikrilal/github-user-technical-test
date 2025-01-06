import '../../../popular/domain/entities/user_entity.dart';
import '../repositories/favorite_repository.dart';

class GetFavoritesUseCase {
  final FavoriteRepository repository;

  GetFavoritesUseCase(this.repository);

  Future<List<UserEntity>> call() => repository.getFavorites();
}