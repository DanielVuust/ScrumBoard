import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LinkWidget extends StatelessWidget {
  final Function()? onClick;
  final String? linkText;
  final Decoration? decoratedBox;
  const LinkWidget({super.key, required this.onClick, required this.linkText, this.decoratedBox});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoratedBox,
      child: GestureDetector(
        onTap: onClick,
        child: Text(linkText ?? "null"),
      ),
    );
  }
}
