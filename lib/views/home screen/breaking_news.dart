import 'package:flutter/material.dart';
import 'package:news24/Global%20Widgets/news_item_list.dart';
import 'package:news24/utlis/colors.dart';

import '../../model/news_model.dart';
import '../../services/api_services.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiServices.getBreakingNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<NewsModel> articleList = snapshot.data ?? [];
            return ListView.builder(
              itemCount: articleList.length,
              itemBuilder: (context, index) {
              return NewsItemList(newsModel: articleList[index],);
            },);
          }


          return Center(child: CircularProgressIndicator(color: AppColors.primaryColor,));
        },
      ),
    );
  }
}