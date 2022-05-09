import 'package:f_medical/utils/theme.dart';
import 'package:flutter/material.dart';

const daysOfWeek = ['SU', 'M', 'T', 'W', 'TH', 'F', 'S'];

class ReminderPage extends StatelessWidget {
  const ReminderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Spacer(flex: 1),
            Expanded(
              flex: 2,
              child: _Title(
                title: 'What time would you\nlike to meditate?',
                subtitle:
                    'Anytime you can choose but we recommend\nfirst thing in thee morning',
              ),
            ),
            Expanded(
              flex: 3,
              child: _TimeSelect(),
            ),
            Expanded(
              flex: 2,
              child: _Title(
                title: 'What day would you\nlike to meditate?',
                subtitle:
                    'Everyday is best, but we recommend\npicking at least five.',
              ),
            ),
            Expanded(
              child: _DaySelect(),
            ),
            Expanded(
              flex: 2,
              child: _Buttons(),
            )
          ],
        ),
      ),
    );
  }
}

class _TimeSelect extends StatelessWidget {
  const _TimeSelect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 24),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

class _DaySelect extends StatelessWidget {
  const _DaySelect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(7, (index) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(
                    color: Color(0xffa1a4b2),
                  ),
                ),
                child: Center(child: Text(daysOfWeek[index])),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                'Save',
                style: PrimaryFont.medium(14),
              ),
              color: kColorPrimary,
              textColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(38),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              child: Text(
                'NO THANK',
                style: PrimaryFont.medium(14).copyWith(
                  color: kColorDarkGrey,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: FractionallySizedBox(
              heightFactor: 0.8,
              alignment: Alignment.topLeft,
              child: FittedBox(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: PrimaryFont.bold(24).copyWith(height: 1.35),
                ),
              ),
            ),
          ),
          Expanded(
            child: FractionallySizedBox(
              heightFactor: 0.6,
              alignment: Alignment.topLeft,
              child: FittedBox(
                alignment: Alignment.centerLeft,
                child: Text(
                  subtitle,
                  style: PrimaryFont.light(16).copyWith(
                    color: const Color(0xffa1a4b2),
                    height: 1.65,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
