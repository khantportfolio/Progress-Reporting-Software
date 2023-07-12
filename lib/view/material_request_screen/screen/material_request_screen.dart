// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/view/login/widgets/common_text_field_view.dart';
import 'package:engineering_project/view/material_request_screen/bloc/material_request_bloc.dart';
import 'package:engineering_project/view/material_request_screen/widgets/selected_product_list_view.dart';
import 'package:engineering_project/view/report_request/widgets/date_pick_view.dart';
import 'package:engineering_project/view/request_maintenance/widgets/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MaterialRequestScreen extends StatelessWidget {
  MaterialRequestScreen({Key? key}) : super(key: key);

  TextEditingController? controllerOne;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MaterialRequestBloc(),
      child: Scaffold(
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
            "Request Material",
            style: ConfigStyle.boldStyle(18, MATERIAL_COLOR),
          ),
        ),
        body: Selector<MaterialRequestBloc, bool>(
            builder: (context, isLoading, child) {
              if (isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      Consumer<MaterialRequestBloc>(
                        builder: (context, bloc, child) {
                          if (bloc.selectedProducts != [] &&
                              bloc.selectedProducts?.length != 0) {
                            return SelectedProductListView(
                              selectedProductList: bloc.selectedProducts,
                            );
                          } else {
                            return SizedBox(
                              height: 180,
                              child: Center(
                                child: Text(
                                  "Select Materials",
                                  style: ConfigStyle.boldStyle(
                                    20,
                                    APP_THEME_COLOR,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                        child: Center(
                          child: Container(
                            height: 0.3,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Consumer<MaterialRequestBloc>(
                              builder: (context, bloc, child) => DropDownView(
                                menuTitle: "Choose Material",
                                list: bloc.productNameList ?? [],
                                onChange: (value) {
                                  bloc.onChangedProduct(value ?? "");
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            Consumer<MaterialRequestBloc>(
                              builder: (context, bloc, child) =>
                                  CommonTextFieldView(
                                renewController: (controller) {
                                  controllerOne = controller;
                                },
                                predefinedText: bloc.quantity?.toString(),
                                focusNode: bloc.focusNodeQuantity,
                                numberOnly: true,
                                isFilled: true,
                                isBorderIncluded: true,
                                labelText: "Quantity",
                                onChanged: (quantity) {
                                  bloc.onChangedQuantity(quantity);
                                },
                                onEditingComplete: () {
                                  bloc.onEditCompleteQuantity();
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            Consumer<MaterialRequestBloc>(
                              builder: (context, bloc, child) => MaterialButton(
                                color: BUTTON_COLOR,
                                onPressed: () {
                                  bloc.onTapAdd(controllerOne);
                                },
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                child: Text(
                                  "Add",
                                  style: ConfigStyle.regularStyle(
                                    14,
                                    MATERIAL_COLOR,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                              child: Center(
                                child: Container(
                                  height: 0.3,
                                  color: Colors.black38,
                                ),
                              ),
                            ),
                            Consumer<MaterialRequestBloc>(
                              builder: (context, bloc, child) => Row(
                                children: [
                                  Text("Finished Date",
                                      style: ConfigStyle.regularStyle(
                                          14, APP_THEME_COLOR)),
                                  const Spacer(),
                                  DatePickView(
                                    dateName: bloc.date ?? "",
                                    onTapDateIcon: () async {
                                      final DateTime? picked =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2020),
                                        lastDate: DateTime(2101),
                                      );
                                      if (picked != null) {
                                        final formatter =
                                            DateFormat('yyyy-MM-dd');
                                        var dateString =
                                            formatter.format(picked);
                                        bloc.onPickedDate(dateString);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Consumer<MaterialRequestBloc>(
                              builder: (context, bloc, child) =>
                                  CommonTextFieldView(
                                renewController: (controller) {},
                                predefinedText: bloc.reason,
                                focusNode: bloc.focusNodeReason,
                                isFilled: true,
                                isBorderIncluded: true,
                                labelText: "Reason",
                                onChanged: (reason) {
                                  bloc.onChangedReason(reason);
                                },
                                onEditingComplete: () {
                                  bloc.onEditCompleteReason();
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            Consumer<MaterialRequestBloc>(
                              builder: (context, bloc, child) =>
                                  CommonTextFieldView(
                                renewController: (controller) {},
                                focusNode: bloc.focusNodeRequestBy,
                                isFilled: true,
                                isBorderIncluded: true,
                                labelText: "Request By",
                                onChanged: (requestBy) {
                                  bloc.onChangedRequestBy(requestBy);
                                },
                                onEditingComplete: () {
                                  bloc.onEditCompleteRequestBy();
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            Consumer<MaterialRequestBloc>(
                              builder: (context, bloc, child) => MaterialButton(
                                color: LOGIN_BUTTON_COLOR,
                                onPressed: () {
                                  bloc.onTapRequest();
                                },
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                child: Text(
                                  "Requst",
                                  style: ConfigStyle.regularStyle(
                                    14,
                                    MATERIAL_COLOR,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),

                      // Consumer<MaterialRequestBloc>(
                      //   builder: (context, bloc, child) => ListView.separated(
                      //     itemBuilder: (context, index) {
                      //       var product = bloc.productList?[index];
                      //       return ProductDetailView(
                      //         product: product,
                      //         onChecked: (value) {},
                      //       );
                      //     },
                      //     separatorBuilder: (context, index) => SizedBox(
                      //       height: 10,
                      //       child: Center(
                      //         child: Container(
                      //           color: Colors.black38,
                      //           height: 0.5,
                      //         ),
                      //       ),
                      //     ),
                      //
                      //     itemCount: bloc.productList?.length ?? 0,
                      //
                      //     ///itemCount: 20,
                      //     shrinkWrap: true,
                      //     scrollDirection: Axis.vertical,
                      //     physics: const NeverScrollableScrollPhysics(),
                      //   ),
                      // ),
                    ],
                  ),
                );
              }
            },
            selector: (context, bloc) => bloc.isLoading),
      ),
    );
  }
}
