import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class PhoneContainer extends StatelessWidget {
  final Widget child;

  const PhoneContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 700,
        decoration: BoxDecoration(
          color: AppColors.phoneContainer,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: Colors.white12,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}