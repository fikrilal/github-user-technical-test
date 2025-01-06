import '../../../../popular/domain/entities/user_entity.dart';

class UserLocalModel {
  final int id;
  final String username;
  final String avatarUrl;
  final String htmlUrl;

  const UserLocalModel({
    required this.id,
    required this.username,
    required this.avatarUrl,
    required this.htmlUrl,
  });

  factory UserLocalModel.fromMap(Map<String, dynamic> map) {
    return UserLocalModel(
      id: map['id'] as int,
      username: map['username'] as String,
      avatarUrl: map['avatar_url'] as String,
      htmlUrl: map['html_url'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'avatar_url': avatarUrl,
      'html_url': htmlUrl,
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      username: username,
      avatarUrl: avatarUrl,
      htmlUrl: htmlUrl,
    );
  }

  factory UserLocalModel.fromEntity(UserEntity entity) {
    return UserLocalModel(
      id: entity.id,
      username: entity.username,
      avatarUrl: entity.avatarUrl,
      htmlUrl: entity.htmlUrl,
    );
  }
}
