class UserDetailEntity {
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

  const UserDetailEntity({
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
}
