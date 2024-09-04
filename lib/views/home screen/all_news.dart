import 'package:flutter/material.dart';

import '../../Global Widgets/news_item_list.dart';
import '../../model/news_model.dart';
import '../../services/api_services.dart';
import '../../utlis/colors.dart';

class AllNews extends StatelessWidget {
  const AllNews({super.key});

  @override
  Widget build(BuildContext context) {
    ApiServices apiServices = ApiServices();
    return Scaffold(
      body: FutureBuilder(
        future: apiServices.getAllNews(),
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
