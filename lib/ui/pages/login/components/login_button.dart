import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:for_dev/ui/pages/pages.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);
    return StreamBuilder<bool>(
      stream: presenter.isFormValidStream,
      builder: (context, snapshot) {
        return RaisedButton(
          onPressed: snapshot.data == true ? presenter.auth : null,
          child: Text(
            'Entrar'.toUpperCase(),
          ),
        );
      },
    );
  }
}
