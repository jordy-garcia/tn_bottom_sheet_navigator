import 'package:flutter/material.dart';
import 'package:tn_bottom_sheet_navigator/extensions/tn_context_extensions.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Signin Page',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              label: Text('Email'),
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              label: Text('Password'),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: const Text('Signin')),
          TextButton(
            child: const Text('Create an account'),
            onPressed: () => context.tnRouter.push('signup'),
          ),
          TextButton(
            child: const Text('Do you forgot your password?'),
            onPressed: () => context.tnRouter.push(
              'forgot-password',
              params: {"email": "test@email.com"},
            ),
          ),
        ],
      ),
    );
  }
}
