/// A Calculator.
library;

export 'src/enemies_widget.dart';
export 'src/many_to_one_widget.dart';
export 'src/load_widget.dart';
import 'package:flutter/material.dart';

abstract class RelationWidget extends StatelessWidget {
  const RelationWidget({super.key});

  @override
  Widget build(BuildContext context);
}
