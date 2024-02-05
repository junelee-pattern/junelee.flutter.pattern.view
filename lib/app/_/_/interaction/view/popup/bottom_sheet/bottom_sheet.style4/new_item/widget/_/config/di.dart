import '../../../vm/_/util.dart';
import 'params.dart';

dependencyInjection(NewItemParams params, String? tag) {
  NewItemVMUtil.registeredVM(params, tag: tag);
}
