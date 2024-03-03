import 'package:dilrecord_money/module/data/models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final _data = User().obs;
  User get data => _data.value;
  setData(n) => _data.value = n;
}
