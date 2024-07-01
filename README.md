# TnBottomSheetNavigator

[![Pub](https://img.shields.io/pub/v/tn_bottom_sheet_navigator.svg?logo=flutter&color=blue&style=flat-square)](https://pub.dev/packages/tn_bottom_sheet_navigator)

This plugin allows Flutter apps to handle internal navigation inside a modal bottom sheet with adjustable height based on the content.

<img src="https://raw.githubusercontent.com/jordy-garcia/tn_bottom_sheet_navigator/main/images/sample.gif">

## Platform Support

| Android | iOS |
| :-----: | :-: |
|   ✅    | ✅  |

## Requirements

- Flutter >=3.3.0
- Dart >=2.18.0 <4.0.0

## Usage

### Initialize

You need to initialize the routes that should be consumed inside the modal bottom sheet. You must do it in the main file, before runApp is executed.

```dart

final bottomSheetRoutes = [
    TnBottomSheetRoute(
        path: 'signin',
        builder: (context, params) => const SignInPage(),
    ),
    TnBottomSheetRoute(
        path: 'signup',
        builder: (context, params) => const SignUpPage(),
    ),
    TnBottomSheetRoute(
        path: 'forgot-password',
        builder: (context, params) => ForgotPasswordPage(
            email: params['email'],
        ),
    ),
];

void main() {
    TnRouter()..setRoutes(bottomSheetRoutes);
    runApp(app);
}
```

### Show Modal Bottom Sheet Navigator

Once you have set up the routes that are going to be consumed inside the modal bottom sheet navigator, you're able to open the bottom sheet.

To open the bottom sheet navigator you'll have to run the following code.

```dart
void _onOpenBottomNav(BuildContext context) {
    showTnBottomSheetNavigator(context, initialPath: 'signin');
}
```

Or using the BuildContext extensions

```dart
void _onOpenBottomNav(BuildContext context) {
    context.showTnBottomSheetNav('signin');
}
```

This will open the modal bottom sheet navigator with default settings (TnBottomSheetSettings) and no params for initial path. In the pages consumed inside the bottom sheet navigator you can use the following methods to handle internal navigation.

For TnBottomSheetSettings the options are:

```dart
TnBottomSheetSettings(
    bool isDismisable = false,
    bool isScrollControlled = true,
    bool useRootNavigator = true,
    BoxConstraints? constraints,
)
```

### Navigation

```dart
# Push -> Add new route in the stack
context.tnPush('signup');

# Go -> Clear navigation stack
context.tnGo('signup');

# Pop -> Removes last route in the stack
context.tnPop();
```

### Navigation with parameters

You can send params on the navigation, you'll have to use the params property, which receives a Map<String, dynamic> object.

```dart
context.tnPush('forgot-password', params: { 'email': 'test@email.com' });

# Open bottom nav on initialPath with params
context.showTnBottomSheetNav('forgot-password', params: { 'email': 'test@email.com' });
```

### TnBottomSheetScaffold

You can use our custom scaffold to have an implicit navigation control

```dart
return TnBottomSheetScaffold(
    appBar: TnBottomSheetAppBar(title: 'Sign in'),
    child: Container(...),
);
```

This will return an scaffold and a TnBottomSheetAppBar which will show the arrow back if the router can pop.

You can customize the TnBottomSheetAppBar with the following props:

```dart
TnBottomSheetAppBar(
    title: // String title
    customTitle: // Widget for custom title (if you need an image or something more complex that just a string). If String title is passed customTitle won't be displayed
    showCloseIcon: // Bool to controls whether to show or not a close icon (This can close the bottomSheet no matter what dismissable value was passed in props)
    theme: // TnBottomSheetAppBarTheme to customize the style of some of the elements of the TnBottomSheetAppBar
)
```

For the TnBottomSheetAppBarTheme you can customize the following props:

```dart
TnBottomSheetAppBarTheme(
    closeIconSize: // Icon size for closeIcon button
    titleTextTyle: // TextStyle for String title
    padding: // TnBottomSheetAppBar padding
)
```

### Custom Implementation (TnNavigatorBuilder)

You can use the _TnNavigatorBuilder_ for a custom implementation, if you need the navigation
inside a Dialog or somewhere else, this builder is for you.

```dart
TnNavigatorBuilder(
    initialPath: 'signin',
    params: {"key": "param"},
),
```

This builder is going to render the pages starting by the _initialPath_ passed in the props. You can implemented in a dialog just like this:

```dart
showDialog(
    context: context,
    builder: (context) => const AlertDialog(
        content: Material(
            color: Colors.transparent, // This avoid an strange look on background of dialog
            child: TnNavigatorBuilder(initialPath: 'signin'),
        ),
    ),
);
```

Or for a CupertinoDialog:

```dart
showCupertinoDialog(
    context: context,
    builder: (context) => const CupertinoAlertDialog(
        content: Material(
            color: Colors.transparent, // This avoid an strange look on background of dialog
            child: TnNavigatorBuilder(initialPath: 'signin'),
        ),
    ),
);
```
