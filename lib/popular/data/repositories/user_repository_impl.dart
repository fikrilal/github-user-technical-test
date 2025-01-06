import '../../../_core/data/models/remote/user_local_model.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/local/user_local_datasource.dart';
import '../datasources/remote/user_remote_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<UserEntity>> getUsers({bool forceRefresh = false}) async {
    if (forceRefresh) {
      final remoteUsers = await remoteDataSource.fetchUsers();
      await localDataSource.cacheUsers(
        remoteUsers.map((remote) => UserLocalModel.fromEntity(remote.toEntity())).toList(),
      );
      return remoteUsers.map((remote) => remote.toEntity()).toList();
    } else {
      final localUsers = await localDataSource.getCachedUsers();
      return localUsers.map((local) => local.toEntity()).toList();
    }
  }
}