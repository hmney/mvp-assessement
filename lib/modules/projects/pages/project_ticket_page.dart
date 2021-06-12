import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mvp_assessement/widgets/project_ticket_status_chip_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProjectTicketPage extends StatelessWidget {
  const ProjectTicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () => Modular.to.pop(),
                      icon: Icon(
                        PhosphorIcons.xLight,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ProjectTicketStatusChipWidget(
                      chipColor: Color(0xFFFF6B00),
                      chipTitle: "In Progress",
                    ),
                  ),
                  _TicketTitleWidget(),
                  SizedBox(height: 20),
                  _TicketDescriptionWidget(),
                  SizedBox(height: 20),
                  _TicketAttachementsWidget(),
                  SizedBox(height: 20),
                  _TicketChecklistWidget(),
                  SizedBox(height: 20),
                  _TicketTeamMemberWidget(),
                  SizedBox(height: 20),
                  _TicketGeneralInformationWidget(),
                  SizedBox(height: 20),
                  _TicketDiscussionAndHistoryWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TicketTitleWidget extends StatelessWidget {
  const _TicketTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    return Text(
      'Title of the ticket here',
      style: _themeData.textTheme.headline4
          ?.copyWith(color: _themeData.primaryColor),
    );
  }
}

class _TicketDescriptionWidget extends StatelessWidget {
  const _TicketDescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);

    return Text(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Consequat consectetur vel placerat semper diam id risus. Nulla placerat egestas eu dui massa risus faucibus ac. Tincidunt ac arcu facilisis vestibulum risus vel semper. At urna convallis ut venenatis eleifend fermentum, est. Sed massa, vulputate consectetur eu augue nibh tortor, tincidunt faucibus. Gravida enim urna ultrices non interdum faucibus. Nisl placerat vel.",
      style: _themeData.textTheme.bodyText1?.copyWith(
        color: Color(0xFF606060),
      ),
    );
  }
}

class _TicketAttachementsWidget extends StatelessWidget {
  const _TicketAttachementsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Attachments',
          style: themeData.textTheme.subtitle2,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, index) => SizedBox(width: 20),
            itemCount: 4,
            itemBuilder: (_, index) => Container(
              width: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/attachements/attachement${index + 1}.jpg',
                  ),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TicketChecklistWidget extends StatelessWidget {
  const _TicketChecklistWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Checklist',
          style: themeData.textTheme.subtitle2,
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: LinearPercentIndicator(
            percent: 0.6,
            progressColor: Color(0xFF0ACF83),
            backgroundColor: Color(0xFFDDDDDD),
            padding: EdgeInsets.zero,
          ),
        ),
        for (var index = 0; index < 5; index++)
          CheckboxListTile(
            value: true,
            onChanged: (value) {},
            controlAffinity: ListTileControlAffinity.leading,
            title: Text('Id laoreet duis mauris quam pretium.'),
            contentPadding: EdgeInsets.zero,
          ),
      ],
    );
  }
}

class _TicketTeamMemberWidget extends StatelessWidget {
  const _TicketTeamMemberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Team members',
          style: themeData.textTheme.subtitle2,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            for (var index = 0; index < 4; index++)
              Container(
                margin: EdgeInsets.only(right: 2),
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/people/user${index + 1}.jpg',
                    ),
                  ),
                  shape: BoxShape.circle,
                ),
              ),
          ],
        )
      ],
    );
  }
}

class _TicketGeneralInformationWidget extends StatelessWidget {
  const _TicketGeneralInformationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'General informations',
            style: themeData.textTheme.subtitle2,
          ),
        ),
        SizedBox(height: 10),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              decoration: BoxDecoration(),
              children: [
                Text(
                  'Created by',
                  style: themeData.textTheme.caption,
                ),
                Text(
                  'Created on',
                  style: themeData.textTheme.caption,
                ),
              ],
            ),
            TableRow(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Houssame',
                    style: themeData.textTheme.subtitle2,
                  ),
                ),
                Text(
                  '10 January 2021',
                  style: themeData.textTheme.subtitle2,
                ),
              ],
            ),
            TableRow(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Start date',
                    style: themeData.textTheme.caption,
                  ),
                ),
                Text(
                  'Due date',
                  style: themeData.textTheme.caption,
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  '12 January 2021',
                  style: themeData.textTheme.subtitle2,
                ),
                Text(
                  '19 January 2021',
                  style: themeData.textTheme.subtitle2,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class _TicketDiscussionAndHistoryWidget extends StatelessWidget {
  const _TicketDiscussionAndHistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _DiscussionAndHisotryTabBarWidget(
          selectedTab: 0,
        ),
        SizedBox(width: double.infinity, child: Divider()),
        SizedBox(
          height: 300,
          child: Swiper(
            itemCount: 2,
            loop: false,
            itemBuilder: (context, index) => index == 0
                ? _DiscussionContentWidget()
                : _HistoryContentWidget(),
          ),
        ),
      ],
    );
  }
}

class _DiscussionAndHisotryTabBarWidget extends StatelessWidget {
  const _DiscussionAndHisotryTabBarWidget({Key? key, required this.selectedTab})
      : super(key: key);

  final int selectedTab;
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          child: GestureDetector(
            onTap: null,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: (selectedTab == 0)
                      ? BorderSide(color: themeData.primaryColor, width: 3)
                      : BorderSide.none,
                ),
              ),
              child: Text(
                'Discussion',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: (selectedTab == 0)
                      ? themeData.primaryColor
                      : themeData.primaryColor.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Flexible(
          flex: 1,
          child: GestureDetector(
            onTap: null,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: (selectedTab == 1)
                      ? BorderSide(color: themeData.primaryColor, width: 3)
                      : BorderSide.none,
                ),
              ),
              child: Text(
                'History',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: (selectedTab == 1)
                      ? themeData.primaryColor
                      : themeData.primaryColor.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
        Spacer(flex: 2),
      ],
    );
  }
}

class _DiscussionContentWidget extends StatelessWidget {
  const _DiscussionContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var index = 0; index < 5; index++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/people/user${Random().nextInt(3) + 1}.jpg',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Jack Miller'),
                          Text('01:25 pm'),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet in elementum facilisi et vestibulum blandit sagittis, amet. Mattis purus.',
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
      ],
    );
  }
}

class _HistoryContentWidget extends StatelessWidget {
  const _HistoryContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
