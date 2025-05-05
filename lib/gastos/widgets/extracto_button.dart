import 'package:eclub/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExtractoButton extends StatelessWidget {
  const ExtractoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: () {
          context.pushNamed('movimientos');
        },
        child: const Text(
          'Ver Extracto',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
