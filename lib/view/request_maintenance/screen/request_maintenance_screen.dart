import 'package:engineering_project/core/core_config/config_dimens.dart';
import 'package:engineering_project/view/login/widgets/common_text_field_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/core_config/config_color.dart';
import '../../../core/core_config/config_style.dart';
import '../../home/widgets/drawer_property_list_view.dart';
import '../bloc/request_maintenance_bloc.dart';
import '../widgets/btn_view.dart';
import '../widgets/common_app_bar_view.dart';
import '../widgets/date_view.dart';
import '../widgets/drop_down.dart';

class RequestMaintenanceScreen extends StatelessWidget {
  const RequestMaintenanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RequestMaintenanceBloc(),
      child: Scaffold(
        drawer: Drawer(
          width: scaleWidth(context) / 1.4,
          child: DrawerPropertyListView(),
        ),
        appBar: PreferredSize(
          preferredSize: Size(scaleWidth(context), 50),
          child: CommonAppBarView(
            isEnableBack: true,
            onTapBack: () {
              Navigator.pop(context);
              //Functions.replacementTransition(context, HomeScreen());
            },
            title: "Request Maintenance",
          ),
        ),
        body: Selector<RequestMaintenanceBloc, bool>(
            builder: (context, isLoading, child) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: scaleWidth(context) / 10,
                          vertical: scaleHeight(context) / 20),
                      child: Column(
                        children: [
                          // title
                          Center(
                            child: Text(
                              "Request Maintenance Form",
                              style: ConfigStyle.boldStyle(
                                20,
                                BLACK_HEAVY,
                              ),
                            ),
                          ),
                          SizedBox(height: scaleHeight(context) / 25),
                          //request no tf
                          Consumer<RequestMaintenanceBloc>(
                            builder: (context, bloc, child) =>
                                CommonTextFieldView(
                                  renewController: (controller){},
                              isBorderIncluded: true,
                              labelText: "Request No.",
                              onChanged: (value) {},
                              onEditingComplete: () {},
                            ),
                          ),
                          SizedBox(height: scaleHeight(context) / 30),
                          //request date due date in a row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Consumer<RequestMaintenanceBloc>(
                                builder: (context, bloc, child) => DateView(
                                    dateName:
                                        bloc.requestDate ?? "request date",
                                    onTapDateIcon: () async {
                                      final DateTime? picked =
                                          await showDatePicker(
                                        context: context,
                                        initialDate:
                                            bloc.date ?? DateTime.now(),
                                        firstDate: DateTime(2021, 3),
                                        lastDate: DateTime(2101),
                                      );
                                      bloc.onRequestDatePick(picked!);
                                    }),
                              ),
                              Consumer<RequestMaintenanceBloc>(
                                builder: (context, bloc, child) => DateView(
                                    dateName: bloc.dueDate ?? "due date",
                                    onTapDateIcon: () async {
                                      final DateTime? picked =
                                          await showDatePicker(
                                        context: context,
                                        initialDate:
                                            bloc.date ?? DateTime.now(),
                                        firstDate: DateTime(2021, 3),
                                        lastDate: DateTime(2101),
                                      );
                                      bloc.onDueDatePick(picked!);
                                    }),
                              ),
                            ],
                          ),
                          SizedBox(height: scaleHeight(context) / 40),
                          //building, choose building/dd
                          Consumer<RequestMaintenanceBloc>(
                            builder: (context, bloc, child) => DropDownView(
                              list: ["one", "two"],
                              menuTitle: "Choose Building",
                              selectedValue: "",
                              onChange: (value) {
                                //bloc.onChooseBuilding();
                              },
                            ),
                          ),
                          SizedBox(height: scaleHeight(context) / 40),
                          //room, choose room/dd
                          Consumer<RequestMaintenanceBloc>(
                            builder: (context, bloc, child) => DropDownView(
                              list: ["one", "two"],
                              menuTitle: "Choose Room",
                              selectedValue: "",
                              onChange: (value) {
                                //bloc.onChooseBuilding();
                              },
                            ),
                          ),
                          SizedBox(height: scaleHeight(context) / 40),
                          //asset, choose asset/dd
                          Consumer<RequestMaintenanceBloc>(
                            builder: (context, bloc, child) => DropDownView(
                              list: ["one", "two"],
                              menuTitle: "Choose Asset",
                              selectedValue: "",
                              onChange: (value) {
                                //bloc.onChooseBuilding();
                              },
                            ),
                          ),
                          SizedBox(height: scaleHeight(context) / 40),
                          //condition tf
                          Consumer<RequestMaintenanceBloc>(
                            builder: (context, bloc, child) =>
                                CommonTextFieldView(
                                  renewController: (controller){},
                              isBorderIncluded: true,
                              labelText: "Condition",
                              onChanged: (value) {},
                              onEditingComplete: () {},
                            ),
                          ),
                          SizedBox(height: scaleHeight(context) / 40),
                          //requirement remark tf
                          Consumer<RequestMaintenanceBloc>(
                            builder: (context, bloc, child) =>
                                CommonTextFieldView(
                                  renewController: (controller){},
                              isBorderIncluded: true,
                              labelText: "Requirement Remark",
                              onChanged: (value) {},
                              onEditingComplete: () {},
                            ),
                          ),
                          SizedBox(height: scaleHeight(context) / 40),
                          //request btn
                          Consumer<RequestMaintenanceBloc>(
                            builder: (context, bloc, child) => BtnView(
                                btnName: "Submit",
                                onTouch: () {
                                  //bloc.onTapRequest();
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isLoading,
                    child: const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.transparent,
                        color: Colors.amber,
                      ),
                    ),
                  )
                ],
              );
            },
            selector: (context, bloc) => bloc.isLoading),
      ),
    );
  }
}
