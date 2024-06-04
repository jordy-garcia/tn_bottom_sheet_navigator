import 'package:flutter/material.dart';
import 'package:tn_bottom_sheet_navigator/extensions/tn_context_extensions.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Forgot Password Page',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              label: Text('Email'),
            ),
            initialValue: email,
          ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: const Text('Reset Password')),
          TextButton(
            child: const Text('Signin'),
            onPressed: () => context.tnRouter.pop(),
          ),
        ],
      ),
    );
  }
}
