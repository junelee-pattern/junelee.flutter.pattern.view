import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../vm/_/vm.dart';
import 'config/params.dart';
import 'user_action/typing_text_field.dart';
import 'user_action/when_confirm_input.dart';
import 'util/navigator.dart';
import 'util/view_skeleton.dart';

class V extends StatefulWidget {
  const V({super.key, this.heroKey, this.tag, required this.params});

  final Key? heroKey;
  final String? tag;
  final NewParams params;

  @override
  State<V> createState() => _VState();
}

class _VState extends State<V> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewVM>(
      tag: widget.tag,
      autoRemove: false,
      builder: (vmNew) => SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Form(
            key: vmNew.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(60),
                Text(tr("Input your email."))
                    .textStyle(Theme.of(context).textTheme.titleLarge!)
                    .fontWeight(FontWeight.bold),
                TextFormField(
                  controller: vmNew.textEditController,
                  cursorColor: Colors.black,
                  focusNode: vmNew.myFocusNode,
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (value) {
                    if (vmNew.formKey.currentState!.validate()) {
                      whenConfirmInputUserAction(
                          context, widget.tag, vmNew.textEditController.text);
                    }
                  },
                  decoration: InputDecoration(
                    // labelText: 'nickname',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 12),
                    hintText: 'example@mail.com',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    errorStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 12.0,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),

                    // contentPadding: EdgeInsets.symmetric(
                    //     vertical: 15.0, horizontal: 15.0),
                  ),
                  style: Theme.of(context).textTheme.bodyLarge!,
                  validator: (value) {
                    if (value == null || value.length < 15) {
                      return 'already exist email';
                    }
                    return null;
                  },
                  onChanged: (String value) {
                    TypingTextFieldUserAction(context, widget.tag, value);
                  },
                ),
                Spacer(),
                OutlinedButton(
                  onPressed: !vmNew.inputButtonEnabled
                      ? null
                      : () {
                          if (vmNew.formKey.currentState!.validate()) {
                            whenConfirmInputUserAction(context, widget.tag,
                                vmNew.textEditController.text);
                          }
                        },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: BorderSide(
                        color: Theme.of(context).textTheme.bodyMedium!.color!,
                        width: 2), // 테두리 색상과 두께 설정
                  ),
                  child: Text("Confirm")
                      .fontWeight(FontWeight.bold)
                      .textColor(Theme.of(context).textTheme.bodyMedium!.color!)
                      .padding(vertical: 20, horizontal: 20),
                )
                    .padding(
                      vertical: 7,
                    )
                    .width(double.infinity)
                    .opacity(vmNew.inputButtonEnabled ? 1 : 0.2),
                Gap(10),
              ],
            ).paddingSymmetric(horizontal: 30),
          ),
          floatingActionButton: FloatingActionButtonKit(),
        ),
      ),
    );
  }
}

main() async {
  return await startApp(callAfterBuild: (context) async {
    NewNavigator(NewParams(), tag: "someTag")
        .movePage(context, transition: Transition.fadeIn);
    // NewNavigator(NewParams(), tag: "someTag").movePageOffAllWithLoadingView(context);
  });
}
