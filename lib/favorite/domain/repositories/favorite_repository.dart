import '../../../popular/domain/entities/user_entity.dart';
import '../../data/datasources/local/favorite_local_datasource.dart';

class FavoriteRepository {
  final FavoriteLocalDataSource localDataSource;

  FavoriteRepository(this.localDataSource);

  Future<void> addFavorite(UserEntity user) => localDataSource.addFavorite(user);

  Future<void> removeFavorite(int id) => localDataSource.removeFavorite(id);

  Future<List<UserEntity>> getFavorites() => localDataSource.getFavorites();

  Future<bool> isFavorite(int id) => localDataSource.isFavorite(id);
}
