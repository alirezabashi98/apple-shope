import 'package:flutter/material.dart';

openPage(BuildContext context, Widget page) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
