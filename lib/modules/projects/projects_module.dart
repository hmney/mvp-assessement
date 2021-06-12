import 'package:flutter_modular/flutter_modular.dart';
import 'package:mvp_assessement/constants/naviagtion_type.dart';
import 'package:mvp_assessement/modules/projects/pages/create_new_project_page.dart';
import 'package:mvp_assessement/modules/projects/pages/project_board_page.dart';
import 'package:mvp_assessement/modules/projects/pages/project_ticket_page.dart';

class ProjectsModule extends Module {
  @override
  final List<Bind> binds = [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      PROJECT_BOARD_PAGE,
      child: (context, args) => ProjectBoardPage(),
    ),
    ChildRoute(
      PROJECT_TICKET_PAGE,
      child: (context, args) => ProjectTicketPage(),
    ),
    ChildRoute(
      CREATE_NEW_PROJECT,
      child: (context, args) => CreateNewProjectPage(),
    ),
  ];

  static const PROJECT_BOARD_PAGE = '/project_board';
  static Future toProjectBoardPage(NAVIGATION_TYPE navigationType) async {
    if (navigationType == NAVIGATION_TYPE.PUSH_NAMED) {
      Modular.to.pushNamed(PROJECT_BOARD_PAGE);
    } else if (navigationType == NAVIGATION_TYPE.PUSH_REPLACEMENT_NAMED) {
      Modular.to.pushReplacementNamed(PROJECT_BOARD_PAGE);
    }
  }

  static const PROJECT_TICKET_PAGE = '/project_ticket';
  static Future toProjectTicketPage() =>
      Modular.to.pushNamed(PROJECT_TICKET_PAGE);

  static const CREATE_NEW_PROJECT = '/create_new_project';
  static Future toCreateNewProjectPage() =>
      Modular.to.pushNamed(CREATE_NEW_PROJECT);
}
