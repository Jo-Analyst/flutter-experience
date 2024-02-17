import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_painel/src/pages/painel/widgets/painel_principal_widget.dart';
import 'package:flutter/material.dart';

class PainelPage extends StatelessWidget {
  const PainelPage({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: LabClinicasAppBar(),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
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
          ],
        ),
      ),
    );
  }
}
