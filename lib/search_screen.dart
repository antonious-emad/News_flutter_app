import 'package:flutter/material.dart';
import 'package:fourth/news_card_item.dart';
import 'package:fourth/shared/network/remote/api_manager.dart';
import 'package:fourth/shared/styles/colors.dart';

import 'models/news_response.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "SearchRoute";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController changTextController = TextEditingController();
  Future<NewsResponse>? _futureArticles;

  @override
  void initState() {
    super.initState();
    _futureArticles =
        _fetchArticles(""); // Initially fetch all or empty results
  }

  Future<NewsResponse> _fetchArticles(String query) {
    return ApiManager()
        .getArticles(requestParameter: "q", stringOfRequestParameter: query);
  }

  void _onSearchChanged(String query) {
    setState(() {
      _futureArticles = _fetchArticles(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // The background pattern
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/pattern.png"),
              ),
            ),
          ),
          // Custom AppBar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 120, // Adjust height as needed
              decoration: BoxDecoration(
                color: Colors.green, // Your desired AppBar color
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: changTextController,
                          onChanged: _onSearchChanged,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide:
                                  BorderSide(color: appbarcolor, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide:
                                  BorderSide(color: appbarcolor, width: 2),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.clear_outlined,
                                  color: appbarcolor, size: 30),
                            ),
                            suffixIcon: const Icon(Icons.search_rounded,
                                color: appbarcolor),
                            hintText: "Search Article",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                          cursorColor: appbarcolor,
                          cursorHeight: 20,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: appbarcolor, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.only(top: 100),
            // Ensure it starts below the AppBar
            child: FutureBuilder<NewsResponse>(
              future: _futureArticles,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(color: appbarcolor));
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Error occurred: ${snapshot.error}",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: Colors.black),
                    ),
                  );
                } else if (!snapshot.hasData ||
                    snapshot.data!.articles!.isEmpty) {
                  return Center(
                    child: Text(
                      "No articles found. Try searching for something else.",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: Colors.black),
                    ),
                  );
                } else {
                  return buildListView(snapshot.data!.articles!);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListView(List<Articles> articles) => ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) => NewsCardItem(articles[index]),
      );
}
