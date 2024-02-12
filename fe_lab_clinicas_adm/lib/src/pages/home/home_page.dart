import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validatorless/validatorless.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  final deskEC = TextEditingController();

  @override
  void dispose() {
    deskEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicasAppBar(),
      body: Form(
        key: formKey,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(40),
            width: sizeOf.width * .4,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LabClinicasTheme.orangeColor),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Bem vindo!',
                  style: LabClinicasTheme.titleStyle,
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Preencha o número de guichê que você está atendendo',
                  // textAlign: TextAlign.center,
                  style: LabClinicasTheme.subtitleSmallStyle,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: deskEC,
                  decoration: const InputDecoration(
                    label: Text('Número do guichê'),
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: Validatorless.multiple(
                    [
                      Validatorless.required('Guichê obrigatório'),
                      Validatorless.number('Guichê deve ser número')
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Chamar próximo paciente'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
