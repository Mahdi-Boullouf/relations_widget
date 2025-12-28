import 'package:flutter/material.dart';
import 'package:relation_widgets/relation_widgets.dart';

class LoadWidget extends RelationshipWidget {
  const LoadWidget({
    super.key,
    required this.loadStatus,
    required this.hasError,
    required this.loadingWidget,
    required this.loadedWidget,
    required this.errorWidget,
  });
  final LoadStatus loadStatus;
  final bool hasError;

  final Widget loadingWidget;
  final Widget loadedWidget;
  final Widget errorWidget;
  @override
  Widget build(BuildContext context) {
    assert(
      loadStatus == LoadStatus.loading && !hasError,
      "Has error must be false when load status is loading",
    );
    return ManyToOneWidget(
      conditionalChildren: [
        ConditionalElement(
          showWhen: () => loadStatus == LoadStatus.loading,
          child: loadingWidget,
        ),
        ConditionalElement(
          showWhen: () => loadStatus != LoadStatus.loaded && hasError,
          child: errorWidget,
        ),
        ConditionalElement(
          showWhen: () => loadStatus == LoadStatus.loaded && !hasError,
          child: loadedWidget,
        ),
      ],
    );
  }
}

enum LoadStatus { loading, loaded }
