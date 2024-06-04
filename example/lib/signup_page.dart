import 'package:flutter/material.dart';
import 'package:tn_bottom_sheet_navigator/extensions/tn_context_extensions.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Signup Page',
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
          TextFormField(
            decoration: const InputDecoration(
              label: Text('Confirm Password'),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: const Text('Signup')),
          TextButton(
            child: const Text('Signin'),
            onPressed: () => context.tnRouter.pop(),
          ),
        ],
      ),
    );
  }
}
