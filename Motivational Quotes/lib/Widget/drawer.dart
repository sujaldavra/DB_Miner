import 'package:flutter/material.dart';

drawer({required BuildContext context}) {
  return Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.black,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 55),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=848&q=80'),
                ),
                SizedBox(height: 15),
                Text(
                  "John Doe",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
          ...drawerItem
              .map((e) => ListTile(
                    onTap: () {
                      if (e.title == "By Topic") {
                        Arguments args =
                            Arguments(title: "Category", isAuthorCat: false);
                        Navigator.of(context).pushNamed(
                            'category_or_author_page',
                            arguments: args);
                      } else if (e.title == "By Author") {
                        Arguments args =
                            Arguments(title: "Author", isAuthorCat: true);
                        Navigator.of(context).pushNamed(
                            'category_or_author_page',
                            arguments: args);
                      }
                    },
                    leading: e.icon,
                    title: Text(e.title),
                  ))
              .toList(),
          const Divider(),
          ...drawerItem2
              .map(
                (e) => ListTile(
                  onTap: () {},
                  leading: e.icon,
                  title: Text(e.title),
                ),
              )
              .toList(),
        ],
      ),
    ),
  );
}

List drawerItem = [
  DrawerItem(
    icon: const Icon(
      Icons.person,
      color: Colors.blueGrey,
    ),
    title: "By Author",
  ),
  DrawerItem(
    icon: const Icon(
      Icons.topic_rounded,
      color: Colors.teal,
    ),
    title: "By Topic",
  ),
  DrawerItem(
    icon: const Icon(
      Icons.star,
      color: Colors.orange,
    ),
    title: "Favourites",
  ),
  DrawerItem(
    icon: const Icon(
      Icons.lightbulb,
      color: Colors.yellow,
    ),
    title: "Quote of the Day",
  ),
  DrawerItem(
    icon: Icon(
      Icons.star_border,
      color: Colors.yellow.shade600,
    ),
    title: "Favourite Pictures",
  ),
  DrawerItem(
    icon: const Icon(
      Icons.video_collection_sharp,
      color: Colors.red,
    ),
    title: "Videos",
  ),
];

List drawerItem2 = [
  DrawerItem(
      icon: const Icon(
        Icons.settings,
        color: Colors.black,
      ),
      title: "Settings"),
  DrawerItem(
      icon: const Icon(
        Icons.share,
        color: Colors.black,
      ),
      title: "Share"),
  DrawerItem(
      icon: const Icon(
        Icons.rate_review,
        color: Colors.black,
      ),
      title: "Rate"),
  DrawerItem(
      icon: const Icon(
        Icons.feedback,
        color: Colors.black,
      ),
      title: "Feedback"),
  DrawerItem(
      icon: const Icon(
        Icons.search_sharp,
        color: Colors.black,
      ),
      title: "Our other apps"),
  DrawerItem(
      icon: const Icon(
        Icons.info_outline,
        color: Colors.black,
      ),
      title: "About"),
];

class DrawerItem {
  final Icon icon;
  final String title;

  DrawerItem({
    required this.icon,
    required this.title,
  });
}

class Arguments {
  final String title;
  final bool isAuthorCat;

  Arguments({required this.title, required this.isAuthorCat});
}
