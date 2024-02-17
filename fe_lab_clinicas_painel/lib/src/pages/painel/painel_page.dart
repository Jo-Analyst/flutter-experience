import 'dart:js_util';

import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_painel/src/pages/painel/widgets/painel_principal_widget.dart';
import 'package:fe_lab_clinicas_painel/src/pages/painel/widgets/password_tile.dart';
import 'package:flutter/material.dart';

class PainelPage extends StatelessWidget {
  const PainelPage({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: LabClinicasAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: sizeOf.width * .4,
                    child: const PainelPrincipalWidget(
                      passwordLabel: 'Senha Anterior',
                      password: 'JC 1990',
                      deskNumber: '3',
                      labelColor: LabClinicasTheme.orangeColor,
                      buttonColor: LabClinicasTheme.blueColor,
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .4,
                    child: const PainelPrincipalWidget(
                      passwordLabel: 'Chamando Senha',
                      password: 'VF 1986',
                      deskNumber: '3',
                      labelColor: LabClinicasTheme.blueColor,
                      buttonColor: LabClinicasTheme.orangeColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Divider(color: LabClinicasTheme.orangeColor),
              const SizedBox(height: 30),
              const Text(
                'Últimos chamados',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: LabClinicasTheme.orangeColor,
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 2),
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    PasswordTile(),
                    PasswordTile(),
                    PasswordTile(),
                    PasswordTile(),
                    PasswordTile(),
                    PasswordTile(),
                    PasswordTile(),
                    PasswordTile(),
                    PasswordTile(),
                    PasswordTile(),
                    PasswordTile(),
                    PasswordTile(),
                    PasswordTile(),
                    PasswordTile(),
                    PasswordTile(),
                    PasswordTile(),
                    PasswordTile(),
                    PasswordTile(),
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
