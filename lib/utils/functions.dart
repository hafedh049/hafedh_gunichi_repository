import 'package:fluttertoast/fluttertoast.dart';
import 'package:hafedh_gunichi/utils/global_variables.dart';

void showToast(String msg) {
  Fluttertoast.showToast(msg: msg, timeInSecForIosWeb: 3, webShowClose: true, webBgColor: "#212428", textColor: white, fontSize: 16);
}
