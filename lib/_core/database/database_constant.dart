class DatabaseConstants {
  static const String databaseName = 'github_users.db';
  static const int databaseVersion = 1;

  // Table: users (list of users)
  static const String tableUsers = 'users';
  static const String columnId = 'id';
  static const String columnUsername = 'username';
  static const String columnAvatarUrl = 'avatar_url';
  static const String columnHtmlUrl = 'html_url';

  // Table: user_details (detail of a single user)
  static const String tableUserDetails = 'user_details';
  static const String columnName = 'name';
  static const String columnCompany = 'company';
  static const String columnBlog = 'blog';
  static const String columnLocation = 'location';
  static const String columnEmail = 'email';
  static const String columnBio = 'bio';
  static const String columnTwitterUsername = 'twitter_username';
  static const String columnPublicRepos = 'public_repos';
  static const String columnPublicGists = 'public_gists';
  static const String columnFollowers = 'followers';
  static const String columnFollowing = 'following';
  static const String columnCreatedAt = 'created_at';
  static const String columnUpdatedAt = 'updated_at';
}