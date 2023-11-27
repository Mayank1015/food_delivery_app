import 'package:flutter/material.dart';
import 'package:food_delivery/model/data.dart';
import 'package:food_delivery/screens/cart_page.dart';
import 'package:food_delivery/components/restaurant_card.dart';

import 'account_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isFiltersVisible = false;

  final List<String> items = [
    "All",
    "French",
    "Japanese",
    "Indian",
    "Italian",
    "American",
    "Mexican",
    "Mediterranean",
    "Barbecue",
    "Cafe",
  ];

  final List selectedItems = ["All"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Food Delivery App",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFiltersVisible = !isFiltersVisible;
              });
            },
            icon: const Icon(Icons.filter_list_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const UserAccountPage(),
                ),
              );
            },
            icon: const Icon(Icons.account_box_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            cuisineFilter(),
            for (final restaurant in dummyDetailedRestaurants)
              if (selectedItems.contains("All") ||
                  selectedItems.contains(restaurant.cuisineType))
                RestaurantCard(resData: restaurant),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CartPage(),
            ),
          );
        },
        child: const Icon(Icons.shopping_cart_rounded),
      ),
    );
  }

  Widget cuisineFilter() {
    return Visibility(
      visible: isFiltersVisible,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (final item in items)
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (item == "All") {
                      selectedItems.clear();
                      selectedItems.add(item);
                    } else {
                      selectedItems.remove("All");
                      selectedItems.contains(item)
                          ? selectedItems.remove(item)
                          : selectedItems.add(item);
                      if (selectedItems.isEmpty) {
                        selectedItems.add("All");
                      }
                    }
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 6, top: 10),
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 15,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: selectedItems.contains(item)
                          ? Colors.redAccent
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: const Border(
                        bottom: BorderSide(width: 2, color: Colors.redAccent),
                        top: BorderSide(width: 2, color: Colors.redAccent),
                        left: BorderSide(width: 2, color: Colors.redAccent),
                        right: BorderSide(width: 2, color: Colors.redAccent),
                      )),
                  child: Text(
                    item,
                    style: TextStyle(
                      color: selectedItems.contains(item)
                          ? Colors.white
                          : Colors.redAccent,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
