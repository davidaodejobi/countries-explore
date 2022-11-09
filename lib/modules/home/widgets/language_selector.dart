import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../l10n/l10n.dart';
import '../view_model/locale_provider.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context, listen: false);
    return DropdownButtonHideUnderline(
        child: DropdownButton(
      icon: Icon(
        Icons.language,
        color: Theme.of(context).iconTheme.color,
      ),
      onChanged: (_) {},
      items: L10n.all
          .map(
            (locale) => DropdownMenuItem(
              onTap: () {
                provider.changeLocale(Locale(locale.languageCode));
              },
              value: locale.languageCode,
              child: Text(
                locale.languageCode.toUpperCase(),
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          )
          .toList(),
    ));
  }
}
