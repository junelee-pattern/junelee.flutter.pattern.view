import 'package:flutter/material.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../util.dart';
import '../vm.dart';

onChangedTextFieldAction(String value) {
  NewVM viewModel = NewVMUtil.vm();

  //verify phone number

  viewModel.inputButtonEnabled = PhoneNumber.parse(value,
          callerCountry: isoCodeConversionMap[viewModel.userCountryCode])
      .isValid(type: PhoneNumberType.mobile);

  viewModel.internationalPhoneNumber = PhoneNumber.parse(value,
          callerCountry: isoCodeConversionMap[viewModel.userCountryCode])
      .international;

  viewModel.util.notify();
}
