import 'package:flutter/material.dart';
import 'package:explore/constant/helper/helper.dart';

import 'widgets/carousel.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Carousel(),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Country $index'),
                );
              },
            ),
          ),
        ],
      ).paddingHorizontal(padding: 16),
    );
  }
}
