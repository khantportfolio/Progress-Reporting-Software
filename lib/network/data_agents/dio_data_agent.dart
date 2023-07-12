import 'package:engineering_project/data/vos/material_request_store_vo.dart';
import 'package:engineering_project/data/vos/product_vo.dart';
import 'package:engineering_project/data/vos/report_vo.dart';
import 'package:engineering_project/network/responses/get_product_list_response.dart';
import 'package:engineering_project/network/responses/get_project_phases_by_employee_response.dart';
import 'package:engineering_project/network/responses/get_request_list_response.dart';
import 'package:engineering_project/network/responses/post_login_response.dart';
import 'package:engineering_project/network/responses/post_request_report_response.dart';
import 'package:engineering_project/network/responses/get_product_data_response.dart';

import '../responses/get_asset_data_response.dart';
import '../responses/post_report_task_response.dart';

abstract class DioDataAgent {
  Future<PostLoginResponse> postUserLogin(String email, String password);
  Future<GetRequestListResponse> getRequestList();
  Future<GetRequestListResponse> getRequestListById(int employeeId);
  Future<GetProjectPhasesByEmployeeResponse> getProjectPhasesByEmployee(
      int employeeId);
  Future<GetAssetDataResponse> getAssetData(int id);
  Future<RequestReportResponseVO> postReportRequest(ReportVO reportVO);
  Future<PostReportTaskResponseVO> postReportTaskRequest(ReportVO reportVO);
  Future<GetProductListResponse> getProductList();
  Future<void> postMaterialRequestStore(
      MaterialRequestStoreVO materialRequestStoreVO);
  Future<GetProductDataResponse> getProductDataList();
}
