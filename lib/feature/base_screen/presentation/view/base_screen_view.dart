import 'package:bloc_simple/feature/home/view/home_view.dart';
import 'package:bloc_simple/feature/todos/presentation/view/todos_view.dart';
import 'package:bloc_simple/feature/users/presentation/view/users_view.dart';
import 'package:flutter/material.dart';

class BaseScreenView extends StatelessWidget {
  BaseScreenView({super.key});

  final _pageIndex = ValueNotifier<int>(1);

  final _items = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        activeIcon: Icon(Icons.home_outlined),
        label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.access_alarm,
        ),
        label: 'Tugba'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.face,
        ),
        activeIcon: Icon(Icons.face_outlined),
        label: 'Alkn'),
  ];

  final _widgets = <Widget>[
    const HomeView(),
    const TodosView(),
    const UsersView(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _pageIndex,
      builder: (context, state, _) {
        return Scaffold(
          body: _widgets.elementAt(state),
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: _items,
            currentIndex: state,
            onTap: (value) {
              _pageIndex.value = value;
            },
          ),
        );
      },
    );
  }
}
