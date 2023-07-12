import 'package:engineering_project/data/vos/material_request_store_vo.dart';
import 'package:engineering_project/data/vos/product_vo.dart';
import 'package:engineering_project/data/vos/report_vo.dart';
import 'package:engineering_project/network/responses/get_product_list_response.dart';
import 'package:engineering_project/network/responses/get_project_phases_by_employee_response.dart';
import 'package:engineering_project/network/responses/post_request_report_response.dart';
import 'package:engineering_project/persistence/hive/daos/product_dao.dart';
import 'package:engineering_project/persistence/share_preference/share_preference.dart';
import 'package:engineering_project/data/repo_model/engineering_repository.dart';
import 'package:engineering_project/network/data_agents/dio_data_agent_impl.dart';
import 'package:engineering_project/network/responses/get_request_list_response.dart';
import 'package:engineering_project/network/responses/post_login_response.dart';
import 'package:engineering_project/network/responses/get_product_data_response.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../network/responses/get_asset_data_response.dart';
import '../../network/responses/post_report_task_response.dart';

class EngineeringRepositoryImpl extends EngineeringRepository {
  EngineeringRepositoryImpl._internal();

  static final EngineeringRepositoryImpl _singleton =
      EngineeringRepositoryImpl._internal();

  factory EngineeringRepositoryImpl() => _singleton;

  final _dataAgent = DioDataAgentImpl();
  SharePreferenceModel _sharePreferenceModel = SharePreferenceModel();
  ProductDao _productDao = ProductDao();

  @override
  Future<int> getInt(String key) {
    return _sharePreferenceModel.getInt(key);
  }

  @override
  Future<void> saveInt(String key, int value) {
    return _sharePreferenceModel.saveInt(key, value);
  }

  @override
  Future<String> getString(String key) {
    return _sharePreferenceModel.getString(key);
  }

  @override
  Future<void> saveString(String key, String value) {
    return _sharePreferenceModel.saveString(key, value);
  }

  @override
  Future<void> removeSharePrefItem(String key) {
    return _sharePreferenceModel.removeSharePrefItem(key);
  }

  @override
  Future<PostLoginResponse> postUserLogin(String email, String password) {
    return _dataAgent.postUserLogin(email, password);
  }

  @override
  Future<GetRequestListResponse> getRequestList() {
    return _dataAgent.getRequestList();
  }

  @override
  Future<GetRequestListResponse> getRequestListById(int employeeId) {
    return _dataAgent.getRequestListById(employeeId);
  }

  @override
  Future<GetProjectPhasesByEmployeeResponse> getProjectPhasesByEmployee(
      int employeeId) {
    return _dataAgent.getProjectPhasesByEmployee(employeeId);
  }

  @override
  Future<GetAssetDataResponse> getAssetData(int id) {
    return _dataAgent.getAssetData(id);
  }

  @override
  Future<RequestReportResponseVO> postReportRequest(ReportVO reportVO) {
    return _dataAgent.postReportRequest(reportVO);
  }

  @override
  Future<PostReportTaskResponseVO> postReportTaskRequest(ReportVO reportVO) {
    return _dataAgent.postReportTaskRequest(reportVO);
  }

  @override
  Future<GetProductListResponse> getProductList() {
    return _dataAgent.getProductList();
  }

  @override
  Future<GetProductDataResponse> getProductDataList() {
    return _dataAgent.getProductDataList();
  }

  @override
  void deleteProductDataBase(int? productId) {
    return _productDao.deleteProductDataBase(productId);
  }

  @override
  Stream<List<ProductVO?>?> getAllProductStream() {
    return _productDao
        .watchAllProductsEventStream()
        .startWith(_productDao.getAllProductStream())
        .map((event) => _productDao.getAllProductsDataBase());
  }

  @override
  Stream<ProductVO?> getSingleProductStream(int? productId) {
    return _productDao
        .watchAllProductsEventStream()
        .startWith(_productDao.getSingleProductStream(productId))
        .map((event) => _productDao.getSingleProductDataBase(productId));
  }

  @override
  void saveAllProductsDataBase(List<ProductVO?>? productList) {
    return _productDao.saveAllProductsDataBase(productList);
  }

  @override
  void saveSingleProductDataBase(ProductVO? product) {
    return _productDao.saveSingleProductDataBase(product);
  }

  @override
  Future<void> postMaterialRequestStore(
      MaterialRequestStoreVO materialRequestStoreVO) {
    return _dataAgent.postMaterialRequestStore(materialRequestStoreVO);
  }
}
