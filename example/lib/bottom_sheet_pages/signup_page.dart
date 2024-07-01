import 'package:flutter/material.dart';
import 'package:tn_bottom_sheet_navigator/tn_bottom_sheet_navigator.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TnBottomSheetScaffold(
      appBar: const TnBottomSheetAppBar(title: "Sign Up", showCloseIcon: true),
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
            ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll<Color>(Colors.lightBlue),
              ),
              child: const Text(
                'Signup',
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
