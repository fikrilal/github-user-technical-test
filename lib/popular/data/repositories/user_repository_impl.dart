import 'dart:developer';
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
    log('UserRepositoryImpl: Fetching users. Force refresh: $forceRefresh');
    try {
      if (forceRefresh) {
        return _fetchFromRemoteAndCache();
      } else {
        log('UserRepositoryImpl: Fetching users from local data source.');
        final localUsers = await localDataSource.getCachedUsers();
        if (localUsers.isEmpty) {
          log('UserRepositoryImpl: Local cache is empty. Fetching from remote.');
          return _fetchFromRemoteAndCache();
        }
        log('UserRepositoryImpl: Successfully fetched ${localUsers.length} users from local database.');
        return localUsers.map((local) => local.toEntity()).toList();
      }
    } catch (e) {
      log('UserRepositoryImpl: Failed to fetch users. Error: $e', level: 3);
      rethrow;
    }
  }

  Future<List<UserEntity>> _fetchFromRemoteAndCache() async {
    log('UserRepositoryImpl: Fetching users from remote data source.');
    final remoteUsers = await remoteDataSource.fetchUsers();
    log('UserRepositoryImpl: Successfully fetched ${remoteUsers.length} users from remote.');
    log('UserRepositoryImpl: Caching remote users to local database.');
    await localDataSource.cacheUsers(
      remoteUsers.map((remote) => UserLocalModel.fromEntity(remote.toEntity())).toList(),
    );
    log('UserRepositoryImpl: Successfully cached remote users.');
    return remoteUsers.map((remote) => remote.toEntity()).toList();
  }
}