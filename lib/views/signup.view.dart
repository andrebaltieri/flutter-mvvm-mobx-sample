import 'package:flutter/cupertino.dart';
import 'package:meuteste/controllers/account.controller.dart';
import 'package:meuteste/repositories/account.repository.dart';
import 'package:meuteste/view-models/signup.viewmodel.dart';
import 'package:meuteste/views/login.view.dart';
import 'package:meuteste/widgets/activity-switcher.widget.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();

  var viewModel = new SignupViewModel();
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
      controller.signup(viewModel).then((res) {
        if (res)
          navigate(LoginView());
        else
          showError("Cadastro inválido");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cadastre-se"),
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
                  placeholder: "Nome",
                  padding: EdgeInsets.all(20),
                  keyboardType: TextInputType.text,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: viewModel.hasError("name")
                          ? Color(0xFFFF0000)
                          : Color(0xFF00FF00),
                    ),
                  ),
                  onChanged: (val) {
                    viewModel.name = val;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CupertinoTextField(
                  placeholder: "CPF",
                  padding: EdgeInsets.all(20),
                  keyboardType: TextInputType.number,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: viewModel.hasError("document")
                          ? Color(0xFFFF0000)
                          : Color(0xFF00FF00),
                    ),
                  ),
                  onChanged: (val) {
                    viewModel.document = val;
                  },
                ),
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
                  child: Text("Cadastrar"),
                  onPressed: onSubmit,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CupertinoButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => LoginView(),
                    ),
                  );
                },
              ),
              viewModel.isValid()
                  ? SizedBox()
                  : Container(
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
                            "Não foi possível realizar seu cadastro",
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
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
