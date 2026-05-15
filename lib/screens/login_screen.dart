import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';
import '../widgets/phone_container.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String errorMessage = '';

  final String mockEmail = 'admin@flutter.com';
  final String mockPassword = '12345678';

  void clearFields() {
    emailController.clear();
    passwordController.clear();

    setState(() {
      errorMessage = '';
    });
  }

  void login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (!email.contains('@') || !email.contains('.com')) {
      setState(() {
        errorMessage = 'Digite um e-mail válido';
      });

      return;
    }

    if (password.length > 8) {
      setState(() {
        errorMessage = 'A senha deve ter no máximo 8 caracteres';
      });

      return;
    }

    if (email == mockEmail && password == mockPassword) {
      setState(() {
        errorMessage = '';
      });

      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );

      clearFields();
    } else {
      setState(() {
        errorMessage = 'E-mail ou senha incorretos';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: PhoneContainer(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),

                const Icon(
                  Icons.security,
                  size: 90,
                  color: AppColors.primary,
                ),

                const SizedBox(height: 20),

                const Text(
                  'Flutter Test Architecture',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Padronização de Testes Automatizados',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white70,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 50),

                CustomInput(
                  inputKey: const Key('email_input'),
                  label: 'E-mail',
                  icon: Icons.email,
                  controller: emailController,
                ),

                const SizedBox(height: 20),

                CustomInput(
                  inputKey: const Key('password_input'),
                  label: 'Senha',
                  icon: Icons.lock,
                  obscureText: true,
                  controller: passwordController,
                  maxLength: 8,
                ),

                const SizedBox(height: 15),

                if (errorMessage.isNotEmpty)
                  Text(
                    errorMessage,
                    style: const TextStyle(
                      color: Colors.redAccent,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                const SizedBox(height: 20),

                CustomButton(
                  buttonKey: const Key('login_button'),
                  text: 'ENTRAR',
                  onPressed: login,
                ),

                const SizedBox(height: 20),

                TextButton(
                  key: const Key('create_account_button'),
                  onPressed: () {},
                  child: const Text(
                    'Criar conta',
                    style: TextStyle(
                      color: AppColors.white70,
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}