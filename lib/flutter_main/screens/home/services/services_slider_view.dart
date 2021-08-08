import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:petzola/flutter_main/common/model/pet.dart';
import 'package:petzola/flutter_main/common/res/dimen_const.dart';
import 'package:petzola/flutter_main/common/widgets/see_all_btn_view.dart';
import 'package:petzola/flutter_main/screens/home/services/service_Slide_view_item.dart';
import 'package:petzola/generated/l10n.dart';

class ServicesSliderView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ServicesSliderViewState();
  }
}

class ServicesSliderViewState extends State<ServicesSliderView> {
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
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Special offers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimen.inner_boundary_field_space_wide),
                  child: Text(
                    S.current.pickUpYourService,
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(color: Color(0xff2b3e4f)),
                  ),
                ),
                SeeAllBtnView()
              ],
            ),
            renderPetsList()
          ],
        ),
      ),
    );
  }

  renderPetsList() {
    return Container(
      height: (MediaQuery.of(context).size.height *
          Dimen.home_section_height_ration),
      alignment: Alignment.center,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ServiceSlideViewItem(),
          ServiceSlideViewItem(),
          ServiceSlideViewItem(),
          ServiceSlideViewItem()
        ],
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
