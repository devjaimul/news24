import 'package:flutter/material.dart';
import 'package:news24/utlis/colors.dart';
import 'package:news24/utlis/text_style.dart';
import 'package:news24/views/home%20screen/all_news.dart';
import 'package:news24/views/home%20screen/breaking_news.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const HeadingTwo(data: 'News24'),
            bottom: TabBar(
                labelColor: Colors.white, // Text color
                unselectedLabelColor: Colors.white, // Unselected text color
                indicatorColor: AppColors.primaryColor,
                tabs: const [
                  Tab(
                    text: 'Breaking News',
                  ),
                  Tab(
                    text: 'All News',
                  ),
                ]),
          ),
          body: const TabBarView(children: [
            BreakingNews(),
            AllNews(),
          ]),
        ));
  }
}
