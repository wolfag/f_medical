import 'package:f_medical/data/model/topic.model.dart';
import 'package:f_medical/data/topic_storage.dart';
import 'package:f_medical/pages/reminder_page.dart';
import 'package:f_medical/utils/theme.dart';
import 'package:f_medical/widgets/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

final topicsStorage = AssetTopicStorage();

class ChooseTopicPage extends StatelessWidget {
  const ChooseTopicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = context.orientation;

    return Scaffold(
      body: SafeArea(
        child: ResponsiveBuilder(
          portrait: Column(
            children: const [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: _Header(),
              ),
              Flexible(
                flex: 3,
                child: _TopicGrid(),
              ),
            ],
          ),
          landscape: Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Column(
                  children: const [
                    Expanded(child: _Header()),
                    Spacer(),
                  ],
                ),
              ),
              const Flexible(
                flex: 2,
                child: _TopicGrid(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(flex: 3),
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'What bring you',
                      style: PrimaryFont.bold(28),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'to Silent Moon?',
                      style: PrimaryFont.light(28),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Flexible(
            flex: 1,
            child: FittedBox(
              alignment: Alignment.centerLeft,
              child: Text(
                'choose a topic to focus on:',
                style: PrimaryFont.light(28)
                    .copyWith(color: const Color(0xFFA1A4B2)),
              ),
            ),
          ),
          const Spacer(flex: 2)
        ],
      ),
    );
  }
}

class _TopicGrid extends StatelessWidget {
  const _TopicGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
      future: topicsStorage.load(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        final topics = snapshot.data!;
        return MasonryGridView.count(
          crossAxisCount: 2,
          itemCount: topics.length,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            final topic = topics[index];

            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '$ReminderPage');
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: topic.bgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return SvgPicture.asset(
                          topic.thumbnail,
                          width: constraints.maxWidth,
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        topic.title,
                        style: PrimaryFont.bold(
                                context.screenSize.shortestSide * 0.04)
                            .copyWith(
                          color: topic.textColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
