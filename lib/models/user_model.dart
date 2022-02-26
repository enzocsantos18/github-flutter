class User {
  User({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.type,
    required this.name,
    required this.company,
    required this.blog,
    required this.bio,
    required this.publicRepos,
    required this.publicGists,
    required this.followers,
    required this.following,
  });
  late final String login;
  late final int id;
  late final String? nodeId;
  late final String? avatarUrl;
  late final String? gravatarId;
  late final String? url;
  late final String? type;
  late final String? name;
  late final String? company;
  late final String? blog;
  late final String? location;
  late final String? email;
  late final String? bio;
  late final int publicRepos;
  late final int publicGists;
  late final int followers;
  late final int following;
  late final String? createdAt;
  late final String? updatedAt;

  User.fromJson(Map<String, dynamic> json){
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    type = json['type'];
    name = json['name'];
    company = json['company'];
    blog = json['blog'];
    location = json['location'];
    email = json['email'];
    bio = json['bio'];
    publicRepos = json['public_repos'];
    publicGists = json['public_gists'];
    followers = json['followers'];
    following = json['following'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['login'] = login;
    _data['id'] = id;
    _data['node_id'] = nodeId;
    _data['avatar_url'] = avatarUrl;
    _data['gravatar_id'] = gravatarId;
    _data['url'] = url;
    _data['type'] = type;
    _data['name'] = name;
    _data['company'] = company;
    _data['blog'] = blog;
    _data['location'] = location;
    _data['email'] = email;
    _data['bio'] = bio;
    _data['public_repos'] = publicRepos;
    _data['public_gists'] = publicGists;
    _data['followers'] = followers;
    _data['following'] = following;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}