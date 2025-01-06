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
      final List<dynamic> items = response.data['items'];
      return items.map((json) => UserRemoteModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
