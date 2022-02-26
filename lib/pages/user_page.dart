
import 'package:flutter/material.dart';
import 'package:github_flutter/controllers/repo_controller.dart';
import 'package:github_flutter/models/repo_model.dart';
import 'package:github_flutter/models/user_model.dart';
import 'package:github_flutter/repositories/repo_repository_impl.dart';
import 'package:github_flutter/service/dio_service_impl.dart';
import 'package:github_flutter/widgets/user_widget.dart';

import '../widgets/repo_list_item_widget.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final RepoController _controller =
      RepoController(RepoRepositoryImpl(DioServiceImpl()));

  void initState() {
    _controller.getByUsername(widget.user.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.user.login)),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          UserWidget(user: widget.user),
          SizedBox(
            height: 20,
          ),
          Text(
            'Repos',
            style: Theme.of(context).textTheme.headline5,
          ),
          ValueListenableBuilder<List<Repo?>?>(
            valueListenable: _controller.repo,
            builder: (_, repo, __) {
              return repo!.isNotEmpty && repo != null
                  ? ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: repo.length,
                      itemBuilder: (context, index) => RepoListItemWidget(
                        repo: repo[index],
                      ),
                      separatorBuilder: (_, __) => Divider(),
                    )
                  : CircularProgressIndicator();
            },
          ),
        ])),
      ),
    );
  }
}
