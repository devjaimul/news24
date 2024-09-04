import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news24/model/news_model.dart';
import 'package:news24/utlis/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utlis/colors.dart';

class DetailScreen extends StatelessWidget {
  final NewsModel newsModel;
  const DetailScreen({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HeadingTwo(data:newsModel.title.toString() ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 12),
          child: Card(
            color: Colors.blue.shade50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                  child: CachedNetworkImage(
                    height: Get.height * .25,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    imageUrl: newsModel.urlToImage.toString(),
                    placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        )),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                child: HeadingThree(data: newsModel.source!.name.toString()),
                              )),
                          const SizedBox(width: 8,),
                          HeadingFour(data: DateFormat('MM/dd/yy EEE hh:mm a').format(DateTime.parse(newsModel.publishedAt.toString()))),
                        ],
                      ),
                      const SizedBox(height: 8,),
                      HeadingFour(data:newsModel.author==null?"": "Written by : ${newsModel.author}",number: 1,),
                      const SizedBox(height: 8,),
                      HeadingFour(data: newsModel.title.toString()),
                      const SizedBox(height: 8,),
                      HeadingFour(data: newsModel.description.toString(),),
                      const SizedBox(height: 8,),
                      HeadingFour(data: newsModel.content.toString(),),
                      const SizedBox(height: 15,),
                      Center(child: ElevatedButton(onPressed: ()async{
                        final Uri uri=Uri.parse(newsModel.url.toString());

                        if(await launchUrl(uri)){
                          throw Exception("Couldn't Found");
                        }
                      },
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                        child: const HeadingThree(data: 'Read More...'),))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
