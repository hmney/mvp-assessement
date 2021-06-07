import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mvp_assessement/core/auth/controllers/auth_controller.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final AppBar _appBarWidget = AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        icon: Icon(
          PhosphorIcons.equals,
          color: Colors.black,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Icon(
            PhosphorIcons.bellLight,
            color: Colors.black,
          ),
        )
      ],
    );
    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBarWidget,
      body: null,
      bottomNavigationBar: _CustomBottomNavigationBarWidget(),
      drawer: _CustomDrwaerWidget(),
      drawerEnableOpenDragGesture: false,
    );
  }
}

class _CustomBottomNavigationBarWidget extends StatefulWidget {
  const _CustomBottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  __CustomBottomNavigationBarWidgetState createState() =>
      __CustomBottomNavigationBarWidgetState();
}

class __CustomBottomNavigationBarWidgetState
    extends State<_CustomBottomNavigationBarWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedIconTheme: IconThemeData(color: _themeData.accentColor),
      unselectedIconTheme: IconThemeData(color: _themeData.primaryColor),
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Icon(PhosphorIcons.houseSimpleLight),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(PhosphorIcons.usersLight),
          label: 'Team',
        ),
        BottomNavigationBarItem(
          icon: Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: _themeData.accentColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              PhosphorIcons.plusLight,
              color: Colors.white,
            ),
          ),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(PhosphorIcons.chartPieSliceLight),
          label: 'Statistics',
        ),
        BottomNavigationBarItem(
          icon: Icon(PhosphorIcons.airplaneTiltLight),
          label: 'Leaves',
        )
      ],
    );
  }
}

class _CustomDrwaerWidget extends StatelessWidget {
  const _CustomDrwaerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            TextButton(
              onPressed: () => Modular.get<AuthController>().signOut(),
              child: Text('Sign out'),
            )
          ],
        ),
      ),
    );
  }
}
