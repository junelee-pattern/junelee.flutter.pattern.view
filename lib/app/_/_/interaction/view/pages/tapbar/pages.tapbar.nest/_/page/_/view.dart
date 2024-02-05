import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../vm/_/vm.dart';
import 'config/params.dart';
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
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    // 뒤로 가기 버튼 숨기기
                    floating: true,
                    pinned: true,
                    expandedHeight: 200.0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Column(
                        mainAxisSize: MainAxisSize.min,
                        // image + text
                        children: [
                          Container(
                            height: 130,
                            child: Image.asset(
                              Assets.image.iu.path,
                            ),
                          ),
                          Text(
                            "상단 위젯",
                          ),
                        ],
                      ),
                    ),
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(48.0), // TabBar의 높이
                      child: Material(
                        child: TabBar(
                          tabs: [
                            Tab(icon: Icon(Icons.list)),
                            Tab(icon: Icon(Icons.grid_on)),
                            Tab(icon: Icon(Icons.directions_bike)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: <Widget>[
                  // ListView 탭
                  ListView.builder(
                    itemCount: 30,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text('리스트 아이템 $index'),
                      );
                    },
                  ),
                  // GridView 탭
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: 30,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Center(
                          child: Text('그리드 아이템 $index'),
                        ),
                      );
                    },
                  ),
                  // 다른 컨텐츠 탭
                  Center(child: Text('자전거 탭')),
                ],
              ),
            ),
          ),
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
