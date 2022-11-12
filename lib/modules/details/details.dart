// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:explore/constant/helper/helper.dart';
import 'package:explore/core/models/countries_model.dart';
import 'package:explore/modules/details/widgets/widgets.dart';
import 'package:explore/shared/margin.dart';

class Details extends StatelessWidget {
  final CountryModel country;
  const Details({
    Key? key,
    required this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: Theme.of(context).textTheme.headline4!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
        ),
      ),
      body: ListView(
        children: [
          Hero(
            tag: country.flags!.png!,
            child: Carousel(
              images: [
                country.flags!.png!,
                country.coatOfArms!.png!,
              ],
            ),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailsText(
                      keey: 'Population: ', value: country.population!.comma)
                  .fixWidget,
              DetailsText(keey: 'Region: ', value: country.region!).fixWidget,
              if (country.capital!.isNotEmpty)
                DetailsText(keey: 'Capital: ', value: country.capital!.first)
                    .fixWidget,
              DetailsText(
                      keey: 'Official name: ', value: country.name!.official!)
                  .fixWidget,
              const YMargin(20),
              DetailsText(
                      keey: 'Official language: ',
                      value: country
                          .languages![country.languages!.keys.toList().first]!)
                  .fixWidget,
              DetailsText(
                      keey: 'Start of the week: ',
                      value: country.startOfWeek!.capitalise)
                  .fixWidget,
              DetailsText(keey: 'Subregion: ', value: country.subregion!)
                  .fixWidget,
              DetailsText(
                      keey: 'Independent: ',
                      value: country.independent! ? 'Yes' : 'No')
                  .fixWidget,
              const YMargin(20),
              DetailsText(keey: 'Area: ', value: country.area!.comma).fixWidget,
              DetailsText(
                      keey: 'Currency: ',
                      value: country
                          .currencies![country.currencies!.keys.toList().first]!
                          .name!)
                  .fixWidget,
              DetailsText(
                      keey: 'currency symbol: ',
                      value: country
                          .currencies![country.currencies!.keys.toList().first]!
                          .symbol!)
                  .fixWidget,
              const YMargin(20),
              DetailsText(keey: 'Time zone: ', value: country.timezones!.first)
                  .fixWidget,
              DetailsText(
                      keey: 'Dialling code: ',
                      value:
                          '${country.idd!.root!}${country.idd!.suffixes!.first}')
                  .fixWidget,
              DetailsText(
                      keey: 'Driving side: ',
                      value: country.car!.side!.capitalise)
                  .fixWidget,
              const YMargin(20),
            ],
          ),
        ],
      ).paddingHorizontal(padding: 16),
    );
  }
}
