import 'package:flutter/material.dart';

class CategoryOrAuthorPage extends StatefulWidget {
  const CategoryOrAuthorPage({Key? key}) : super(key: key);

  @override
  State<CategoryOrAuthorPage> createState() => _CategoryOrAuthorPageState();
}

class _CategoryOrAuthorPageState extends State<CategoryOrAuthorPage> {
  List<Category> categorie = [
    Category(category: 'business', title: 'Business'),
    Category(category: 'sports', title: 'Sports'),
    Category(category: 'wisdom', title: 'Wisdom'),
    Category(category: 'love', title: 'Love'),
    Category(category: 'motivational', title: 'Motivational'),
    Category(category: 'life', title: 'Life'),
    Category(category: 'friendship', title: 'Friendship'),
    Category(category: 'history', title: 'History'),
    Category(category: 'politics', title: 'Politics'),
    Category(category: 'humor', title: 'Humor'),
    Category(category: 'inspirational', title: 'Inspirational'),
  ];

  List<Category> authors = [
    Category(category: 'elon_musk', title: 'Elon Musk'),
    Category(category: 'chanakya', title: 'Chanakya'),
    Category(category: 'a_p_j_abdul_kalam', title: 'APJ Abdul Kalam'),
    Category(category: 'abraham_lincoln', title: 'Abraham Lincoln'),
    Category(category: 'aristotle', title: 'Aristotle'),
    Category(category: 'albert_einstein', title: 'Albert Einstein'),
    Category(category: 'barack_obama', title: 'Barack Obama'),
    Category(category: 'donald_trump', title: 'Donald Trump'),
    Category(category: 'muhammad_ali', title: 'Muhammad Ali'),
  ];

  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title:
            Text("${res.title}", style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: (res.isAuthorCat) ? authors.length : categorie.length,
        itemBuilder: (context, i) {

          return InkWell(
            onTap: () async {
              Arguments args = Arguments(
                  title: (res.isAuthorCat)
                      ? authors[i].title
                      : categorie[i].title,
                  name: (res.isAuthorCat)
                      ? authors[i].category
                      : categorie[i].category,
                  isAuthCat: res.isAuthorCat);

              Navigator.of(context).pushNamed('quotes_page', arguments: args);
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 60,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black,
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 20,),
                    Text(
                      (res.isAuthorCat)
                          ? authors[i].title
                          : categorie[i].title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const Divider(
                      indent: 200,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Category {
  final String category;
  final String title;

  Category({required this.category, required this.title});
}

class Arguments {
  final String title;
  final String name;
  final bool isAuthCat;

  Arguments({required this.title, required this.isAuthCat, required this.name});
}
