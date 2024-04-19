import 'package:bloc_simple/feature/home/view/home_view.dart';
import 'package:bloc_simple/feature/todos/presentation/view/todos_view.dart';
import 'package:flutter/material.dart';

class BaseScreenView extends StatefulWidget {
  const BaseScreenView({super.key});

  @override
  State<BaseScreenView> createState() => _BaseScreenViewState();
}

class _BaseScreenViewState extends State<BaseScreenView> {
  int pageIndex = 0;
  final _items = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.access_alarm,
        ),
        label: 'Tgb'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.face,
        ),
        label: 'Alkn'),
  ];

  final _widgets = <Widget>[
    const HomeView(),
    const TodosView(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgets.elementAt(pageIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        onTap: (value) => setState(() {
          pageIndex = value;
        }),
      ),
    );
  }
}
