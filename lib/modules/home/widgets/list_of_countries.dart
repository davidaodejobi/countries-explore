import 'package:explore/constant/constant.dart';
import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../details/details.dart';

class ListOfCountries extends StatelessWidget {
  const ListOfCountries({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'A',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: AppColor.lightGreyColor,
              ),
        ),
        const YMargin(10),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Details(),
              ),
            );
          },
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const XMargin(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Country Name',
                      style: Theme.of(context).textTheme.bodyText1),
                  const YMargin(5),
                  Text(
                    'Country Capital',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          // fontWeight: FontWeight.w300,
                          color: AppColor.lightGreyColor,
                        ),
                  ),
                ],
              )
            ],
          ),
        ),
        const YMargin(10),
      ],
    );
  }
}
