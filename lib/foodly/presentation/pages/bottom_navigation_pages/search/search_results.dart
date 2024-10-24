import 'package:flutter/material.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/models/search_results.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/constants.dart';
import 'package:foodly_clean_arc/generated/assets.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    List<SearchResultModel> searchResultsList150 = [
      SearchResultModel(
          image: Assets.searchResultsSearchresults1,
          name: "Banana",
          height: 150),
      SearchResultModel(
          image: Assets.searchResultsSearchresults1,
          name: "Banana",
          height: 150),
      SearchResultModel(
          image: Assets.searchResultsSearchresults1,
          name: "Banana",
          height: 150),
      SearchResultModel(
          image: Assets.searchResultsSearchresults1,
          name: "Banana",
          height: 150),
      SearchResultModel(
          image: Assets.searchResultsSearchresults1,
          name: "Banana",
          height: 150),
    ];
    List<SearchResultModel> searchResultsList200 = [
      SearchResultModel(
          image: Assets.searchResultsSearchresults1,
          name: "Banana",
          height: 240),
      SearchResultModel(
          image: Assets.searchResultsSearchresults1,
          name: "Banana",
          height: 220),
      SearchResultModel(
          image: Assets.searchResultsSearchresults1,
          name: "Banana",
          height: 290),
      SearchResultModel(
          image: Assets.searchResultsSearchresults1,
          name: "Banana",
          height: 200),
      SearchResultModel(
          image: Assets.searchResultsSearchresults1,
          name: "Banana",
          height: 200),
    ];

    List<Widget> getSearchResultsList150() {
      List<Widget> searchResultList150 = [];
      for (var i = 0; i < searchResultsList150.length; i++) {
        searchResultList150.add(SearchResultWidget(
          image: searchResultsList150[i].image,
          name: searchResultsList150[i].name,
          height: searchResultsList150[i].height,
        ));
      }
      return searchResultList150;
    }

    List<Widget> getSearchResultsList200() {
      List<Widget> searchResultList200 = [];
      for (var i = 0; i < searchResultsList150.length; i++) {
        searchResultList200.add(SearchResultWidget(
          image: searchResultsList200[i].image,
          name: searchResultsList200[i].name,
          height: searchResultsList200[i].height,
        ));
      }
      return searchResultList200;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
        title: const Text(
          'Burger',
          style: kTitleTextStyle,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kBlackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          addVerticalSpacing(20),
          const Text(
            '80 search results found',
            style: kBlackText,
          ),
          addVerticalSpacing(20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  children: getSearchResultsList150(),
                ),
              ),
              addHorizontalSpacing(20),
              Expanded(
                child: Column(
                  children: getSearchResultsList200(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
