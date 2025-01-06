import '../../data/repositories/user_detail_repository_impl.dart';
import '../entities/user_detail_entity.dart';

class GetUserDetailUseCase {
  final UserDetailRepository repository;

  GetUserDetailUseCase(this.repository);

  Future<UserDetailEntity> call(String username, {bool forceRefresh = false}) {
    return repository.getUserDetail(username, forceRefresh: forceRefresh);
  }
}