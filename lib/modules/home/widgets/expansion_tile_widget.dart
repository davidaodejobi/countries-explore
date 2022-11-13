import 'package:explore/constant/constant.dart';
import 'package:explore/modules/home/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({
    Key? key,
    required this.listOfFilters,
    required this.onTap,
    required this.hasExpanded,
    required this.title,
  }) : super(key: key);

  final List<String> listOfFilters;
  final VoidCallback onTap;
  final bool hasExpanded;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title.capitalise,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const XMargin(8.0),
                Icon(
                  hasExpanded
                      ? Icons.expand_less_rounded
                      : Icons.expand_more_rounded,
                  color: Theme.of(context).iconTheme.color,
                )
              ],
            ),
          ),
        ),
        if (hasExpanded)
          AnimatedContainer(
            duration: const Duration(
              milliseconds: 100,
            ),
            curve: Curves.slowMiddle,
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              itemCount: listOfFilters.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          listOfFilters[index].capitalise,
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                        const XMargin(8.0),
                        CheckBoxWidget(check: true, function: () {})
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
