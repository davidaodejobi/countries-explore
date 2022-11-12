// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:explore/core/core.dart';
import 'package:flutter/material.dart';

import 'package:explore/shared/shared.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import 'view_model/home_provider.dart';
import 'widgets/widgets.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomAppbar(),
            Consumer(builder: (context, AppTheme value, child) {
              return SizedBox(
                height: 40.0,
                child: TextField(
                  controller: provider.searchController,
                  onChanged: (value) {
                    provider.searchCountries(value);
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        // horizontal: 16.0,
                        // vertical: .0,
                        ),
                    hintText: 'Search',
                    hintStyle: Theme.of(context).textTheme.headline6!.copyWith(
                        color: value.isDarkTheme
                            ? Theme.of(context).iconTheme.color
                            : AppColor.lightGreyColor,
                        fontWeight: FontWeight.w300,
                        height: 0.5),
                    prefixIcon: Icon(
                      Icons.search,
                      color: value.isDarkTheme
                          ? Theme.of(context).iconTheme.color
                          : AppColor.lightGreyColor,
                      size: 18.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: value.isDarkTheme
                        ? AppColor.darkPlanetBgColor.withOpacity(0.2)
                        : AppColor.lightGreyColor2,
                  ),
                ),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OptionButton(
                  icon: Icons.language,
                  onTap: () {
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        context: context,
                        builder: (context) {
                          var languages = [
                            'English',
                            'French',
                            'Spanish',
                            'German',
                            'Italian',
                            'Portuguese',
                            'Russian',
                            'Chinese',
                            'Japanese',
                            'Korean',
                            'Arabic',
                            'Hindi',
                            'Turkish',
                            'Dutch',
                            'Polish',
                          ];
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Language',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                  const ModalCloseButton()
                                ],
                              ),
                              const YMargin(8.0),
                              Expanded(
                                child: ListView(
                                  children: [
                                    for (var language in languages)
                                      RadioListTile(
                                        visualDensity: const VisualDensity(
                                          horizontal:
                                              VisualDensity.minimumDensity,
                                          vertical:
                                              VisualDensity.minimumDensity,
                                        ),
                                        value: language,
                                        groupValue: languages,
                                        onChanged: (value) {},
                                        title: Text(
                                          'English',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ).paddingAll(
                            padding: 16.0,
                          );
                        });
                  },
                  text: 'EN',
                ),
                OptionButton(
                  icon: Icons.filter_alt_outlined,
                  onTap: () {
                    // groupCountries();
                  },
                  text: 'Filter',
                ),
              ],
            ),
            const YMargin(10),
            Expanded(
              child: provider.status == Status.loading
                  ? Column(children: [
                      if (provider.status == Status.loading)
                        const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      if (provider.status == Status.error)
                        const Center(
                          child: Text('Error'),
                        ),
                    ])
                  : Stack(
                      children: [
                        ListView.builder(
                          controller: provider.scrollController,
                          itemCount: provider.countriesKeys.length,
                          itemBuilder: (context, index) {
                            return ListOfCountries(
                              countriesKeys: provider.countriesKeys,
                              countriesValues: provider.countriesValues,
                              index: index,
                            );
                          },
                        ),
                        Positioned(
                          right: 10,
                          child: ScrollButton(
                              onPressed: () {
                                provider.scrollToTop();
                              },
                              icon: Icons.arrow_upward),
                        ),
                        Positioned(
                          right: 10,
                          bottom: 16,
                          child: ScrollButton(
                              onPressed: () {
                                provider.scrollToBottom();
                              },
                              icon: Icons.arrow_downward),
                        )
                      ],
                    ),
            ),

            /*
              FutureBuilder(
                future: provider.getFiles(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Stack(
                      children: [
                        ListView.builder(
                          controller: provider.scrollController,
                          itemCount: provider.countriesKeys.length,
                          itemBuilder: (context, index) {
                            return ListOfCountries(
                              countriesKeys: provider.countriesKeys,
                              countriesValues: provider.countriesValues,
                              index: index,
                            );
                          },
                        ),
                        Positioned(
                          right: 10,
                          child: ScrollButton(
                              onPressed: () {
                                provider.scrollToTop();
                              },
                              icon: Icons.arrow_upward),
                        ),
                        Positioned(
                          right: 10,
                          bottom: 16,
                          child: ScrollButton(
                              onPressed: () {
                                provider.scrollToBottom();
                              },
                              icon: Icons.arrow_downward),
                        )
                      ],
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return const Center(
                      child: Text('No data'),
                    );
                  }
                },
              ),
              */
          ],
        ).paddingHorizontal(padding: 16),
      ),
    );
  }
}
