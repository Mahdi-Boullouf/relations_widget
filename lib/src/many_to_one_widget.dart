import 'package:flutter/material.dart';
import 'package:relation_widgets/relation_widgets.dart';

class ManyToOneWidget extends RelationWidget {
  const ManyToOneWidget({super.key, required this.conditionalChildren});
  final List<ConditionalElement> conditionalChildren;
  @override
  Widget build(BuildContext context) {
    if (conditionalChildren.isEmpty) {
      assert(false, 'conditionalChildren must not be empty');
      return const SizedBox.shrink();
    }
    if (!conditionalChildren.any((element) => element.showWhen())) {
      assert(
        false,
        'conditionalChildren must have at least one element that showWhen is true',
      );
      return const SizedBox.shrink();
    }
    if (conditionalChildren.where((element) => element.showWhen()).length > 1) {
      assert(
        false,
        'Only one element in conditionalChildren can have showWhen set to true',
      );
      return const SizedBox.shrink();
    }

    final element = conditionalChildren.firstWhere(
      (element) => element.showWhen(),
    );
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      child: element.child,
    );
  }
}

class ConditionalElement {
  const ConditionalElement({required this.showWhen, required this.child});
  final bool Function() showWhen;
  final Widget child;
}
