import 'package:flutter/material.dart';
import 'package:tn_bottom_sheet_navigator/tn_bottom_sheet_navigator.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return TnBottomSheetScaffold(
      appBar: const TnBottomSheetAppBar(
        title: 'Forgot Password',
        showCloseIcon: true,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Email'),
              ),
              initialValue: email,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll<Color>(Colors.lightBlue),
              ),
              child: const Text(
                'Reset Password',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
