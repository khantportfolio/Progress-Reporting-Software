import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/view/material_request_screen/screen/material_request_screen.dart';
import 'package:engineering_project/view/material_request_history/bloc/material_request_history_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/request_product_view.dart';

class MaterialRequestHistoryScreen extends StatelessWidget {
  const MaterialRequestHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MaterialRequestHistoryBloc(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          Functions.rightToLeftTransition(context, MaterialRequestScreen());
        }),
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
            "Material Request History",
            style: ConfigStyle.boldStyle(18, MATERIAL_COLOR),
          ),
        ),
        body: Selector<MaterialRequestHistoryBloc, bool>(
            builder: (context, isLoading, child) {
              if (isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Consumer<MaterialRequestHistoryBloc>(
                    builder: (context, bloc, child) {
                      var productDataList = bloc.productDataList;
                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: productDataList?.length ?? 0,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          var productData = productDataList?[index];
                          return RequestProductView(
                            requestDate: productData?.requestDate ?? "",
                            reason: productData?.reason ?? "",
                            requestedBy: productData?.requestedBy ?? "",
                            materialList: productData?.products ?? [],
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                          child: Center(
                            child: Container(
                              height: 0.5,
                              color: Colors.black26,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
            selector: (context, bloc) => bloc.isLoading),
      ),
    );
  }
}
