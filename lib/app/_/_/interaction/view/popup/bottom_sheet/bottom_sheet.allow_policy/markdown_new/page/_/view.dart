import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../vm/_/vm.dart';
import 'config/params.dart';
import 'util/navigator.dart';
import 'util/view_skeleton.dart';

class V extends StatefulWidget {
  const V({super.key, this.heroKey, this.tag, required this.params});

  final Key? heroKey;
  final String? tag;
  final NewMarkdownTempleteParams params;

  @override
  State<V> createState() => _VState();
}

class _VState extends State<V> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewMarkdownTempleteVM>(
      tag: widget.tag,
      autoRemove: false,
      builder: (vmNewMarkdownTemplete) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(tr("NewMarkdownTempleteMarkDownMarkDownPage")),
          ),
          body: Markdown(
            data: '''
# Minimal Markdown Test
---
This is a simple Markdown test. Provide a text string with Markdown tags
to the Markdown widget and it will display the formatted output in a scrollable
widget.

## Section 1
Maecenas eget **arcu egestas**, mollis ex vitae, posuere magna. Nunc eget
 aliquam tortor. Vestibulum porta sodales efficitur. Mauris interdum turpis
 eget est condimentum, vitae porttitor diam ornare.

### Subsection A
Sed et massa finibus, blandit massa vel, vulputate velit. Vestibulum vitae
venenatis libero. ***Curabitur sem lectus, feugiat eu justo in, eleifend
accumsan ante.*** Sed a fermentum elit. Curabitur sodales metus id mi ornare,
in ullamcorper magna congue.
''',
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: FloatingActionButtonKit(),
        ),
      ),
    );
  }
}

main() async {
  return await startApp(callAfterBuild: (context) async {
    NewMarkdownTempleteNavigator(NewMarkdownTempleteParams(), tag: "someTag")
        .movePage(context, transition: Transition.fadeIn);
    // NewMarkdownTempleteNavigator(NewMarkdownTempleteParams(), tag: "someTag").movePageOffAllWithLoadingView(context);
  });
}
