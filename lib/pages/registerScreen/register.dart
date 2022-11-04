// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors
import 'package:cm_project/pages/registerScreen/utils/format_field.dart';
import 'package:flutter/material.dart';
import 'utils/registerButton.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({
    super.key,
  });
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Divider(
                color: Color.fromARGB(255, 202, 225, 229),
                height: 70,
                thickness: 3,
              ),
              Text(
                'Registo',
                style: Theme.of(context).textTheme.headline1,
              ),
              space(context),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      cursorColor: Color.fromARGB(255, 255, 255, 255),
                      cursorWidth: 1,
                      decoration: formatTextField(context, 'Nome'),

                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return 'Campo Obrigatorio';
                      //   }
                      //   bool valid = RegExp("^([ \u00c0-\u01ffa-zA-Z'\-])+\$")
                      //       .hasMatch(value.toString());
                      //   if (!valid) {
                      //     return 'O nome nao deve conter caracteres especiais nem numeros';
                      //   } else {
                      //     return null;
                      //   }
                      // },
                    ),
                    space(context),
                    TextField(
                      controller: emailController,
                      cursorColor: Color.fromARGB(255, 255, 255, 255),
                      cursorWidth: 1,
                      decoration: formatTextField(context, 'Email'),
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return 'Campo Obrigatorio';
                      //   }
                      //   bool emailValid = RegExp(
                      //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      //       .hasMatch(value.toString());
                      //   if (!emailValid) {
                      //     return 'Email invalido. Verifique novamente';
                      //   } else {
                      //     return null;
                      //   }
                      // },
                    ),
                    space(context),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      cursorColor: Color.fromARGB(255, 255, 255, 255),
                      cursorWidth: 1,
                      decoration: formatTextField(context, 'Password'),
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return 'Campo Obrigatorio';
                      //   }
                      //   return null;
                      // },
                    ),
                  ],
                ),
              ),
              Divider(
                color: Color.fromARGB(255, 202, 225, 229),
                height: 70,
                thickness: 3,
              ),
              RegisterButton(
                //TODO ARGS NOT PASSING
                name: nameController.toString(),
                email: emailController.text,
                password: passwordController.text,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding space(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0, 0, 0, MediaQuery.of(context).size.height * 0.03),
    );
  }
}
