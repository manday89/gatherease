import 'package:flutter/material.dart';
//import 'package:gatherease/homepage.dart';
import 'package:gatherease/registration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF52796F),
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/gatherease.png',
              width: 231,
              height: 66.77,
              alignment: Alignment.topCenter,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
              ),
              margin: const EdgeInsets.only(top: 100),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      _buildUsernameField(),
                      const SizedBox(height: 20),
                      _buildPasswordField(),
                      const SizedBox(height: 5),
                      _buildRememberMeCheckbox(),
                      const SizedBox(height: 20),
                      _buildLoginButton(context),
                      const SizedBox(height: 50),
                      _buildRegistrationPrompt(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUsernameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Username', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 2),
        Container(
          width: double.infinity,
          height: 51,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 2, color: Color(0xFF818181)),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: const TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Enter your Username',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Password', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 2),
        Container(
          width: double.infinity,
          height: 51,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 2, color: Color(0xFF818181)),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: const TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Enter your Password',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Row(
      children: [
        Checkbox(
          value: rememberMe,
          onChanged: (value) {
            setState(() {
              rememberMe = value!;
            });
          },
        ),
        const Text('Remember Me'),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/home');
        },
        child: const Text(
          'Login',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xFF52796F)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }

  Widget _buildRegistrationPrompt(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegistrationPage()),
        );
      },
      child: const Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Tidak memiliki akun? ',
              style: TextStyle(color: Color(0xFF818181), fontSize: 14),
            ),
            TextSpan(
              text: 'Registrasi di sini.',
              style: TextStyle(color: Color(0xFF52796F), fontSize: 14),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
