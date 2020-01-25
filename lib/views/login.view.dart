import 'package:flutter/cupertino.dart';
import 'package:meuteste/controllers/account.controller.dart';
import 'package:meuteste/repositories/account.repository.dart';
import 'package:meuteste/stores/app.store.dart';
import 'package:meuteste/view-models/login.viewmodel.dart';
import 'package:meuteste/views/home.view.dart';
import 'package:meuteste/views/signup.view.dart';
import 'package:meuteste/widgets/activity-switcher.widget.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  AppStore _store;
  final _formKey = GlobalKey<FormState>();

  var viewModel = new LoginViewModel();
  var controller = new AccountController(new AccountRepository());

  navigate(page) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => page,
      ),
    );
  }

  showError(String message) {
    showCupertinoDialog(
      context: context,
      builder: (_) => new CupertinoAlertDialog(
        title: new Text("Falha no Login"),
        content: new Text(message),
        actions: <Widget>[
          CupertinoButton(
            child: Text('Fechar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  onSubmit() {
    setState(() {
      controller.login(viewModel).then((user) {
        if (user != null) {
          _store.setUser(user.name, user.email, user.picture);
          navigate(HomeView());
        } else
          showError("Usuário ou senha inválidos");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _store = Provider.of<AppStore>(context);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Autentique-se"),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 120,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CupertinoTextField(
                  placeholder: "E-mail",
                  padding: EdgeInsets.all(20),
                  keyboardType: TextInputType.emailAddress,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: viewModel.hasError("email")
                          ? Color(0xFFFF0000)
                          : Color(0xFF00FF00),
                    ),
                  ),
                  onChanged: (val) {
                    viewModel.email = val;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CupertinoTextField(
                  placeholder: "Senha",
                  padding: EdgeInsets.all(20),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: viewModel.hasError("password")
                          ? Color(0xFFFF0000)
                          : Color(0xFF00FF00),
                    ),
                  ),
                  onChanged: (val) {
                    viewModel.password = val;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ActivitySwitcher(
                busy: viewModel.busy,
                child: CupertinoButton.filled(
                  child: Text("Entrar"),
                  onPressed: onSubmit,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CupertinoButton(
                child: Text("Cadastrar"),
                onPressed: () {
                  navigate(SignupView());
                },
              ),
              viewModel.isValid() ? SizedBox() : errorsContainer(viewModel),
            ],
          ),
        ),
      ),
    );
  }
}

Widget errorsContainer(viewModel) {
  return Container(
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.all(20),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Color(0xFFFF0000).withOpacity(0.1),
      borderRadius: BorderRadius.circular(25),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "EXEMPLO DE VISUALIZAÇÃO DE ERROS",
          style: TextStyle(
            color: Color(0xFFFF0000),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(viewModel.getErrorsAsString()),
      ],
    ),
  );
}
