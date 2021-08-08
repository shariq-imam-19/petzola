
import 'package:flutter/cupertino.dart';
import 'package:petzola/generated/l10n.dart';

import 'exception_indicator.dart';

/// Indicates that no items were found.
class EmptyListIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>  ExceptionIndicator(
        title: S.of(context).noResultFound,
        message: S.of(context).emptyListMessage,
        assetName: 'assets/images/empty-box.png',
      );
}
