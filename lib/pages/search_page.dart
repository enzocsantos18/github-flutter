import 'package:flutter/material.dart';
import 'package:github_flutter/controllers/user_controller.dart';
import 'package:github_flutter/pages/user_page.dart';
import 'package:github_flutter/repositories/user_repository_impl.dart';
import 'package:github_flutter/service/dio_service_impl.dart';
import 'package:github_flutter/widgets/user_widget.dart';

import '../models/user_model.dart';
import '../widgets/repo_list_item_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController userTextController;

  bool _isButtonActive = false;

  final UserController _controller =
      UserController(UserRepositoryImpl(DioServiceImpl()));

  @override
  void initState() {
    super.initState();

    userTextController = TextEditingController();

    userTextController.addListener(() {
      final isButtonActive = userTextController.text.isNotEmpty;
      setState(() {
        _isButtonActive = isButtonActive;
      });
    });
  }

  _handleSearch() async {
    await _controller.getByName(userTextController.text);
    User? user = _controller.user.value;

    if (user == null) {
      final snackBar = SnackBar(
        content: const Text('Não foi possível encontrar o usuário'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => UserPage(user: user)));
    }

    userTextController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 150,
                width: 150,
                child: Image.asset('assets/github.png')),
            Text(
              'Github Flutter',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text('Usuário')),
              controller: userTextController,
            ),
            ElevatedButton(
                onPressed: _isButtonActive ? _handleSearch : null,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Pesquisar'), Icon(Icons.search)]))
          ],
        ),
      ),
    ));
  }
}
