import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery/model/restaurant.dart';
import 'package:food_delivery/services/db_helper.dart';
import 'package:food_delivery/services/cart_provider.dart';

class MenuListPage extends StatefulWidget {
  const MenuListPage({Key? key, required this.resData}) : super(key: key);
  final DetailedRestaurant resData;

  @override
  State<MenuListPage> createState() => _MenuListPageState();
}

class _MenuListPageState extends State<MenuListPage> {
  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        title: Text(
          "${widget.resData.name}'s Menu",
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView.separated(
        itemCount: widget.resData.menu.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              showMyBottomSheet(widget.resData.menu[index]);
            },
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(widget.resData.menu[index].imageUrl),
              ),
              title: Text(
                widget.resData.menu[index].name,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent),
              ),
              subtitle: Text(
                widget.resData.menu[index].description,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
              trailing: Column(
                children: [
                  Text(
                    "\$ ${widget.resData.menu[index].price}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        // add to database
                        MenuItem cart = MenuItem(
                          name: widget.resData.menu[index].name,
                          description: widget.resData.menu[index].description,
                          price: widget.resData.menu[index].price,
                          imageUrl: widget.resData.menu[index].imageUrl,
                        );

                        dbHelper!.insert(cart);
                        // cartProvider.addInCart(cart);
                        cartProvider.newTotalIncrement(
                            widget.resData.menu[index].price);
                      },
                      icon: const Icon(Icons.add),
                      label: const Text("Add"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (ctx, idx) {
          return const Divider(
            thickness: 0.2,
            color: Colors.redAccent,
          );
        },
      ),
    );
  }

  showMyBottomSheet(MenuItem menuData) {
    return showModalBottomSheet(
      showDragHandle: true,
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
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
