// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:texter/helpers.dart';
import 'package:texter/theme.dart';

import '../model/model.dart';
import '../widgets/widgets.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _Stories(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, index) {
              return Text("data");
            },
          ),
        ),
      ],
    );
  }
}

class _Stories extends StatelessWidget {
  const _Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff252132),
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      child: SizedBox(
        height: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                bottom: 8,
                top: 8,
              ),
              child: Text(
                'Stories',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.cardLight),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final faker = Faker();
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 64,
                        child: _StoryCard(
                          storyData: StoryData(
                              name: faker.person.name(),
                              url: Helpers.randomPictureUrl()),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard({
    Key? key,
    required this.storyData,
  }) : super(key: key);

  final StoryData storyData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Avatar.medium(url: storyData.url),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              storyData.name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 11,
                  letterSpacing: 0.5,
                  color: Color.fromARGB(255, 228, 228, 228)
                  //fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
