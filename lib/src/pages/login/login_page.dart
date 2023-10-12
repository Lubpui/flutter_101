import 'package:flutter/material.dart';
import 'package:flutter_101/src/pages/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  int _count = 0;

  @override
  void initState() {
    super.initState();
    _usernameController.text = 'adminasda';
    _passwordController.text = '1234';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Pageasdasd'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.cyan[50],
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ..._buildTextField(),
                  const SizedBox(height: 18),
                  ..._buildButton(),
                  Row(
                    children: [
                      Text('Debug: $_count'),
                      IconButton(
                        onPressed: () {
                          setState(() => _count++);
                        },
                        icon: const Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() => _count--);
                        },
                        icon: const Icon(Icons.remove),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleClickLogin() {
    Navigator.pushNamed(context, AppRoute.home);
  }

  void _handleClickRegister() {
    Navigator.pushNamed(context, AppRoute.register);
  }

  void _handleClickReset() {
    _usernameController.text = '';
    _passwordController.text = '';
  }

  _buildTextField() {
    return [
      TextField(
        controller: _usernameController,
        decoration: const InputDecoration(labelText: 'Username'),
      ),
      TextField(
        controller: _passwordController,
        decoration: const InputDecoration(labelText: 'Password'),
      )
    ];
  }

  _buildButton() {
    return [
      ElevatedButton(
        onPressed: _handleClickLogin,
        child: const Text('SignIn'),
      ),
      OutlinedButton(
        onPressed: _handleClickRegister,
        child: const Text('Register'),
      ),
      OutlinedButton(
        onPressed: _handleClickReset,
        child: const Text('Reset'),
      )
    ];
  }
}
