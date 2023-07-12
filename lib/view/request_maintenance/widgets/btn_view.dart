// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/core_config/config_color.dart';
import '../../../core/core_config/config_style.dart';

class BtnView extends StatelessWidget {
  String btnName;
  Function onTouch;

  BtnView({
    super.key,
    required this.btnName,
    required this.onTouch,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: () {
          onTouch();
        },
        child: Chip(
          labelPadding: const EdgeInsets.symmetric(horizontal: 30),
          backgroundColor: LOGIN_BUTTON_COLOR,
          label: Text(
            btnName,
            style: ConfigStyle.regularStyle(14, MATERIAL_COLOR),
          ),
        ),
      ),
    );
  }
}
