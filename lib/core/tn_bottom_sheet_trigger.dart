import 'package:flutter/material.dart';
import 'package:tn_bottom_sheet_navigator/core/entities/tn_bottom_sheet_settings.dart';
import 'package:tn_bottom_sheet_navigator/extensions/tn_context_extensions.dart';
import 'package:tn_bottom_sheet_navigator/widgets/tn_bottom_sheet_navigator_builder.dart';

Future<T?> showTnBottomSheetNavigator<T>({
  required BuildContext context,
  required String initialPath,
  Map<String, dynamic>? params,
  TnBottomSheetSettings settings = const TnBottomSheetSettings(),
}) async {
  if (context.tnRouter.isOpened) {
    return Future.value();
  }

  final router = context.tnRouter
    ..initialize()
    ..go(initialPath, params: params);

  final response = await showModalBottomSheet(
    context: context,
    isScrollControlled: settings.isScrollControlled,
    useRootNavigator: settings.useRootNavigator,
    isDismissible: settings.isDismisable,
    enableDrag: settings.isDismisable,
    constraints: settings.constraints ??
        BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * .9,
        ),
    builder: (context) => PopScope(
      canPop: settings.isDismisable && router.canPop,
      onPopInvoked: (_) {
        if (router.canPop) {
          router.pop();
          return;
        }
      },
      child: const TnBottomSheetNavigatorBuilder(),
    ),
  );

  router.dispose();
  return response;
}
