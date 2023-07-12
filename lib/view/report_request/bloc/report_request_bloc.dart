import 'dart:convert';
import 'dart:io';

import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/data/repo_model/engineering_repository.dart';
import 'package:engineering_project/data/repo_model/engineering_repository_impl.dart';
import 'package:engineering_project/data/vos/report_vo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportRequestBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final EngineeringRepository _repository = EngineeringRepositoryImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  int? requestId;
  String? date;
  String? chief;
  String? description;
  int? progressPercent;
  int? complete;
  List<File> photoList = [];
  List<File> videoList = [];
  List<String> base64PhotoList = [];
  List<String> base64VideoList = [];
  FocusNode? focusNodeChief = FocusNode();
  FocusNode? focusNodeDescription = FocusNode();
  FocusNode? focusNodeProgress = FocusNode();

  ReportRequestBloc(int requestId) {
    var today = DateTime.now();
    final formatter = DateFormat('yyyy-MM-dd');
    var dateString = formatter.format(today);
    date = dateString;
    this.requestId = requestId;
    _notifySafely();
  }

  void onPickedDate(String date) {
    this.date = date;
    _notifySafely();
  }

  void onChangeChief(String chief) {
    this.chief = chief;
    _notifySafely();
  }

  void onEditCompleteChief() {
    focusNodeChief?.unfocus();
    _notifySafely();
  }

  void onChangeDescription(String description) {
    this.description = description;
    _notifySafely();
  }

  void onChangeProgress(String progressPercent) {
    this.progressPercent = int.tryParse(progressPercent);
    _notifySafely();
    if (progressPercent == "100") {
      complete = 1;
      _notifySafely();
    } else {
      complete = 0;
      _notifySafely();
    }
  }

  void onEditCompleteDescription() {
    focusNodeDescription?.unfocus();
    _notifySafely();
  }

  void onEditCompleteProgress() {
    focusNodeProgress?.unfocus();
    _notifySafely();
  }

  void onPickedImage(File image) async {
    photoList.add(image);
    var byte = await image.readAsBytes();
    base64PhotoList.add(base64Encode(byte));
    _notifySafely();
  }

  void onPickedVideo(File video) async {
    videoList.add(video);
    var byte = await video.readAsBytes();
    base64VideoList.add(base64Encode(byte));
    _notifySafely();
  }

  void onTapRemovePhoto() {
    photoList = [];
    base64PhotoList = [];
    _notifySafely();
  }

  void onTapRemoveVideo() {
    videoList = [];
    base64VideoList = [];
    _notifySafely();
  }

  Future onTapSubmit() async {
    _showLoading();
    if (requestId != null &&
        requestId != 0 &&
        date != null &&
        date != "" &&
        chief != null &&
        chief != "" &&
        description != null &&
        description != "" &&
        progressPercent != null &&
        complete != null) {
      ReportVO reportVO = ReportVO();
      reportVO.request_id = requestId;
      reportVO.finished_date = date;
      reportVO.checked_by = chief;
      reportVO.report_description = description;
      reportVO.progress = progressPercent;
      reportVO.complete = complete;
      reportVO.base64PhotoList = base64PhotoList;
      reportVO.base64VideoList = base64VideoList;
      var response = await _repository.postReportRequest(reportVO);
      _hideLoading();
      return Future.value(response);
    } else {
      _hideLoading();
      Functions.toast(msg: "Information required", status: false);
      return Future.error("error");
    }
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
