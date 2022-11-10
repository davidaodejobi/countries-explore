// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:explore/modules/details/widgets/widgets.dart';
import 'package:explore/shared/margin.dart';
import 'package:flutter/material.dart';

import 'package:explore/constant/helper/helper.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: ListView(
        children: [
          const Carousel(),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              DetailsText(keey: 'Population: ', value: '1.3 billion'),
              DetailsText(keey: 'Region: ', value: '1.3 billion'),
              DetailsText(keey: 'Capital: ', value: '1.3 billion'),
              DetailsText(keey: 'Motto: ', value: '1.3 billion'),
              YMargin(20),
              DetailsText(keey: 'Official language: ', value: '1.3 billion'),
              DetailsText(keey: 'Ethic group: ', value: '1.3 billion'),
              DetailsText(keey: 'Religion: ', value: '1.3 billion'),
              DetailsText(keey: 'Government: ', value: '1.3 billion'),
              YMargin(20),
              DetailsText(keey: 'Independence: ', value: '1.3 billion'),
              DetailsText(keey: 'Area: ', value: '1.3 billion'),
              DetailsText(keey: 'Currency: ', value: '1.3 billion'),
              DetailsText(keey: 'GDP: ', value: '1.3 billion'),
              YMargin(20),
              DetailsText(keey: 'Time zone: ', value: '1.3 billion'),
              DetailsText(keey: 'Date format: ', value: '1.3 billion'),
              DetailsText(keey: 'Dialling code: ', value: '1.3 billion'),
              DetailsText(keey: 'Driving side: ', value: '1.3 billion'),
              YMargin(20),
            ],
          ),
        ],
      ).paddingHorizontal(padding: 16),
    );
  }
}
