// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../report_project/screen/report_project_screen.dart';

class PhaseTaskView extends StatelessWidget {
  String taskName, description, startDate, endDate;
  int complete;
  Function onTap;
  PhaseTaskView(
      {super.key,
      required this.taskName,
      required this.description,
      required this.startDate,
      required this.endDate,
      required this.complete,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: complete == 0 ? Colors.red : Colors.green, width: 1),
          boxShadow: [
            Functions.buildBoxShadow(),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  MdiIcons.desktopClassic,
                  size: 16,
                  color: complete == 0 ? Colors.red : Colors.green,
                ),
                const SizedBox(width: 6),
                Text(
                  taskName,
                  style: ConfigStyle.regularStyle(14, BUTTON_COLOR),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  MdiIcons.newspaper,
                  size: 16,
                  color: complete == 0 ? Colors.red : Colors.green,
                ),
                const SizedBox(width: 6),
                Text(
                  description,
                  style: ConfigStyle.regularStyle(14, BUTTON_COLOR),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  MdiIcons.calendarStart,
                  size: 16,
                  color: complete == 0 ? Colors.red : Colors.green,
                ),
                const SizedBox(width: 6),
                Text(
                  startDate,
                  style: ConfigStyle.regularStyle(14, BUTTON_COLOR),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  MdiIcons.calendarEnd,
                  size: 16,
                  color: complete == 0 ? Colors.red : Colors.green,
                ),
                const SizedBox(width: 6),
                Text(
                  endDate,
                  style: ConfigStyle.regularStyle(14, BUTTON_COLOR),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
