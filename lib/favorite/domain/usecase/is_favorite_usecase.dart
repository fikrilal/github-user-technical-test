import '../repositories/favorite_repository.dart';

class IsFavoriteUseCase {
  final FavoriteRepository repository;

  IsFavoriteUseCase(this.repository);

  Future<bool> call(int id) => repository.isFavorite(id);
}