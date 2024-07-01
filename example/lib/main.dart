import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tn_bottom_sheet_navigator/tn_bottom_sheet_navigator.dart';

import 'bottom_sheet_pages/forgot_password_page.dart';
import 'bottom_sheet_pages/signin_page.dart';
import 'bottom_sheet_pages/signup_page.dart';

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
      builder: (_, __) => SignInPage(),
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        primaryColor: Colors.lightBlue,
      ),
      home: const AppContent(),
    );
  }
}

class AppContent extends StatelessWidget {
  const AppContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TnBottomSheetNavigator')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Open Bottom Sheet Navigator'),
              onPressed: () => context.showTnBottomSheetNav(
                'signin',
                settings: const TnBottomSheetSettings(
                  isDismisable: true,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Custom Implementations',
                style: TextStyle(
                  fontSize: 20,
                )),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Cupertino Dialog'),
              onPressed: () => showCupertinoDialog(
                context: context,
                builder: (context) => const CupertinoAlertDialog(
                  content: Material(
                    color: Colors
                        .transparent, // This avoid an strange look on background of dialog
                    child: TnNavigatorBuilder(initialPath: 'signin'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Dialog'),
              onPressed: () => showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  content: Material(
                    color: Colors
                        .transparent, // This avoid an strange look on background of dialog
                    child: TnNavigatorBuilder(initialPath: 'signin'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
