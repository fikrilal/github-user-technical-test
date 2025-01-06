import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class GetUsersUseCase {
  final UserRepository repository;

  GetUsersUseCase(this.repository);

  Future<List<UserEntity>> call({bool forceRefresh = false}) {
    return repository.getUsers(forceRefresh: forceRefresh);
  }
}