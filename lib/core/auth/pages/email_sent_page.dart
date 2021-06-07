import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mvp_assessement/widgets/custom_elevated_button_widget.dart';

class EmailSentPage extends StatelessWidget {
  const EmailSentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            _EmailSentImageWidget(),
            Spacer(),
            _EmailSentPageTitleWidget(),
            SizedBox(height: 10),
            _EmailSentPageSubtitleWidget(),
            Spacer(),
            CustomElevatedButtonWidget(
              width: 220,
              onPressed: () => Modular.to.pop(),
              label: 'GO BACK',
            ),
            Spacer(),
            _EmailNotReceivedWidget(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class _EmailSentImageWidget extends StatelessWidget {
  const _EmailSentImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      width: 220,
      height: 220,
      image: AssetImage('assets/images/email_sent.png'),
    );
  }
}

class _EmailSentPageTitleWidget extends StatelessWidget {
  const _EmailSentPageTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);

    return Align(
        alignment: Alignment.center,
        child: Text(
          'Check your mail',
          style: _themeData.textTheme.headline5?.copyWith(
              fontWeight: FontWeight.w600, color: _themeData.primaryColor),
        ));
  }
}

class _EmailSentPageSubtitleWidget extends StatelessWidget {
  const _EmailSentPageSubtitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    return Text(
      'We have sent a password recover instructions to your email.',
      textAlign: TextAlign.center,
      style: _themeData.textTheme.subtitle1
          ?.copyWith(color: Color(0xff5D6D84), fontWeight: FontWeight.w500),
    );
  }
}

class _EmailNotReceivedWidget extends StatelessWidget {
  const _EmailNotReceivedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: _themeData.textTheme.caption?.copyWith(
          color: Color(0xff5D6D84),
        ),
        text: 'Did not receive the email? Check your spam filter, or ',
        children: [
          TextSpan(
            text: 'try another email address',
            style: _themeData.textTheme.caption?.copyWith(
                color: _themeData.accentColor, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
