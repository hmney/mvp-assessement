import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:mvp_assessement/modules/projects/projects_module.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';

class ProjectBoardPage extends StatefulWidget {
  const ProjectBoardPage({Key? key}) : super(key: key);

  @override
  _ProjectBoardPageState createState() => _ProjectBoardPageState();
}

class _ProjectBoardPageState extends State<ProjectBoardPage> {
  Future<List<dynamic>> get getBoardData async {
    var jsonText =
        await rootBundle.loadString('assets/data/project_board.json');
    return json.decode(jsonText);
  }

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    final _appBar = AppBar(
      backgroundColor: Colors.black.withOpacity(0.1),
      elevation: 0.1,
      title: Text('Board view'),
      actions: [
        PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              child: TextButton(
                onPressed: () {},
                child: Text('Add a column'),
              ),
            ),
          ],
        )
      ],
    );

    return Scaffold(
      backgroundColor: _themeData.primaryColor,
      appBar: _appBar,
      body: FutureBuilder<List<dynamic>>(
        future: getBoardData,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          var data = snapshot.data!;
          return Swiper(
            loop: false,
            itemCount: data.length,
            viewportFraction: 0.9,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _BoardColumnWidget(
                  boardColumnTitle: data[index]['column_title'],
                  boardColumnTickets: data[index]['column_tickets'],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _BoardColumnWidget extends StatelessWidget {
  const _BoardColumnWidget({
    Key? key,
    required this.boardColumnTitle,
    required this.boardColumnTickets,
  }) : super(key: key);

  final String boardColumnTitle;
  final List boardColumnTickets;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _BoardColumnTitleWidget(
          label: boardColumnTitle,
        ),
        _BoardColumnTicketsWidget(
          boardTickets: boardColumnTickets,
        ),
        _AddTicketToBoardColumn(),
      ],
    );
  }
}

class _BoardColumnTitleWidget extends StatelessWidget {
  const _BoardColumnTitleWidget({Key? key, required this.label})
      : super(key: key);

  final String label;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class _BoardColumnTicketsWidget extends StatelessWidget {
  const _BoardColumnTicketsWidget({Key? key, required this.boardTickets})
      : super(key: key);

  final List<dynamic> boardTickets;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: boardTickets.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => ProjectsModule.toProjectTicketPage(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                title: Text(boardTickets[index]['ticket_title']),
                trailing: IconButton(
                  icon: Icon(
                    PhosphorIcons.dotsThreeVerticalLight,
                  ),
                  onPressed: () => PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: TextButton(
                          onPressed: () {},
                          child: Text('Move to next column'),
                        ),
                      ),
                      PopupMenuItem(
                        child: TextButton(
                          onPressed: () {},
                          child: Text('Move to another column'),
                        ),
                      ),
                      PopupMenuItem(
                        child: TextButton(
                          onPressed: () {},
                          child: Text('Remove from Board'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AddTicketToBoardColumn extends StatelessWidget {
  const _AddTicketToBoardColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => null,
          style:
              ElevatedButton.styleFrom(primary: Colors.black.withOpacity(0.5)),
          child: Row(
            children: [
              Icon(PhosphorIcons.plusLight),
              SizedBox(width: 20),
              Text('Add a card'),
            ],
          ),
        ),
      ),
    );
  }
}
