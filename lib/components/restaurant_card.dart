import 'package:flutter/material.dart';
import 'package:food_delivery/model/restaurant.dart';
import 'package:food_delivery/screens/restaurant_page.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({Key? key, required this.resData}) : super(key: key);
  final DetailedRestaurant resData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantPage(resData: resData),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        width: double.infinity,
        height: 100,
        decoration: const BoxDecoration(),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                resData.imageUrl,
                height: 80,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    resData.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    resData.cuisineType,
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "${resData.ratings}",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
