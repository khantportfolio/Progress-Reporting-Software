import 'package:engineering_project/data/vos/product_vo.dart';

class MaterialRequestStoreVO {
  int? employeeId;
  String? requestDate;
  List<ProductVO>? products;

  MaterialRequestStoreVO({
    this.employeeId,
    this.requestDate,
    this.products,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employee_id'] = this.employeeId;
    data['request_date'] = this.requestDate;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
