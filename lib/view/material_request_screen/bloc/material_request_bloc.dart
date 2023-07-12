import 'package:engineering_project/core/core_config/config_text.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/data/repo_model/engineering_repository.dart';
import 'package:engineering_project/data/repo_model/engineering_repository_impl.dart';
import 'package:engineering_project/data/vos/material_request_store_vo.dart';
import 'package:engineering_project/data/vos/product_vo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MaterialRequestBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final EngineeringRepository _repository = EngineeringRepositoryImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  List<ProductVO>? productList = [];
  List<String>? productNameList = [];
  List<ProductVO>? selectedProducts = [];
  String? date;
  String? productName;
  int? productId;
  String? productImage;
  int? quantity;
  String? reason;
  String? requestBy;
  FocusNode focusNodeQuantity = FocusNode();
  FocusNode focusNodeReason = FocusNode();
  FocusNode focusNodeRequestBy = FocusNode();

  MaterialRequestBloc() {
    _showLoading();
    var today = DateTime.now();
    final formatter = DateFormat('yyyy-MM-dd');
    var dateString = formatter.format(today);
    date = dateString;
    _notifySafely();
    _repository.getProductList().then((response) {
      productList = response.products;
      productNameList = productList?.map((e) => e.productName ?? "").toList();
      _notifySafely();
      _hideLoading();
    });
  }

  void onChangedProduct(String productName) {
    var list = productList
            ?.where((element) => element.productName == productName)
            .toList() ??
        [];
    list.take(1);
    var product = list.elementAt(0);
    productId = product.id;
    this.productName = product.productName ?? "";
    productImage = product.productImg;
    _notifySafely();
  }

  void onChangedQuantity(String quantity) {
    this.quantity = int.tryParse(quantity);
    _notifySafely();
  }

  void onChangedReason(String reason) {
    this.reason = reason;
    _notifySafely();
  }

  void onChangedRequestBy(String requestBy) {
    this.requestBy = requestBy;
    _notifySafely();
  }

  void onEditCompleteRequestBy() {
    focusNodeRequestBy.unfocus();
    _notifySafely();
  }

  void onTapAdd(TextEditingController? controllerOne) {
    var productVO = ProductVO(
      id: productId,
      productName: productName,
      productImg: productImage,
      quantity: quantity,
    );
    selectedProducts?.add(productVO);
    productId = null;
    productName = null;
    productImage = null;
    quantity = null;
    controllerOne?.clear();
    _notifySafely();
  }

  void onPickedDate(String date) {
    this.date = date;
    _notifySafely();
  }

  Future onTapRequest() async {
    _showLoading();
    var employeeId = await _repository.getInt(EMPLOYEE_ID);
    if (date != null &&
        date != "" &&
        employeeId != null &&
        employeeId != 0 &&
        selectedProducts?.length != 0 &&
        selectedProducts != []) {
      MaterialRequestStoreVO materialRequestStoreVO = MaterialRequestStoreVO(
        requestDate: date,
        employeeId: employeeId,
        products: selectedProducts,
      );
      await _repository.postMaterialRequestStore(materialRequestStoreVO);
      _hideLoading();
    } else {
      _hideLoading();
      Functions.toast(msg: "Field required!", status: false);
    }
  }

  void onEditCompleteQuantity() {
    focusNodeQuantity.unfocus();
    _notifySafely();
  }

  void onEditCompleteReason() {
    focusNodeReason.unfocus();
  }

  /// loading situations
  void _showLoading() {
    isLoading = true;
    _notifySafely();
  }

  void _hideLoading() {
    isLoading = false;
    _notifySafely();
  }

  void _notifySafely() {
    if (!isDisposed) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    isDisposed = true;
  }
}
