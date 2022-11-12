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
                      keey: 'Population: ',
                      value: country.population!.comma.fix)
                  .fixWidget,
              DetailsText(keey: 'Region: ', value: country.region!.fix)
                  .fixWidget,
              if (country.capital!.isNotEmpty)
                DetailsText(
                        keey: 'Capital: ', value: country.capital!.first.fix)
                    .fixWidget,
              DetailsText(
                      keey: 'Official name: ',
                      value: country.name!.official!.fix)
                  .fixWidget,
              const YMargin(20),
              DetailsText(
                      keey: 'Official language: ',
                      value: country
                          .languages![country.languages!.keys.toList().first]!
                          .fix)
                  .fixWidget,
              DetailsText(
                      keey: 'Start of the week: ',
                      value: country.startOfWeek!.capitalise.fix)
                  .fixWidget,
              DetailsText(keey: 'Subregion: ', value: country.subregion!.fix)
                  .fixWidget,
              DetailsText(
                      keey: 'Independent: ',
                      value: country.independent! ? 'Yes' : 'No')
                  .fixWidget,
              const YMargin(20),
              DetailsText(keey: 'Area: ', value: country.area!.comma.fix)
                  .fixWidget,
              DetailsText(
                      keey: 'Currency: ',
                      value: country
                          .currencies![country.currencies!.keys.toList().first]!
                          .name!
                          .fix)
                  .fixWidget,
              DetailsText(
                      keey: 'currency symbol: ',
                      value: country
                          .currencies![country.currencies!.keys.toList().first]!
                          .symbol!
                          .fix)
                  .fixWidget,
              const YMargin(20),
              DetailsText(
                      keey: 'Time zone: ', value: country.timezones!.first.fix)
                  .fixWidget,
              DetailsText(
                      keey: 'Dialling code: ',
                      value:
                          '${country.idd!.root!}${country.idd!.suffixes!.first.fix}')
                  .fixWidget,
              DetailsText(
                      keey: 'Driving side: ',
                      value: country.car!.side!.capitalise.fix)
                  .fixWidget,
              const YMargin(20),
            ],
          ),
        ],
      ).paddingHorizontal(padding: 16),
    );
  }
}

//number with commas
extension NumberComma on num {
  String get comma => toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]},',
      );
}

//capitalise first letter
extension Capitalise on String {
  String get capitalise => '${this[0].toUpperCase()}${substring(1)}';
}

extension NullFix on String? {
  String get fix {
    if (this == null) {
      return 'N/A';
    }
    return this!;
  }
}

extension NullFixWidget on Widget? {
  Widget get fixWidget {
    if (this == null) {
      return const SizedBox.shrink();
    }
    return this!;
  }
}
