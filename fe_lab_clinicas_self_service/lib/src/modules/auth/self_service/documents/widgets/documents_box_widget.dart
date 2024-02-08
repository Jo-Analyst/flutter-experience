// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class DocumentsBoxWidget extends StatelessWidget {
  final bool uploaded;
  final Widget icon;
  final String label;
  final int totalFiles;
  final VoidCallback? onTap;

  const DocumentsBoxWidget({
    super.key,
    required this.uploaded,
    required this.icon,
    required this.label,
    required this.totalFiles,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final totalFileLabel = totalFiles > 0 ? '($totalFiles)' : '';

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: uploaded ? LabClinicasTheme.lightOrangeColor : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: LabClinicasTheme.orangeColor,
            ),
          ),
          child: Column(
            children: [
              Expanded(child: icon),
              Text(
                '$label $totalFileLabel',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: LabClinicasTheme.orangeColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
