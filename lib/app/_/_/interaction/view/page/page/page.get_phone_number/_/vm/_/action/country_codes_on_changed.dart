import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../util.dart';
import '../vm.dart';

countyCodesOnChangedAction(CountryCode value) {
  NewVM viewModel = NewVMUtil.vm();
  viewModel.userDialCode = value.dialCode ?? "+1";
  viewModel.userCountryCode = value.code ?? "US";

  viewModel.util.notify();
}
