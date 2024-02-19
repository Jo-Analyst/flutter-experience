// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class PainelPrincipalWidget extends StatelessWidget {
  final String passwordLabel;
  final String password;
  final String deskNumber;
  final Color labelColor;
  final Color buttonColor;

  const PainelPrincipalWidget({
    Key? key,
    required this.passwordLabel,
    required this.password,
    required this.deskNumber,
    required this.labelColor,
    required this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: LabClinicasTheme.orangeColor,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            passwordLabel,
            style: LabClinicasTheme.titleSmallStyle.copyWith(
              color: labelColor,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: buttonColor,
            ),
            child: Text(
              password,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Guichê',
            style: LabClinicasTheme.titleSmallStyle.copyWith(
              color: labelColor,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: buttonColor,
            ),
            child: Text(
              deskNumber,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
