import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui/neumorphic/theme/neumorphic_theme.dart';
import 'package:flutter_ui/neumorphic/theme/theme.dart';
import 'package:flutter_ui/neumorphic/widget/button.dart';

class NeumorphicCloseButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final NeumorphicStyle? style;
  final EdgeInsets? padding;

  const NeumorphicCloseButton({
    Key? key,
    this.onPressed,
    this.style,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nThemeIcons = NeumorphicTheme.of(context)!.current!.appBarTheme.icons;
    return NeumorphicButton(
      style: style,
      padding: padding,
      tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
      child: nThemeIcons.closeIcon,
      onPressed: onPressed ?? () => Navigator.maybePop(context),
    );
  }
}
