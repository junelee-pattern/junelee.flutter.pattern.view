import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart' as ready_vm_sync;

import '../../../../../../../../../../../../util/start_app.dart';
import '../../../page/_/config/params.dart';
import '../util.dart';
import '../vm.dart';

Future<void> readyVMAction(ready_vm_sync.BuildContext context, NewParams params,
    {String? tag}) async {
  NewVMUtil.registeredVM(params, tag: tag);
  NewVM viewModel = NewVMUtil.vm(tag: tag);

  final CountryDetails details = CountryCodes.detailsForLocale();
  viewModel.userDialCode = details.dialCode ?? "+1";
  viewModel.userCountryCode = details.alpha2Code ?? "US";


  // get information here that you need to get

  viewModel.util.notify();
}
