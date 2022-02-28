import 'package:flutter/material.dart';
import 'package:github_flutter/models/user_model.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: CircleAvatar(
              backgroundImage: NetworkImage(user.avatarUrl ??
                  'https://www.globaltec.com.br/wp-content/uploads/2021/01/laptop-user-1-1179329.png'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            user.name,
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            user.login,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(
            height: 10,
          ),
          Visibility(
            visible: user.bio != null,
            child: Text(
              user.bio ?? ' -',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                child: const Icon(Icons.people),
                margin: const EdgeInsets.only(right: 10),
              ),
              Text(
                user.followers.toString() +
                    ' seguidores * ' +
                    user.following.toString() +
                    ' seguindo',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          Visibility(
            visible: user.company != null,
            child: Row(
              children: [
                Container(
                  child: const Icon(Icons.work),
                  margin: const EdgeInsets.only(right: 10),
                ),
                Text(
                  user.company ?? '',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
