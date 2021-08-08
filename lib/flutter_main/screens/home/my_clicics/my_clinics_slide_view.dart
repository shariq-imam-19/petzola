import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:petzola/flutter_main/common/model/pet.dart';
import 'package:petzola/flutter_main/common/res/dimen_const.dart';
import 'package:petzola/flutter_main/common/widgets/see_all_btn_view.dart';
import 'package:petzola/generated/l10n.dart';

import 'my_clinic_slide_view_item.dart';
import 'my_clinic_tab_view.dart';

class MyClinicsSlideView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyClinicsSlideViewState();
  }
}

class MyClinicsSlideViewState extends State<MyClinicsSlideView> {
  final _pagingController = PagingController<int, Pet>(
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
      height: MediaQuery.of(context).size.height *
          Dimen.home_section_height_ration *
          1.5,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      child: Text(
                        S.current.myClinics,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(color: Color(0xff2b3e4f)),
                      ),
                      margin: EdgeInsets.symmetric(
                          vertical: Dimen.list_separator_space),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/icons/ic_add.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                SeeAllBtnView()
              ],
            ),
            MyClinicTabView(),
            renderTransactionList()
          ],
        ),
      ),
    );
  }

  renderTransactionList() {
    return Container(
      height: (MediaQuery.of(context).size.height *
              Dimen.home_section_height_ration) *
          .9,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
              color: const Color(0x29a09494),
              offset: Offset(0, 10),
              blurRadius: 44,
              spreadRadius: 0)
        ],
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [MyClinicSlideViewItem(), MyClinicSlideViewItem()],
      ),
    );
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
