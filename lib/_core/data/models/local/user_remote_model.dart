import '../../../../popular/domain/entities/user_entity.dart';

class UserRemoteModel {
  final String username;
  final int id;
  final String avatarUrl;
  final String htmlUrl;

  const UserRemoteModel({
    required this.username,
    required this.id,
    required this.avatarUrl,
    required this.htmlUrl,
  });

  factory UserRemoteModel.fromJson(Map<String, dynamic> json) {
    return UserRemoteModel(
      username: json['login'] as String,
      id: json['id'] as int,
      avatarUrl: json['avatar_url'] as String,
      htmlUrl: json['html_url'] as String,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      username: username,
      id: id,
      avatarUrl: avatarUrl,
      htmlUrl: htmlUrl,
    );
  }
}
