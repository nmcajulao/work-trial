import 'package:flutter/cupertino.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: const CupertinoActivityIndicator(),
    ));
  }
}
