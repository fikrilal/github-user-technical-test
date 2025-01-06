import '../../../domain/entities/user_detail_entity.dart';

class UserDetailRemoteModel {
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

  const UserDetailRemoteModel({
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

  factory UserDetailRemoteModel.fromJson(Map<String, dynamic> json) {
    return UserDetailRemoteModel(
      username: json['login'] as String,
      id: json['id'] as int,
      avatarUrl: json['avatar_url'] as String,
      htmlUrl: json['html_url'] as String,
      name: json['name'] as String?,
      company: json['company'] as String?,
      blog: json['blog'] as String?,
      location: json['location'] as String?,
      email: json['email'] as String?,
      bio: json['bio'] as String?,
      twitterUsername: json['twitter_username'] as String?,
      publicRepos: json['public_repos'] as int,
      publicGists: json['public_gists'] as int,
      followers: json['followers'] as int,
      following: json['following'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
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
}
