import '../../../domain/entities/user_detail_entity.dart';

class UserDetailLocalModel {
  final String username;
  final int id;
  final String avatarUrl;
  final String htmlUrl;
  final String? name;
  final String? company;
  final String? blog;
  final String? location;
  final String? email;
  final String? bio;
  final String? twitterUsername;
  final int publicRepos;
  final int publicGists;
  final int followers;
  final int following;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserDetailLocalModel({
    required this.username,
    required this.id,
    required this.avatarUrl,
    required this.htmlUrl,
    this.name,
    this.company,
    this.blog,
    this.location,
    this.email,
    this.bio,
    this.twitterUsername,
    required this.publicRepos,
    required this.publicGists,
    required this.followers,
    required this.following,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserDetailLocalModel.fromMap(Map<String, dynamic> map) {
    return UserDetailLocalModel(
      username: map['username'] as String,
      id: map['id'] as int,
      avatarUrl: map['avatar_url'] as String,
      htmlUrl: map['html_url'] as String,
      name: map['name'] as String?,
      company: map['company'] as String?,
      blog: map['blog'] as String?,
      location: map['location'] as String?,
      email: map['email'] as String?,
      bio: map['bio'] as String?,
      twitterUsername: map['twitter_username'] as String?,
      publicRepos: map['public_repos'] as int,
      publicGists: map['public_gists'] as int,
      followers: map['followers'] as int,
      following: map['following'] as int,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'id': id,
      'avatar_url': avatarUrl,
      'html_url': htmlUrl,
      'name': name,
      'company': company,
      'blog': blog,
      'location': location,
      'email': email,
      'bio': bio,
      'twitter_username': twitterUsername,
      'public_repos': publicRepos,
      'public_gists': publicGists,
      'followers': followers,
      'following': following,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  UserDetailEntity toEntity() {
    return UserDetailEntity(
      username: username,
      id: id,
      avatarUrl: avatarUrl,
      htmlUrl: htmlUrl,
      name: name,
      company: company,
      blog: blog,
      location: location,
      email: email,
      bio: bio,
      twitterUsername: twitterUsername,
      publicRepos: publicRepos,
      publicGists: publicGists,
      followers: followers,
      following: following,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory UserDetailLocalModel.fromEntity(UserDetailEntity entity) {
    return UserDetailLocalModel(
      username: entity.username,
      id: entity.id,
      avatarUrl: entity.avatarUrl,
      htmlUrl: entity.htmlUrl,
      name: entity.name,
      company: entity.company,
      blog: entity.blog,
      location: entity.location,
      email: entity.email,
      bio: entity.bio,
      twitterUsername: entity.twitterUsername,
      publicRepos: entity.publicRepos,
      publicGists: entity.publicGists,
      followers: entity.followers,
      following: entity.following,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
