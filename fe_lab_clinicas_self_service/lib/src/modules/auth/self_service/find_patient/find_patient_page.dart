import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/auth/self_service/self_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:validatorless/validatorless.dart';

class FindPatientPage extends StatefulWidget {
  const FindPatientPage({super.key});

  @override
  State<FindPatientPage> createState() => _FindPatientPageState();
}

class _FindPatientPageState extends State<FindPatientPage> {
  final selfServiceController = Injector.get<SelfServiceController>();
  final formkey = GlobalKey<FormState>();
  final documentEC = TextEditingController();

  @override
  void dispose() {
    documentEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LabClinicasAppBar(
        actions: [
          PopupMenuButton(
            child: const IconPopupMenuWidget(),
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 1,
                  child: Text("Reiniciar processo"),
                ),
              ];
            },
            onSelected: (value) async {},
          )
        ],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        var sizeOf = MediaQuery.sizeOf(context);
        return SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_login.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(40),
                width: sizeOf.width * .8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Image.asset('assets/images/logo_vertical.png'),
                      const SizedBox(height: 48),
                      TextFormField(
                        validator: Validatorless.required('CPF obrigatório'),
                        controller: documentEC,
                        decoration: const InputDecoration(
                          label: Text(
                            "Digite o CPF do paciente",
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          const Text(
                            'Não sabe o CPF do paciente',
                            style: TextStyle(
                              fontSize: 14,
                              color: LabClinicasTheme.blueColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Clique aqui',
                              style: TextStyle(
                                color: LabClinicasTheme.orangeColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: sizeOf.width * .8,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            final valid =
                                formkey.currentState?.validate() ?? false;

                            if (valid) {}
                          },
                          child: const Text('Continuar'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
