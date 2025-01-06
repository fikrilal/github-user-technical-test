import 'dart:developer';

import '../../../../_core/data/models/local/user_remote_model.dart';
import '../../../../_core/network/api_helper.dart';

abstract class UserRemoteDataSource {
  Future<List<UserRemoteModel>> fetchUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiHelper apiHelper;

  UserRemoteDataSourceImpl(this.apiHelper);

  @override
  Future<List<UserRemoteModel>> fetchUsers() async {
    try {
      final response = await apiHelper.getRequest('/search/users', queryParams: {
        'q': 'followers:>=1000',
        'sort': 'followers',
        'order': 'desc',
      });
      log('API Response: ${response.data}', name: 'UserRemoteDataSource');
      final List<dynamic> items = response.data['items'];
      return items.map((json) => UserRemoteModel.fromJson(json)).toList();
    } catch (e) {
      log('Error fetching users: $e', name: 'UserRemoteDataSource', level: 3);
      rethrow;
    }
  }
}
