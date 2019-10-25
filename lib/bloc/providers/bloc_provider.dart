// 1
import 'package:flutter/material.dart';

import '../bloc.dart';

/*
 BlocProvider is a generic class.
 The generic type T is scoped to be an object that implements the Bloc interface.
 This means that the provider can only store BLoC objects.
 */

class BlocProvider<T extends AbstractBloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  const BlocProvider({Key key, @required this.bloc, @required this.child})
      : super(key: key);

  // 2
  static T of<T extends AbstractBloc>(BuildContext context) {
    final type = _providerType<BlocProvider<T>>();
    final BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }

  // 3
  static Type _providerType<T>() => T;

  @override
  State createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProvider> {
  // 4
  @override
  Widget build(BuildContext context) => widget.child;

  // 5
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
