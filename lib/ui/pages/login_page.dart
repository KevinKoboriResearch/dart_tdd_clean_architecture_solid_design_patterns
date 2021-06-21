import 'package:flutter/material.dart';

import '../../ui/components/component.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        icon: Icon(
                          Icons.email,
                          color: Theme.of(context).primaryColorLight,
                        ),
                        // errorText: 'error',
                      ),
                    
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        icon: Icon(
                          Icons.lock,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 32),
                    RaisedButton(
                      onPressed: null,
                      child: Text(
                        'Entrar'.toUpperCase(),
                      ),
                    ),
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
          ],
        ),
      ),
    );
  }
}
