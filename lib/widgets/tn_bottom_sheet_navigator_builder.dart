import 'package:flutter/material.dart';
import 'package:tn_bottom_sheet_navigator/core/entities/tn_bottom_sheet_route.dart';
import 'package:tn_bottom_sheet_navigator/extensions/tn_context_extensions.dart';

class TnBottomSheetNavigatorBuilder extends StatelessWidget {
  const TnBottomSheetNavigatorBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: StreamBuilder<TnBottomSheetRoute?>(
        stream: context.tnRouter.stream,
        builder: (context, state) {
          if (state.connectionState == ConnectionState.active) {
            final route = state.data!;
            return route.builder(
              context,
              route.params,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
