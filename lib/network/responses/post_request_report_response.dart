import 'package:engineering_project/data/vos/data_from_report_vo.dart';

class RequestReportResponseVO {
  DataFromReportVO? data;

  RequestReportResponseVO({this.data});

  RequestReportResponseVO.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new DataFromReportVO.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
