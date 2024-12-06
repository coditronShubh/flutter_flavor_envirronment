import 'package:cicd_flavor/environment.dart';
import 'package:cicd_flavor/main_common.dart';

Future<void> main() async {
  await mainCommon(Environment.prod);
}
