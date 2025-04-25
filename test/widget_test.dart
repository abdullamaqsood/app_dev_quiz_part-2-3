import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:app_dev_quiz2/blocs/product_bloc.dart';
import 'package:app_dev_quiz2/screens/product_card.dart';

void main() {
  group('ProductCard Golden Test', () {
    goldenTest(
      'renders ProductCard on Pixel 6',
      fileName: 'product_card',
      builder: () => GoldenTestGroup(
        scenarioConstraints: const BoxConstraints(
          maxWidth: 560,
          maxHeight: 950,
        ),
        children: [
          GoldenTestScenario(
            name: 'ProductCard UI - Pixel 6',
            child: BlocProvider(
              create: (_) => ProductBloc(),
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData.dark(),
                home: Scaffold(
                  backgroundColor: Colors.black,
                  body: ProductCard(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  });
}
