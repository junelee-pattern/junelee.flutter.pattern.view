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
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewVM>(
      tag: widget.tag,
      autoRemove: false,
      builder: (vmNew) => Scaffold(
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            //textTheme.bodyLarge!.color!,
            selectedItemColor: Theme.of(context).textTheme.bodyLarge!.color!,
            unselectedItemColor:
                Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.4),
            selectedFontSize: 14,
            unselectedFontSize: 14,
            currentIndex: _selectedIndex,
            //현재 선택된 Index
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: [
              //////////////////////////////////////////////////////////////////
              BottomNavigationBarItem(
                label: 'Favorites',
                icon: Icon(Icons.home_filled),
                activeIcon: Icon(
                  Icons.home_filled,
                  color: Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Music',
                icon: Icon(Icons.favorite),
                activeIcon: Icon(
                  Icons.favorite,
                  color: Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Places',
                icon: Icon(Icons.search),
                activeIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              BottomNavigationBarItem(
                label: 'News',
                icon: Icon(Icons.person),
                activeIcon: Icon(
                  Icons.person,
                  color: Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              //////////////////////////////////////////////////////////////////
            ],
          ),
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            //////////////////////////////////////////////////////////////////
            Container().backgroundColor(Colors.red),
            Container().backgroundColor(Colors.blue),
            Container().backgroundColor(Colors.yellow),
            Container().backgroundColor(Colors.green),
            //////////////////////////////////////////////////////////////////
          ],
        ),
        floatingActionButton: FloatingActionButtonKit(
          button1: (context) {
            _selectedIndex = (_selectedIndex + 1) % 4;
            setState(() {});
          },
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
