import 'package:flutter/material.dart';
import 'package:mvp_assessement/core/auth/widgets/logo_widget.dart';
import 'package:mvp_assessement/widgets/custom_spacer_widget.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          children: [
            OnboardingTemplate(
              title: 'Build your winning team',
              description: 'Connect & develop your team easier',
              imagePath: 'assets/images/onboarding/group_call.png',
            ),
            OnboardingTemplate(
              title: 'Stay  organized with team',
              description:
                  'Follow projects every stage. You know where work stands and can keep everyone aligned on goals',
              imagePath: 'assets/images/onboarding/working.png',
            ),
            OnboardingTemplate(
              title: 'Keep project on track',
              description:
                  'Get your things done with ease, work better together with your teams',
              imagePath: 'assets/images/onboarding/brainstorming.png',
              lastPage: true,
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingTemplate extends StatelessWidget {
  const OnboardingTemplate({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
    this.lastPage,
  }) : super(key: key);

  final String title;
  final String description;
  final String imagePath;
  final bool? lastPage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LogoWidget(
            width: 170,
            height: 50,
          ),
          CustomSpacer(
            minHeight: 20,
          ),
          _OnboardingImageWidget(
            label: imagePath,
          ),
          CustomSpacer(
            minHeight: 20,
          ),
          _OnboardingTitleWidget(label: title),
          SizedBox(height: 10),
          _OnboardingDescriptionWidget(label: description),
          CustomSpacer(
            minHeight: 20,
          ),
          (lastPage == true)
              ? _CustomStadiumButtonWidget(
                  label: 'GET STARTED',
                )
              : _OnboardingNavigationButtonsWidget()
        ],
      ),
    );
  }
}

class _OnboardingImageWidget extends StatelessWidget {
  const _OnboardingImageWidget({Key? key, required this.label})
      : super(key: key);
  final String label;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Image(
        image: AssetImage(label),
      ),
    );
  }
}

class _OnboardingTitleWidget extends StatelessWidget {
  const _OnboardingTitleWidget({Key? key, required this.label})
      : super(key: key);

  final String label;
  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: _themeData.textTheme.headline4?.copyWith(
          fontWeight: FontWeight.w900,
          color: _themeData.primaryColor,
        ),
      ),
    );
  }
}

class _OnboardingDescriptionWidget extends StatelessWidget {
  const _OnboardingDescriptionWidget({Key? key, required this.label})
      : super(key: key);

  final String label;
  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);

    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: _themeData.textTheme.bodyText1?.copyWith(
          color: Color(0xFF5D6D84),
        ),
      ),
    );
  }
}

class _OnboardingNavigationButtonsWidget extends StatelessWidget {
  const _OnboardingNavigationButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Skip',
          style: _themeData.textTheme.button?.copyWith(
            fontWeight: FontWeight.bold,
            color: Color(0xFF5D6D84),
          ),
        ),
        FloatingActionButton(
          onPressed: () {},
          child: Icon(
            PhosphorIcons.arrowRightLight,
          ),
        ),
      ],
    );
  }
}

class _CustomStadiumButtonWidget extends StatelessWidget {
  const _CustomStadiumButtonWidget({Key? key, required this.label, this.width})
      : super(key: key);

  final String label;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(shape: StadiumBorder()),
        child: Text(
          label,
        ),
      ),
    );
  }
}
