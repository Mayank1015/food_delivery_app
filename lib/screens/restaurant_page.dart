import 'package:flutter/material.dart';
import 'package:food_delivery/model/restaurant.dart';
import 'package:food_delivery/screens/menu_list_page.dart';
import 'package:food_delivery/components/custom_divider.dart';

class RestaurantPage extends StatelessWidget {
  final DetailedRestaurant resData;
  const RestaurantPage({Key? key, required this.resData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text(
          resData.name,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: 0.7,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MenuListPage(resData: resData),
                  ),
                );
              },
              icon: Icon(Icons.menu_book_rounded))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                resData.imageUrl,
                width: double.infinity,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  resData.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  " |  ${resData.ratings}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 25,
                ),
              ],
            ),
            Text(
              resData.cuisineType,
              style: const TextStyle(
                color: Colors.black54,
              ),
            ),
            Text(
              resData.address,
              style: const TextStyle(
                color: Colors.black54,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const CustomDividerWithText(
              label: "Menu",
            ),
            for (final menu in resData.menu)
              InkWell(
                onTap: () {
                  showMyBottomSheet(menu, context);
                },
                child: ListTile(
                  title: Text(
                    menu.name,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent),
                  ),
                  subtitle: Text(
                    menu.description,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  trailing: Text(
                    "\$ ${menu.price}",
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
            const CustomDividerWithText(label: "Restaurant Reviews"),
            for (final review in resData.reviews)
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.red.shade400,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.person,
                    color: Colors.red.shade50,
                  ),
                ),
                title: Text(
                  "@${review.username}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                subtitle: Text(
                  review.comment,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black45,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  showMyBottomSheet(MenuItem menuData, BuildContext ctx) {
    return showModalBottomSheet(
      showDragHandle: true,
      backgroundColor: Colors.white,
      context: ctx,
      builder: (ctx) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      menuData.imageUrl,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: double.infinity,
                      color: Colors.black38,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            menuData.name,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "| \$ ${menuData.price}",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Description",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.redAccent,
                    decorationStyle: TextDecorationStyle.dashed,
                    letterSpacing: 0.3,
                    color: Colors.redAccent),
              ),
              Text(
                menuData.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
