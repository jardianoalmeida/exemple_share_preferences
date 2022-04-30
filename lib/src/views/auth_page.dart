import 'dart:developer';

import 'package:exemple_share_preferences/src/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../widgets/buttom/buttom/buttom_widget.dart';
import '../widgets/text_form_field/text_form_field.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends ModularState<AuthPage, AuthController> {
  @override
  void initState() {
    controller.isAuth().then((status) {
      if (status) {
        Modular.to.pushNamed('/webview', arguments: {
          'login': controller.login,
          'senha': controller.senha,
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormFieldWidget(
                    label: 'Login',
                    onChanged: (login) {
                      controller.setLogin(login);
                    },
                  ),
                  const SizedBox(height: 20.0),
                  TextFormFieldWidget(
                    label: 'Senha',
                    onChanged: (senha) {
                      controller.setSenha(senha);
                    },
                  ),
                  const SizedBox(height: 20.0),
                  ButtomWidget(
                    onPressed: () {
                      controller.executeLogin();
                    },
                    text: 'ENTRAR',
                  )
                ],
              ),
            );
          }),
    );
  }
}
