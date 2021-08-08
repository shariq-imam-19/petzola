import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:petzola/flutter_main/common/res/dimen_const.dart';
import 'package:petzola/flutter_main/common/widgets/custom_action_button.dart';
import 'package:petzola/flutter_main/screens/home/model/offer.dart';

class OffersSlidersView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OffersSlidersViewState();
  }
}

class _OffersSlidersViewState extends State<OffersSlidersView> {
  final _pagingController = PagingController<int, Offer>(
    firstPageKey: 0,
  );

  @override
  void initState() {
    // _fetchPage(0);
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    final nextPageKey = pageKey + 1;
    // HomeModel().getOffers(
    //   onSuccess: (response) {
    //     if ((response as List).length > 0) {}
    //     _pagingController.appendLastPage((response as List));
    //     // _pagingController.appendPage(features, nextPageKey);
    //   },
    //   onError: (error) {
    //     _pagingController.error = error;
    //   },
    // );

    // final newItems =
    //     await widget.repository.getArticleListPage(number: pageKey, size: 8);
    //
    // /// todo get object containg list of items and if it is last page;
    // final isLastPage = newPage.isLastPage(); // todo
    //
    // if (isLastPage) {
    //   _pagingController.appendLastPage(newItems);
    // } else {
    //   final nextPageKey = pageKey + 1;
    //   _pagingController.appendPage(newItems, nextPageKey);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height:
          MediaQuery.of(context).size.height * Dimen.home_section_height_ration,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Special offers
            Text(
              "Special Offers",
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  .copyWith(color: Color(0xff2b3e4f)),
            ),
            renderTransactionList()
          ],
        ),
      ),
    );
  }

  renderTransactionList() {
    return Container(
        width: MediaQuery.of(context).size.width * .72,
        height: MediaQuery.of(context).size.height * .18,
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: const Color(0x29a09494),
                  offset: Offset(0, 22),
                  blurRadius: 44,
                  spreadRadius: 0)
            ],
            color: const Color(0xfff47920).withOpacity(
              0.10000000149011612,
            )),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 30% offers
                Text("30% Offers",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Color(0xfff47920)),
                    textAlign: TextAlign.left),
                // Check for deals For today
                Text("Check for deals For Today",
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(fontSize: 12, color: Color(0xfff47920)),
                    textAlign: TextAlign.left),
                CustomActionButton(
                    context: context,
                    width: MediaQuery.of(context).size.width * .3,
                    height: MediaQuery.of(context).size.height * .05,
                    fontSize: 16,
                    btnColor: Color(0xfff47920),
                    btnText: "getOffer")
              ],
            )
          ],
        ));
    // return PagedListView.separated(
    //   itemExtent: 300.0,
    //   pagingController: _pagingController,
    //   builderDelegate: PagedChildBuilderDelegate<FixJedNotification>(
    //     itemBuilder: (context, notification, index) {
    //       return NotificationItemView(notification: notification);
    //     },
    //     firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
    //       error: _pagingController.error,
    //       onTryAgain: () => _pagingController.refresh(),
    //     ),
    //     noItemsFoundIndicatorBuilder: (context) => EmptyListIndicator(),
    //   ),
    //   padding: const EdgeInsets.all(16),
    //   separatorBuilder: (context, index) => const SizedBox(
    //     height: 16,
    //   ),
    // );
  }
}
