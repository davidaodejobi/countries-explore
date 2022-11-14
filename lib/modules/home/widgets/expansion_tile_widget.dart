// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:explore/constant/constant.dart';
import 'package:provider/provider.dart';

import '../../../shared/shared.dart';
import '../view_model/home_provider.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({
    Key? key,
    required this.listOfFilters,
    required this.onTap,
    required this.hasExpanded,
    required this.title,
  }) : super(key: key);

  final List<Map<String, dynamic>> listOfFilters;
  final VoidCallback onTap;
  final bool hasExpanded;
  final String title;
  // final VoidCallback onCheckBoxTap;
  // final int i;

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
        // if (hasExpanded)
        AnimatedContainer(
          duration: const Duration(
            milliseconds: 1000,
          ),
          curve: Curves.easeInOut,
          height: hasExpanded ? MediaQuery.of(context).size.height * 0.3 : 0,
          child: ListView.builder(
            itemCount: listOfFilters.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      listOfFilters[index]['key'].toString().capitalise,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    const XMargin(8.0),
                    // CheckBoxWidget(
                    //   check: listOfFilters[index]['selected'],
                    //   function: ,
                    // ),
                    Consumer<HomeProvider>(builder: (_, value, __) {
                      //TODO: Fix custom checkbox issue
                      // return CheckBoxWidget(
                      //   check: listOfFilters[index]['selected'],
                      //   function: () {
                      //     log('hello0000000000');
                      //     // value.toggleFilterTracker(index);
                      //   },
                      // );
                      return Checkbox(
                          value: listOfFilters[index]['selected'],
                          onChanged: (_) {
                            value.toggleFilterTracker(index);
                          });
                    }),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
