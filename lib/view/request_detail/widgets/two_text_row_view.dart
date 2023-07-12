import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class TwoTextRowView extends StatelessWidget {
  String title;
  String value;
  TwoTextRowView({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title : ",
          style: ConfigStyle.regularStyle(14, APP_THEME_COLOR),
        ),
        Text(
          value,
          style: ConfigStyle.regularStyle(14, BLACK_LIGHT),
        ),
      ],
    );
  }
}
