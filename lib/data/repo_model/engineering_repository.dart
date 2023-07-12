import 'package:engineering_project/data/vos/material_request_store_vo.dart';
import 'package:engineering_project/data/vos/product_vo.dart';
import 'package:engineering_project/data/vos/report_vo.dart';
import 'package:engineering_project/network/responses/get_product_list_response.dart';
import 'package:engineering_project/network/responses/get_project_phases_by_employee_response.dart';
import 'package:engineering_project/network/responses/get_request_list_response.dart';
import 'package:engineering_project/network/responses/post_login_response.dart';
import 'package:engineering_project/network/responses/post_request_report_response.dart';
import 'package:engineering_project/network/responses/get_product_data_response.dart';

import '../../network/responses/get_asset_data_response.dart';
import '../../network/responses/post_report_task_response.dart';

abstract class EngineeringRepository {
  Future<PostLoginResponse> postUserLogin(String email, String password);
  Future<GetRequestListResponse> getRequestList();
  Future<GetRequestListResponse> getRequestListById(int employeeId);
  Future<GetAssetDataResponse> getAssetData(int id);

  Future<void> saveString(String key, String value);
  Future<String> getString(String key);
  Future<void> removeSharePrefItem(String key);

  Future<void> saveInt(String key, int value);
  Future<int> getInt(String key);
  Future<GetProjectPhasesByEmployeeResponse> getProjectPhasesByEmployee(
      int employeeId);
  Future<RequestReportResponseVO> postReportRequest(ReportVO reportVO);
  Future<PostReportTaskResponseVO> postReportTaskRequest(ReportVO reportVO);
  Future<GetProductListResponse> getProductList();
  Future<GetProductDataResponse> getProductDataList();
  void saveAllProductsDataBase(List<ProductVO?>? productList);
  void saveSingleProductDataBase(ProductVO? product);
  void deleteProductDataBase(int? productId);
  Stream<List<ProductVO?>?> getAllProductStream();
  Stream<ProductVO?> getSingleProductStream(int? productId);
  Future<void> postMaterialRequestStore(MaterialRequestStoreVO materialRequestStoreVO);
}
