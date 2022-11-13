// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:explore/core/models/countries_model.dart';
import 'package:flutter/material.dart';

import 'package:explore/constant/constant.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../shared/shared.dart';
import '../../details/details.dart';

class ListOfCountries extends StatelessWidget {
  final List<List<CountryModel>> countriesValues;
  final List<String> countriesKeys;
  final int index;
  const ListOfCountries({
    Key? key,
    required this.countriesValues,
    required this.countriesKeys,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          countriesKeys[index],
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: AppColor.lightGreyColor,
              ),
        ),
        const YMargin(10),
        for (int i = 0; i < countriesValues[index].length; i++)
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(
                        country: countriesValues[index][i],
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Hero(
                      tag: countriesValues[index][i].flags!.png!,
                      child: CachedNetworkImage(
                        imageUrl: countriesValues[index][i].flags!.png!,
                        imageBuilder: (context, imageProvider) => Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => Center(
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: NetworkImage(
                                  countriesValues[index][i].flags!.png!,
                                ),
                              ),
                            ),
                          )
                              .animate(
                                  onPlay: (controller) => controller.repeat())
                              .shimmer(
                                curve: Curves.slowMiddle,
                                color: Theme.of(context)
                                    .cardColor
                                    .withOpacity(0.6),
                                duration: const Duration(seconds: 1),
                              ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    const XMargin(10),
                    Expanded(
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(countriesValues[index][i].name!.common!,
                                style: Theme.of(context).textTheme.bodyText1),
                            const YMargin(5),
                            if (countriesValues[index][i].capital!.isNotEmpty)
                              Text(
                                countriesValues[index][i].capital!.first,
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: AppColor.lightGreyColor,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                              ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const YMargin(10),
            ],
          ),
      ],
    );
  }
}
