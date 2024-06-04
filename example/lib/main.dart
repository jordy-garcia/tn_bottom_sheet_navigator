import 'package:flutter/material.dart';
import 'package:tn_bottom_sheet_navigator/core/entities/tn_bottom_sheet_route.dart';
import 'package:tn_bottom_sheet_navigator/core/tn_router.dart';
import 'package:tn_bottom_sheet_navigator/extensions/tn_context_extensions.dart';

import 'forgot_password_page.dart';
import '../signin_page.dart';
import '../signup_page.dart';

void main() {
  TnRouter().setRoutes([
    TnBottomSheetRoute(
      path: 'forgot-password',
      builder: (context, params) => ForgotPasswordPage(
        email: params['email'],
      ),
    ),
    TnBottomSheetRoute(
      path: 'signin',
      builder: (_, __) => const SignInPage(),
    ),
    TnBottomSheetRoute(
      path: 'signup',
      builder: (_, __) => const SignUpPage(),
    ),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TnBottomSheetNavigator Sample',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('TnBottomSheetNavigator')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: const Text('Open Bottom Sheet Navigator'),
                onPressed: () => context.showTnBottomSheetNav('signin'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
