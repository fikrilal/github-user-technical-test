import '../../../_core/database/database_constant.dart';

class UserEntity {
  final String username;
  final int id;
  final String avatarUrl;
  final String htmlUrl;

  const UserEntity({
    required this.username,
    required this.id,
    required this.avatarUrl,
    required this.htmlUrl,
  });

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      username: map[DatabaseConstants.columnFavoriteUsername] as String,
      id: map[DatabaseConstants.columnFavoriteId] as int,
      avatarUrl: map[DatabaseConstants.columnFavoriteAvatarUrl] as String,
      htmlUrl: map[DatabaseConstants.columnFavoriteHtmlUrl] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseConstants.columnFavoriteId: id,
      DatabaseConstants.columnFavoriteUsername: username,
      DatabaseConstants.columnFavoriteAvatarUrl: avatarUrl,
      DatabaseConstants.columnFavoriteHtmlUrl: htmlUrl,
    };
  }
}
