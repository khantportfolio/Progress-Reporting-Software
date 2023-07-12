import 'package:engineering_project/data/vos/product_vo.dart';
import 'package:engineering_project/persistence/hive/constant/hive_constants.dart';
import 'package:engineering_project/view/login/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(ProductVOAdapter());

  await Hive.openBox<ProductVO>(BOX_NAME_PRODUCT_VO);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
