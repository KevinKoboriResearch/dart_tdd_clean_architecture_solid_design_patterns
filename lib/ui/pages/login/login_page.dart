import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/components.dart';

import 'components/components.dart';
import 'components/password_input.dart';
import 'login_presenter.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;

  const LoginPage({@required this.presenter});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _hideKeyboard() {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.presenter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          widget.presenter.isLoadingStream.listen((isLoading) {
            if (isLoading) {
              showLoading(context: context);
            } else {
              hideLoading(context: context);
            }
          });

          widget.presenter.mainErrorStream.listen((error) {
            if (error != null) {
              showErrorMessage(context: context, error: error);
            }
          });

          return GestureDetector(
            onTap: _hideKeyboard,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  LoginHeader(),
                  SizedBox(
                    height: 32,
                  ),
                  Headline1(text: 'Login'),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Provider(
                      create: (_) => widget.presenter,
                      child: Form(
                        child: Column(
                          children: [
                            EmailInput(),
                            SizedBox(height: 8),
                            PasswordInput(),
                            SizedBox(height: 32),
                            LoginButton(),
                            // ElevatedButton(
                            //   onPressed: () {},
                            //   child: Text(
                            //     'Entrar'.toUpperCase(),
                            //   ),
                            // ),
                            FlatButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.person),
                              label: Text('Criar Conta'),
                            )
                            // TextButton(
                            //   onPressed: () {},
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Icon(Icons.person),
                            //       SizedBox(
                            //         width: 8,
                            //       ),
                            //       Text('Criar Conta'),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
