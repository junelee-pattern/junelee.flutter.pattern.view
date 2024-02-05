import '../../../vm/_/util.dart';
import 'params.dart';

dependencyInjection(NewMarkdownPolicyParams params, String? tag) {
  NewMarkdownPolicyVMUtil.registeredVM(params, tag: tag);
}
