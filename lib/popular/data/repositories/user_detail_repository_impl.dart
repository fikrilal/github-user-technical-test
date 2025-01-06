import '../../domain/entities/user_detail_entity.dart';
import '../datasources/local/user_detail_local_datasource.dart';
import '../datasources/remote/user_detail_remote_datasource.dart';
import '../models/local/user_detail_local_model.dart';

class UserDetailRepository {
  final UserDetailRemoteDataSource remoteDataSource;
  final UserDetailLocalDataSource localDataSource;

  UserDetailRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  Future<UserDetailEntity> getUserDetail(String username, {bool forceRefresh = false}) async {
    if (forceRefresh) {
      final remoteUserDetail = await remoteDataSource.fetchUserDetail(username);
      await localDataSource.cacheUserDetail(
        UserDetailLocalModel.fromEntity(remoteUserDetail.toEntity()),
      );
      return remoteUserDetail.toEntity();
    } else {
      final localUserDetail = await localDataSource.getCachedUserDetail(username.hashCode);
      if (localUserDetail != null) {
        return localUserDetail.toEntity();
      } else {
        final remoteUserDetail = await remoteDataSource.fetchUserDetail(username);
        await localDataSource.cacheUserDetail(
          UserDetailLocalModel.fromEntity(remoteUserDetail.toEntity()),
        );
        return remoteUserDetail.toEntity();
      }
    }
  }
}
