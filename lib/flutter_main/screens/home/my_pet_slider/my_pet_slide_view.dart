import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:petzola/flutter_main/common/model/pet.dart';
import 'package:petzola/flutter_main/common/res/dimen_const.dart';
import 'package:petzola/flutter_main/screens/home/my_pet_slider/pet_slide_view_item.dart';

import 'add_pet_slide_view_item.dart';

class MyPetSlideView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyPetSlideViewState();
  }
}

class MyPetSlideViewState extends State<MyPetSlideView> {
  final _pagingController = PagingController<int, Pet>(
    firstPageKey: 0,
  );

  @override
  void initState() {
    // _fetchPage(0);
    //   _pagingController.addPageRequestListener((pageKey) {
    //     _fetchPage(pageKey);
    //   });
    //   super.initState();
    // }
    //
    // Future<void> _fetchPage(int pageKey) async {
    //   final nextPageKey = pageKey + 1;
    //   Provider.of<MyPetModel>(context).getUserPets(
    //     onSuccess: (response) {
    //       _pagingController.appendLastPage((response as List));
    //
    //     },
    //     onError: (error) {
    //       _pagingController.error = error;
    //     },
    //   );

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
            Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Dimen.inner_boundary_field_space_wide),
                child: Text(
                  "My Pets",
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      .copyWith(color: Color(0xff2b3e4f)),
                )),
            renderPetsList()
          ],
        ),
      ),
    );
  }

  // renderPetsList() {
  //   return Container(
  //     height: (MediaQuery
  //         .of(context)
  //         .size
  //         .height *
  //         Dimen.home_section_height_ration) *
  //         .7,
  //     alignment: Alignment.center,
  //     child:  PagedListView.separated(
  //       // itemExtent: 300.0,
  //       pagingController: _pagingController,
  //       builderDelegate: PagedChildBuilderDelegate<Pet>(
  //         itemBuilder: (context, pet, index) {
  //           return  PetSlideViewItem(pet: pet,);
  //         },
  //         // firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
  //         //   error: _pagingController.error,
  //         //   onTryAgain: () => _pagingController.refresh(),
  //         // ),
  //         // noItemsFoundIndicatorBuilder: (context) => EmptyListIndicator(),
  //       ),
  //       padding: const EdgeInsets.all(16),
  //       separatorBuilder: (context, index) => const SizedBox(
  //         height: 16,
  //       ),
  //     )
  //   );
  //
  // }

  renderPetsList() {
    return Container(
      height: (MediaQuery.of(context).size.height *
              Dimen.home_section_height_ration) *
          .7,
      alignment: Alignment.center,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          AddPetSlideViewItem(),
          PetSlideViewItem(),
          PetSlideViewItem()
        ],
      ),
    );
    // return PagedListView.separated(
    //   itemExtent: 300.0,
    //   pagingController: _pagingController,
    //   builderDelegate: PagedChildBuilderDelegate<Pet>(
    //     itemBuilder: (context, pet, index) {
    //       return  PetSlideViewItem(pet);
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
