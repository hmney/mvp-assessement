import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mvp_assessement/core/auth/controllers/auth_controller.dart';
import 'package:mvp_assessement/modules/home/pages/notifications_page.dart';
import 'package:mvp_assessement/modules/home/pages/search_page.dart';
import 'package:mvp_assessement/modules/home/pages/statistics_page.dart';
import 'package:mvp_assessement/modules/home/pages/projects_page.dart';
import 'package:mvp_assessement/modules/projects/projects_module.dart';
import 'package:mvp_assessement/modules/team/pages/team_member_page.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedNavigationItem = 0;
  static const navigationPages = [
    ProjectsPage(),
    TeamMembersPage(),
    StatisticsPage(),
    SearchPage(),
    NotificationsPage(),
  ];

  void _onSelectedNavigationItemTapped(int index) {
    setState(() {
      _selectedNavigationItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
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
    );

    final _bottomNavigationBar = BottomNavigationBar(
      fixedColor: _themeData.accentColor,
      selectedIconTheme: IconThemeData(color: _themeData.accentColor),
      unselectedIconTheme: IconThemeData(color: _themeData.primaryColor),
      elevation: 8,
      currentIndex: _selectedNavigationItem,
      onTap: _onSelectedNavigationItemTapped,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.shifting,
      items: [
        BottomNavigationBarItem(
          icon: Icon(PhosphorIcons.houseSimpleLight),
          label: 'Home',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(PhosphorIcons.usersLight),
          label: 'Team',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(PhosphorIcons.chartPieSliceLight),
          label: 'Statistics',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(PhosphorIcons.magnifyingGlassLight),
          label: 'Leaves',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(PhosphorIcons.bellLight),
          label: 'Notifications',
          backgroundColor: Colors.white,
        )
      ],
    );
    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBarWidget,
      body: navigationPages.elementAt(_selectedNavigationItem),
      bottomNavigationBar: _bottomNavigationBar,
      drawer: _CustomDrwaerWidget(),
      drawerEnableOpenDragGesture: false,
      floatingActionButton: (_selectedNavigationItem == 0)
          ? FloatingActionButton(
              onPressed: () => ProjectsModule.toCreateNewProjectPage(),
              child: Icon(PhosphorIcons.plus),
            )
          : null,
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
