import 'package:flutter/material.dart';
import 'package:tn_bottom_sheet_navigator/extensions/tn_context_extensions.dart';
import 'package:tn_bottom_sheet_navigator/widgets/tn_bottom_sheet_appbar_theme.dart';

/// {@template TnBottomSheetAppBar}
/// Creates a TnBottomSheetAppBar
/// {@endtemplate}
class TnBottomSheetAppBar extends StatelessWidget {
  const TnBottomSheetAppBar({
    super.key,
    this.showCloseIcon = false,
    this.customTitle,
    this.title,
    this.theme,
  });

  /// {@template TnBottomSheetAppBar_showCloseIcon}
  /// Controls whether we should display a close icon
  ///
  /// if true the closeIcon is displayed and it closes the TnBottomSheetNavigator
  /// no matter if the dismissable prop was set as false
  /// {@endtemplate}
  final bool showCloseIcon;

  /// {@template TnBottomSheetAppBar_customTitle}
  /// Creates a custom title Widget
  ///
  /// if [TnBottomSheetAppBar.title] is not null the [TnBottomSheetAppBar.customTitle]
  /// won't be displayed, the [TnBottomSheetAppBar.title] has priority
  /// {@endtemplate}
  final Widget? customTitle;

  /// {@template TnBottomSheetAppBar_title}
  /// String title
  /// {@endtemplate}
  final String? title;

  /// {@template TnBottomSheetAppBar_theme}
  /// Creates a theme for [TnBottomSheetAppBar]
  ///
  /// if [TnBottomSheetAppBar.theme] is not provided it will use the
  /// default theme
  /// {@endtemplate}
  final TnBottomSheetAppBarTheme? theme;

  @override
  Widget build(BuildContext context) {
    final appBarTheme = theme ?? const TnBottomSheetAppBarTheme();

    return Padding(
      padding: appBarTheme.padding,
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: context.tnRouter.canPop
                ? BackButton(
                    key: const Key('tn_bottom_sheet_appbar_backbutton'),
                    onPressed: () => context.tnRouter.pop(),
                  )
                : const SizedBox.shrink(),
          ),
          Expanded(
            flex: 2,
            child: _buildAppBarTitle(context, theme: appBarTheme),
          ),
          SizedBox(
            width: 40,
            child: showCloseIcon
                ? IconButton(
                    key: const Key('tn_bottom_sheet_appbar_closeicon'),
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.close,
                      size: appBarTheme.closeIconSize,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarTitle(
    BuildContext context, {
    required TnBottomSheetAppBarTheme theme,
  }) {
    if (title != null) {
      return Center(
        key: const Key('tn_bottom_sheet_appbar_title'),
        child: Text(
          title!,
          style: theme.titleTextStyle,
          textAlign: TextAlign.center,
        ),
      );
    }

    if (customTitle != null) {
      return customTitle!;
    }

    return const SizedBox.shrink();
  }
}
