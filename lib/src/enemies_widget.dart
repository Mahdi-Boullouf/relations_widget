import 'package:flutter/widgets.dart';
import 'package:relation_widgets/relation_widgets.dart';

class EnemiesWidget extends RelationWidget {
  const EnemiesWidget({
    super.key,
    required this.firstWidget,
    required this.secondWidget,
    required this.showFirstWidgetWhen,
  });
  final Widget firstWidget;
  final Widget secondWidget;
  final bool Function() showFirstWidgetWhen;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      child: showFirstWidgetWhen()
          ? SizedBox(key: ValueKey(firstWidget.hashCode), child: firstWidget)
          : SizedBox(key: ValueKey(secondWidget.hashCode), child: secondWidget),
    );
  }
}
