import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Widget/drawer.dart';
import 'package:flutter_app/Helpers/db_helper.dart';
import 'package:flutter_app/Modals/modals.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: drawer(context: context),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu, color: Colors.black),
          );
        }),
        title: const Text(
          "Life quotes",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: Colors.yellow.shade800),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite, color: Colors.red),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                future: DBHelper.dbHelper
                    .fetchLatestQuotes(tableName: 'latestQuotes'),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error:${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    List<QuotesDB> data = snapshot.data as List<QuotesDB>;

                    return InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('details_page', arguments: data[index]);
                      },
                      child: CarouselSlider(
                        options: CarouselOptions(
                          onPageChanged: (val, _) {
                            index = val;
                          },
                          viewportFraction: 0.9,
                          autoPlayInterval: const Duration(seconds: 4),
                          autoPlay: true,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        ),
                        items: data.map((e) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(e.image),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.6),
                                    BlendMode.hardLight),
                              ),
                            ),
                            child: Text(
                              e.quote,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.alike(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        CatOrAuthArgs args = CatOrAuthArgs(
                            title: 'Categories', isAuthorCat: false);

                        Navigator.of(context).pushNamed(
                            'category_or_author_page',
                            arguments: args);
                      },
                      child: quotes(
                        color: const Color(0xffA45584),
                        icon: Icons.grid_view,
                        text: "Categories",
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Arguments args = Arguments(
                            title: 'Pic', isAuthCat: false, name: 'success');
                        Navigator.of(context)
                            .pushNamed('quotes_page', arguments: args);
                      },
                      child: quotes(
                        color: const Color(0xff7589C8),
                        icon: Icons.image_outlined,
                        text: "Pic Quotes",
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Arguments args = Arguments(
                            title: 'Latest', isAuthCat: false, name: 'wisdom');
                        Navigator.of(context)
                            .pushNamed('quotes_page', arguments: args);
                      },
                      child: quotes(
                        color: const Color(0xffB99041),
                        icon: Icons.sunny,
                        text: "Latest",
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Arguments args = Arguments(
                            title: 'Articles',
                            isAuthCat: false,
                            name: 'business');
                        Navigator.of(context)
                            .pushNamed('quotes_page', arguments: args);
                      },
                      child: quotes(
                        color: const Color(0xff6C9978),
                        icon: Icons.menu_book_sharp,
                        text: "Articles",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Most Popular",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Arguments args = Arguments(
                            title: 'Success',
                            isAuthCat: false,
                            name: 'success');
                        Navigator.of(context)
                            .pushNamed('quotes_page', arguments: args);
                      },
                      child: category(
                          height: height,
                          category: 'Success',
                          context: context),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Arguments args = Arguments(
                            title: 'Wisdom', isAuthCat: false, name: 'wisdom');
                        Navigator.of(context)
                            .pushNamed('quotes_page', arguments: args);
                      },
                      child: category(
                          height: height, category: 'Wisdom', context: context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Arguments args = Arguments(
                            title: 'Love', isAuthCat: false, name: 'love');
                        Navigator.of(context)
                            .pushNamed('quotes_page', arguments: args);
                      },
                      child: category(
                          height: height, category: 'Love', context: context),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Arguments args = Arguments(
                            title: 'Happiness',
                            isAuthCat: false,
                            name: 'happiness');
                        Navigator.of(context)
                            .pushNamed('quotes_page', arguments: args);
                      },
                      child: category(
                          height: height,
                          category: 'Happiness',
                          context: context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "Quotes by Category",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      CatOrAuthArgs args = CatOrAuthArgs(
                          title: 'Categories', isAuthorCat: false);

                      Navigator.of(context).pushNamed('category_or_author_page',
                          arguments: args);
                    },
                    child: const Text(
                      "View All >",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.orange,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Arguments args = Arguments(
                            title: 'Ambition',
                            isAuthCat: false,
                            name: 'ambition');
                        Navigator.of(context)
                            .pushNamed('quotes_page', arguments: args);
                      },
                      child: category(
                          height: height,
                          category: 'Ambition',
                          context: context),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Arguments args = Arguments(
                            title: 'Business',
                            isAuthCat: false,
                            name: 'business');
                        Navigator.of(context)
                            .pushNamed('quotes_page', arguments: args);
                      },
                      child: category(
                          height: height,
                          category: 'Business',
                          context: context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Arguments args = Arguments(
                            title: 'Friendship',
                            isAuthCat: false,
                            name: 'friendship');
                        Navigator.of(context)
                            .pushNamed('quotes_page', arguments: args);
                      },
                      child: category(
                          height: height,
                          category: 'Friendship',
                          context: context),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Arguments args = Arguments(
                            title: 'Humor', isAuthCat: false, name: 'humor');
                        Navigator.of(context)
                            .pushNamed('quotes_page', arguments: args);
                      },
                      child: category(
                          height: height, category: 'Humor', context: context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CatOrAuthArgs {
  final String title;
  final bool isAuthorCat;

  CatOrAuthArgs({
    required this.title,
    required this.isAuthorCat,
  });
}

class Arguments {
  final String title;
  final String name;
  final bool isAuthCat;

  Arguments({required this.title, required this.isAuthCat, required this.name});
}

Widget category(
    {required double height,
    required String category,
    required BuildContext context}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.150,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.softLight,
            ),
            fit: BoxFit.cover,
            image: NetworkImage(
              "https://source.unsplash.com/random/?background,$category",
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 5, top: 3),
        child: Text(
          "$category Quotes",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      )
    ],
  );
}

Widget quotes(
    {required Color color, required IconData icon, required String text}) {
  return Container(
    height: 90,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          height: 50,
          width: 50,
          child: Icon(icon, color: Colors.white, size: 26),
        ),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
