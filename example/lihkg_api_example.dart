import 'package:lihkg_api/lihkg_api.dart';
import 'package:lihkg_api/src/lihkg_api_methods.dart';

main() async {
  BaseResponse<PropertyResponse> response = await getProperty();
  print(response.toJson());
}
