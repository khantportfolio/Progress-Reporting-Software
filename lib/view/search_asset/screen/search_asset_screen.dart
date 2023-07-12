import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/view/login/widgets/common_text_field_view.dart';
import 'package:engineering_project/view/menu/widgets/menu_item_detail_view.dart';
import 'package:engineering_project/view/search_asset/widgets/dropdown_view.dart';
import 'package:engineering_project/view/search_asset/widgets/title_and_dropdown_view.dart';
import 'package:flutter/material.dart';

class SearchAssetScreen extends StatelessWidget {
  const SearchAssetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Assets Types",
          style: ConfigStyle.boldStyle(18, MATERIAL_COLOR),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleAndDropDownView(
                    title: "Room",
                    onChange: (room) {},
                    onEditingComplete: () {},
                  ),
                  TitleAndDropDownView(
                    title: "Building",
                    onChange: (building) {},
                    onEditingComplete: () {},
                  ),
                  TitleAndDropDownView(
                    title: "Serial No",
                    isSerialNo: true,
                    onChange: (building) {},
                    onEditingComplete: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 30,
                ),
                itemBuilder: (context, index) {
                  return MenuItemDetailView(
                    boxColor: THEME_EXTREMITY_COLOR,
                    text: "Computer",
                    onTap: () {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
