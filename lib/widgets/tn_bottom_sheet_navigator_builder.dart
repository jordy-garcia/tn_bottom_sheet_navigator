import 'package:flutter/material.dart';
import 'package:tn_bottom_sheet_navigator/extensions/tn_context_extensions.dart';

/// {@template TnBottomSheetNavigatorBuilder}
/// Widget for route builder inside the ModalBottomSheet
/// {@endtemplate}
class TnBottomSheetNavigatorBuilder extends StatelessWidget {
  const TnBottomSheetNavigatorBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: StreamBuilder<List<Widget>>(
        stream: context.tnRouter.stream,
        builder: (context, state) {
          if (state.hasData && state.data!.isNotEmpty) {
            final widgets = state.data!;
            final activeIndex = widgets.length - 1;

            return IndexedStack(
              index: activeIndex,
              children: widgets
                  .asMap()
                  .keys
                  .map(
                    (i) => SizedBox(
                      height: i == activeIndex ? null : 1,
                      child: widgets[i],
                    ),
                  )
                  .toList(),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
