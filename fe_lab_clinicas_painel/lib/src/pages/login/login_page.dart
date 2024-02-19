import 'package:fe_lab_clinicas_painel/src/pages/login/login_controller.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with MessageViewMixin {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final controller = Injector.get<LoginController>();

  void login() {
    final valid = formKey.currentState?.validate() ?? false;

    if (valid) {
      controller.login(emailEC.text.trim(), passwordEC.text.trim());
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailEC.dispose();
    passwordEC.dispose();
  }

  @override
  void initState() {
    super.initState();
    messageListener(controller);
    effect(() {
      if (controller.logged) {
        Navigator.of(context).pushReplacementNamed('/painel');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: sizeOf.height),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_login.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(40),
              constraints: BoxConstraints(maxWidth: sizeOf.width * .4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const Text(
                      "Login",
                      style: LabClinicasTheme.titleStyle,
                    ),
                    const SizedBox(height: 32),
                    TextFormField(
                      autofocus: true,
                      controller: emailEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('Email obrigatório'),
                        Validatorless.email('Email inválido')
                      ]),
                      decoration: const InputDecoration(
                        label: Text("Email"),
                      ),
                      onFieldSubmitted: (_) {
                        login();
                      },
                    ),
                    const SizedBox(height: 24),
                    Watch(
                      (_) {
                        return TextFormField(
                          obscureText: controller.obscurePassword,
                          controller: passwordEC,
                          validator:
                              Validatorless.required("Senha obrigatório"),
                          decoration: InputDecoration(
                            label: const Text("Password"),
                            suffix: IconButton(
                              onPressed: () {
                                controller.passwordToggle();
                              },
                              icon: controller.obscurePassword
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                            ),
                          ),
                          onFieldSubmitted: (_) {
                            login();
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: sizeOf.width * .8,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          login();
                        },
                        child: const Text('ENTRAR'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}