// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_dimens.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class DropDownView extends StatefulWidget {
  String? selectedValue;
  List<String> list;
  String? menuTitle;
  Function(String?) onChange;
  DropDownView({
    super.key,
    this.list = const ["one", "two", "three", "four"],
    this.menuTitle,
    this.selectedValue,
    required this.onChange,
  });

  @override
  State<DropDownView> createState() => _DropDownViewState();
}

class _DropDownViewState extends State<DropDownView> {
  String? dropdownValue;
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        alignment: Alignment.centerLeft,
        value: item,
        child: Text(
          item,
          style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
        ),
      );

  @override
  void initState() {
    setState(() {
       dropdownValue = widget.selectedValue;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: APP_THEME_COLOR,
          width: 0.5,
        ),
      ),
      child: DropdownButton<String>(
        underline: Container(
          color: Colors.transparent,
        ),
        isDense: false,
        isExpanded: false,
        elevation: 0,
        dropdownColor: Colors.white,
        value: dropdownValue ?? widget.list[0],
        items: widget.list.map(buildMenuItem).toList(),
        onChanged: (value) {
          setState(() {
            dropdownValue = value;
          });
          widget.onChange(value);
        },
      ),
    );
  }
}
