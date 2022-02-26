import 'package:flutter/material.dart';
import 'package:github_flutter/models/user_model.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
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
              backgroundImage: NetworkImage(
                  user.avatarUrl ?? ''),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            user.name ?? '',
            style: Theme
                .of(context)
                .textTheme
                .headline4,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            user.login,
            style: Theme
                .of(context)
                .textTheme
                .subtitle1,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            user.bio ?? '',
            style: Theme
                .of(context)
                .textTheme
                .bodyText1,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(child: Icon(Icons.people), margin: EdgeInsets.only(right: 10),),
              Text(
                user.followers.toString() + ' seguidores * ' +
                    user.following.toString() + ' seguindo',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              ),
            ],
          ),
          Row(
            children: [
              Container(child: Icon(Icons.work), margin: EdgeInsets.only(right: 10),),
              Text(
                user.company ?? '',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
