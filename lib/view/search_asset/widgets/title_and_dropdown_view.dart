// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/view/search_asset/widgets/dropdown_view.dart';
import 'package:flutter/material.dart';

class TitleAndDropDownView extends StatelessWidget {
  String title;
  Function(String?) onChange;
  Function onEditingComplete;
  bool isSerialNo;
  TitleAndDropDownView({
    super.key,
    required this.title,
    required this.onChange,
    required this.onEditingComplete,
    this.isSerialNo = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: ConfigStyle.regularStyle(
            14,
            BLACK_HEAVY,
          ),
        ),
        const SizedBox(height: 8),
        (!isSerialNo)
            ? DropDownView(
                selectedValue: "one",
                onChange: (value) {
                  onChange(value);
                },
              )
            : Container(
                decoration: BoxDecoration(
                  border: Border.all(color: APP_THEME_COLOR, width: 0.3),
                ),
                width: 100,
                child: TextFormField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                  onChanged: (value) {
                    onChange(value);
                  },
                  onEditingComplete: () {
                    onEditingComplete();
                  },
                ),
              )
      ],
    );
  }
}
