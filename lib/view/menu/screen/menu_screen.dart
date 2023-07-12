import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_dimens.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/view/bottom_navigation/screen/bottom_navigation_screen_two.dart';
import 'package:engineering_project/view/home/widgets/custom_app_bar_view.dart';
import 'package:engineering_project/view/home/widgets/drawer_property_list_view.dart';
import 'package:engineering_project/view/material_request_history/screen/material_request_history_screen.dart';
import 'package:engineering_project/view/menu/widgets/menu_item_detail_view.dart';
import 'package:engineering_project/view/request_maintenance/screen/request_maintenance_screen.dart';
import 'package:engineering_project/view/search_asset/screen/search_asset_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Scaffold(
          drawer: Drawer(
            width: scaleWidth(context) / 1.4,
            child: DrawerPropertyListView(visibleHome: false),
          ),
          appBar: PreferredSize(
            preferredSize: Size(scaleWidth(context), 60),
            child: CustomAppBarView(
              visibleDueDates: false,
              title: "Menu",
              onTap: (date) {},
              dueDateList: [],
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: scaleHeight(context) / 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuItemDetailView(
                        boxColor: MENU_ONE_COLOR,
                        text: "Maintenance",
                        onTap: () {
                          Functions.rightToLeftTransition(
                              context, BottomNavigationPageTwo());
                        },
                      ),
                      MenuItemDetailView(
                        boxColor: MENU_TWO_COLOR,
                        text: "Project",
                        onTap: () {
                          Functions.rightToLeftTransition(
                              context,
                              BottomNavigationPageTwo(
                                currentIndex: 1,
                              ));
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: scaleHeight(context) / 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuItemDetailView(
                        boxColor: MENU_FOUR_COLOR,
                        text: "History",
                        onTap: () {},
                      ),
                      MenuItemDetailView(
                        boxColor: MENU_FIVE_COLOR,
                        text: "Request Form",
                        onTap: () {
                          Functions.transition(
                              context, const RequestMaintenanceScreen());
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: scaleHeight(context) / 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuItemDetailView(
                        boxColor: MENU_THREE_COLOR,
                        text: "Search Asset",
                        onTap: () {
                          Functions.rightToLeftTransition(
                              context, const SearchAssetScreen());
                        },
                      ),
                      MenuItemDetailView(
                        boxColor: APP_THEME_COLOR,
                        text: "Material",
                        onTap: () {
                          Functions.rightToLeftTransition(
                              context, const MaterialRequestHistoryScreen());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
