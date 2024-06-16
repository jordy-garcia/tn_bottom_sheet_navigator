import 'package:flutter/material.dart';
import 'package:tn_bottom_sheet_navigator/tn_bottom_sheet_navigator.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TnBottomSheetScaffold(
      appBar: const TnBottomSheetAppBar(
        title: 'Sign In',
        showCloseIcon: true,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _emailController,
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
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll<Color>(Colors.lightBlue),
                ),
                child: const Text(
                  'Signin',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            TextButton(
              child: const Text('Do you forgot your password?'),
              onPressed: () => context.tnRouter.push(
                'forgot-password',
                params: {
                  "email": _emailController.value.text,
                },
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              child: const Text('Does not have an account? Sign Up'),
              onPressed: () => context.tnRouter.push('signup'),
            ),
          ],
        ),
      ),
    );
  }
}
