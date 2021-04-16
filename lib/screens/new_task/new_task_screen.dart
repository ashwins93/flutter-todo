import 'package:flutter/material.dart';

import 'components/body.dart';

class NewTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: CloseIconButton(),
      ),
      body: Body(),
    );
  }
}

class CloseIconButton extends StatelessWidget {
  const CloseIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.grey[300]!),
            shape: BoxShape.circle),
        alignment: Alignment.center,
        child: IconButton(
            color: Colors.grey[600],
            icon: Icon(
              Icons.close,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
