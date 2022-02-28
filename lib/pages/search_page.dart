import 'package:flutter/material.dart';
import 'package:github_flutter/controllers/user_controller.dart';
import 'package:github_flutter/pages/user_page.dart';
import 'package:github_flutter/repositories/user_repository_impl.dart';
import 'package:github_flutter/service/dio_service_impl.dart';

import '../models/user_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final UserController _controller =
      UserController(UserRepositoryImpl(DioServiceImpl()));

  late TextEditingController userTextController;

  bool _isButtonActive = false;

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
      const snackBar = SnackBar(
        content: Text('Não foi possível encontrar o usuário'),
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
        body: SizedBox(
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
            const SizedBox(height: 40),
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text('Usuário')),
              controller: userTextController,
            ),
            ElevatedButton(
                onPressed: _isButtonActive ? _handleSearch : null,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [Text('Pesquisar'), Icon(Icons.search)]))
          ],
        ),
      ),
    ));
  }
}
