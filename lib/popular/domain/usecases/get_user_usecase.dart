import 'dart:developer';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class GetUsersUseCase {
  final UserRepository repository;

  GetUsersUseCase(this.repository);

  Future<List<UserEntity>> call({bool forceRefresh = false}) async {
    log('GetUsersUseCase: Starting to fetch users. Force refresh: $forceRefresh');
    try {
      final users = await repository.getUsers(forceRefresh: forceRefresh);
      log('GetUsersUseCase: Successfully fetched ${users.length} users.');
      return users;
    } catch (e) {
      log('GetUsersUseCase: Failed to fetch users. Error: $e', level: 3);
      rethrow;
    }
  }
}