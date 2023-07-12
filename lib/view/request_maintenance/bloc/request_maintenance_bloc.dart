import 'package:engineering_project/data/repo_model/engineering_repository.dart';
import 'package:engineering_project/data/repo_model/engineering_repository_impl.dart';
import 'package:engineering_project/data/vos/user_vo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class RequestMaintenanceBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies

  /// Loading State
  bool isLoading = false;

  /// Screen states
  int? requestNo;
  String? requestDate, dueDate;
  String? condition, reqRemark;
  DateTime? date;

  FocusNode fNodeRequestNo = FocusNode();
  FocusNode fNodeCondition = FocusNode();
  FocusNode fNodeReqRemark = FocusNode();
  RequestMaintenanceBloc();

  void onChangeRequestNo(int no) {
    this.requestNo = no;
    _notifySafely();
  }

  void onChangeCondition(String condition) {
    this.condition = condition;
    _notifySafely();
  }

  void onChangeReqRemark(String reqRemark) {
    this.reqRemark = reqRemark;
    _notifySafely();
  }

  void onEditingCompleteRequestNo() {
    fNodeRequestNo.unfocus();
    _notifySafely();
  }

  void onEditingCompleteCondition() {
    fNodeCondition.unfocus();
    _notifySafely();
  }

  void onEditingCompleteReqRemark() {
    fNodeReqRemark.unfocus();
    _notifySafely();
  }

  // Future onTapRequest() {
  //   //_showLoading();
  // }

  void onRequestDatePick(DateTime dateTime) {
    this.date = dateTime;
    final formatter = DateFormat('yyyy-MM-dd');
    requestDate = formatter.format(date!);
    _notifySafely();
  }

  void onDueDatePick(DateTime dateTime) {
    this.date = dateTime;
    final formatter = DateFormat('yyyy-MM-dd');
    dueDate = formatter.format(date!);
    _notifySafely();
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
