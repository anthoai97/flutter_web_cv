import 'package:flutter/material.dart';
import 'package:my_cv_web/resource/colors.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _sectionList(context),
    );
  }

  Widget _sectionList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Text(
          'ERROR: 404\n\n\nPAGE NOT FOUND!',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: ColorsDef.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
