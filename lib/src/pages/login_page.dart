// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_101/src/bloc/total_courses/total_courses_bloc.dart';
import 'package:flutter_101/src/routes/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLogin = false;
  bool _isSecurePassword = true;

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _isLogin = prefs.getBool('isLogin') ?? false;
    });

    if (_isLogin == true) {
      Navigator.pushNamed(context, AppRoute.navigationMenu);
    }
  }

  void setIsLogin(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      prefs.setBool('isLogin', value);
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
    _usernameController.text = '1630901039';
    _passwordController.text = '1234';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // title
                ..._buildLogoHeader(),
                SizedBox(height: 10),

                // text field
                _buildInputTextFeilds(
                  'Student Id: 1630901039',
                  _usernameController,
                ),
                SizedBox(height: 15),
                _buildInputTextFeilds(
                  'Password: 1234',
                  _passwordController,
                  isPrassword: true,
                ),

                SizedBox(height: 20),

                //button
                ..._buildButton(),
                SizedBox(height: 50),

                //devider section
                ..._buildDeviderSection(),
                SizedBox(height: 50),

                //sigin with google
                _buildGoogleButtonSection(),
                SizedBox(height: 50),

                //link to register
                _buildRegisterButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildLogoHeader() {
    return [
      Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Lottie.network(
              'https://lottie.host/4986869b-03be-4639-a335-dd2d930ad5de/AYSEK57mls.json',
            ),
          ),
          Positioned(
            bottom: 5,
            child: Text(
              'LOGIN',
              style:
                  TextStyle(color: Color.fromRGBO(39, 46, 61, 1), fontSize: 50),
            ),
          )
        ],
      ),
    ];
  }

  Widget _buildInputTextFeilds(
      String hintText, TextEditingController controller,
      {isPrassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: isPrassword ? _buildSecurePassword() : null,
            border: InputBorder.none,
            hintText: hintText,
          ),
          obscureText: isPrassword && _isSecurePassword,
        ),
      ),
    );
  }

  Widget _buildSecurePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecurePassword = !_isSecurePassword;
        });
      },
      icon: Icon(_isSecurePassword ? Icons.visibility_off : Icons.visibility),
    );
  }

  _buildButton() {
    return [
      BlocBuilder<TotalCoursesBloc, TotalCoursesState>(
        builder: (context, state) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(36, 45, 61, 1),
              minimumSize: Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            onPressed: () {
              if (_usernameController.text == '1630901039' &&
                  _passwordController.text == '1234') {
                setIsLogin(true);
                if (state.courses.code == '') {
                  Navigator.pushNamed(context, AppRoute.totalCoursesPage);
                } else {
                  Navigator.pushNamed(context, AppRoute.navigationMenu);
                }
              }
            },
            child: Text(
              'Sign In',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          );
        },
      ),
    ];
  }

  _buildDeviderSection() {
    return [
      Row(
        children: [
          Expanded(child: Divider(color: Colors.grey[500])),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Or continue with',
              style: TextStyle(color: Colors.grey[500]),
            ),
          ),
          Expanded(child: Divider(color: Colors.grey[500])),
        ],
      ),
    ];
  }

  _buildGoogleButtonSection() {
    final grayscaleMatrix = <double>[
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.matrix(grayscaleMatrix),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                padding: EdgeInsets.all(10),
                child: Image.asset('lib/images/google_logo.png'),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            ColorFiltered(
              colorFilter: ColorFilter.matrix(grayscaleMatrix),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                padding: EdgeInsets.all(5),
                child: Image.asset('lib/images/github_logo.png'),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            'Cooming Soon...',
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        )
      ],
    );
  }

  _buildRegisterButton() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Not a member?',
              style: TextStyle(color: Colors.grey[500]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Register now'),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            'Cooming Soon...',
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        )
      ],
    );
  }
}
