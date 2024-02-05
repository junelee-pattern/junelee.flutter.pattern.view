import '../../../vm/_/util.dart';
import 'params.dart';

dependencyInjection(NewMarkdownTermParams params, String? tag) {
  NewMarkdownTermVMUtil.registeredVM(params, tag: tag);
}
