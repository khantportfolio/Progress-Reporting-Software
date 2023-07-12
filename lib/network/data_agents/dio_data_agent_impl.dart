import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/data/vos/material_request_store_vo.dart';
import 'package:engineering_project/data/vos/product_vo.dart';
import 'package:engineering_project/data/vos/report_vo.dart';
import 'package:engineering_project/network/api_service/api_constants.dart';
import 'package:engineering_project/network/data_agents/dio_data_agent.dart';
import 'package:engineering_project/network/responses/get_product_list_response.dart';
import 'package:engineering_project/network/responses/get_project_phases_by_employee_response.dart';
import 'package:engineering_project/network/responses/get_request_list_response.dart';
import 'package:engineering_project/network/responses/post_login_response.dart';
import 'package:engineering_project/network/responses/post_request_report_response.dart';
import 'package:engineering_project/network/responses/get_product_data_response.dart';

import '../responses/get_asset_data_response.dart';
import '../responses/post_report_task_response.dart';

class DioDataAgentImpl extends DioDataAgent {
  DioDataAgentImpl._internal();

  static final DioDataAgentImpl _singleton = DioDataAgentImpl._internal();

  factory DioDataAgentImpl() => _singleton;

  Dio _getDio() {
    var dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1),
        sendTimeout: const Duration(minutes: 1),
        contentType: 'application/json',
        headers: {
          'Accept': 'application/json; charset=UTF-8',
        },
      ),
    );
    return dio;
  }

  @override
  Future<PostLoginResponse> postUserLogin(String email, String password) async {
    var data = {"email": email, "password": password};
    var dio = _getDio();
    try {
      final response = await dio.post(LOGIN_URL, data: data);
      if (response.statusCode == 200) {
        return PostLoginResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetRequestListResponse> getRequestListById(int employeeId) async {
    var data = {"employee_id": employeeId};
    var dio = _getDio();
    try {
      final response = await dio.post(REQUEST_LIST_BY_ID_URL, data: data);
      if (response.statusCode == 200) {
        return GetRequestListResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetRequestListResponse> getRequestList() async {
    var dio = _getDio();
    try {
      final response = await dio.get(REQUEST_LIST_URL);
      if (response.statusCode == 200) {
        return GetRequestListResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetProductDataResponse> getProductDataList() async {
    var dio = _getDio();
    try {
      final response = await dio.get(REQUEST_PRODUCT_LIST_URL);
      if (response.statusCode == 200) {
        return GetProductDataResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetProjectPhasesByEmployeeResponse> getProjectPhasesByEmployee(
      int employeeId) async {
    var dio = _getDio();
    try {
      final response =
          await dio.get("$PROJECT_LIST_BY_EMPLOYEE_ID_URL/$employeeId");
      if (response.statusCode == 200) {
        return GetProjectPhasesByEmployeeResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetAssetDataResponse> getAssetData(int id) async {
    var dio = _getDio();
    try {
      final response = await dio.get("$ASSET_URL/$id");
      if (response.statusCode == 200) {
        return GetAssetDataResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<RequestReportResponseVO> postReportRequest(ReportVO reportVO) async {
    var dio = _getDio();
    var data = reportVO.toJson();
    try {
      final response = await dio.post(REPORT_REQUEST_URL, data: data);
      if (response.statusCode == 201) {
        return RequestReportResponseVO.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<PostReportTaskResponseVO> postReportTaskRequest(
      ReportVO reportVO) async {
    var dio = _getDio();
    var data = reportVO.toJson();
    try {
      final response = await dio.post(REPORT_TASK_URL, data: data);
      if (response.statusCode == 201) {
        return PostReportTaskResponseVO.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetProductListResponse> getProductList() async {
    var dio = _getDio();
    try {
      final response = await dio.get("$PRODUCT_LIST_URL");
      if (response.statusCode == 200) {
        return GetProductListResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> postMaterialRequestStore(
      MaterialRequestStoreVO materialRequestStoreVO) async {
    var dio = _getDio();
    var data = materialRequestStoreVO.toJson();
    try {
      final response =
          await dio.post("$REQUEST_MATERIAL_STORE_URL", data: data);
      if (response.statusCode == 201) {
        Functions.toast(msg: "Request Success", status: true);
        return Future.value();
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
