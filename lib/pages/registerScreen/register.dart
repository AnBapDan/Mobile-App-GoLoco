// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors
import 'package:flutter/material.dart';
import 'utils/registerButton.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({
    super.key,
  });
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController checkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(37, 202, 240, 248),
                  blurRadius: 25.0,
                ),
              ],
              shape: BoxShape.rectangle,
              color: Color.fromARGB(71, 0, 180, 216),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.49,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Registo',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 0, 0, MediaQuery.of(context).size.height * 0.05),
                  ),
                  Form(
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          cursorColor: Color.fromARGB(255, 0, 0, 0),
                          cursorWidth: 1,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            enabled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            hintText: '',
                            labelText: 'Nome',
                            labelStyle: Theme.of(context).textTheme.headline3,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo Obrigatorio';
                            }
                            bool valid =
                                RegExp("^([ \u00c0-\u01ffa-zA-Z'\-])+\$")
                                    .hasMatch(value.toString());
                            if (!valid) {
                              return 'O nome nao deve conter caracteres especiais nem numeros';
                            } else {
                              return null;
                            }
                          },
                        ),
                        space(context),
                        TextFormField(
                          controller: emailController,
                          cursorColor: Color.fromARGB(255, 0, 0, 0),
                          cursorWidth: 1,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            enabled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            labelText: 'Email',
                            labelStyle: Theme.of(context).textTheme.headline3,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo Obrigatorio';
                            }
                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value.toString());
                            if (!emailValid) {
                              return 'Email invalido. Verifique novamente';
                            } else {
                              return null;
                            }
                          },
                        ),
                        space(context),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          cursorColor: Color.fromARGB(255, 0, 0, 0),
                          cursorWidth: 1,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            enabled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            labelText: 'Password',
                            labelStyle: Theme.of(context).textTheme.headline3,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo Obrigatorio';
                            }
                            return null;
                          },
                        ),
                        space(context),
                        TextFormField(
                          controller: checkController,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          cursorColor: Color.fromARGB(255, 0, 0, 0),
                          cursorWidth: 1,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            enabled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            labelText: 'Confirmar password',
                            labelStyle: Theme.of(context).textTheme.headline3,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo Obrigatorio';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: RegisterButton(
          //TODO ARGS NOT PASSING
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          check: checkController.text,
        ),
      ),
    );
  }

  Padding space(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0, 0, 0, MediaQuery.of(context).size.height * 0.01),
    );
  }
}
