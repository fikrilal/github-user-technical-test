import '../../../../_core/network/api_helper.dart';
import '../../models/remote/user_detail_remote_model.dart';

class UserDetailRemoteDataSource {
  final ApiHelper apiHelper;

  UserDetailRemoteDataSource(this.apiHelper);

  Future<UserDetailRemoteModel> fetchUserDetail(String username) async {
    try {
      final response = await apiHelper.getRequest('/users/$username');
      return UserDetailRemoteModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
