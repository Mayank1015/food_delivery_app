import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery/model/restaurant.dart';
import 'package:food_delivery/services/db_helper.dart';
import 'package:food_delivery/services/cart_provider.dart';

DBHelper? db = DBHelper();

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        title: const Text(
          "Your cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: cart.getData(),
        builder: (context, AsyncSnapshot<List<MenuItem>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.data!.isEmpty) {
              return const Center(
                  child: Text(
                'Nothing here...',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ));
            } else if (snapshot.hasData) {
              return ListView.separated(
                itemCount: snapshot.data!.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      showMyBottomSheet(snapshot.data![index], context);
                    },
                    child: Container(
                      height: 100,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child:
                                  Image.network(snapshot.data![index].imageUrl),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data![index].name.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      letterSpacing: 0.5,
                                      color: Colors.black),
                                ),
                                Text(
                                  "\$${snapshot.data![index].price}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                db!.deleteFromCart(snapshot.data![index].name);
                                cart.newTotalDecrement(
                                    snapshot.data![index].price);
                                cart.refresh();
                              },
                              icon: const Icon(
                                Icons.delete_outline_rounded,
                                color: Colors.redAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (ctx, idx) {
                  return const Divider(
                    thickness: 0.5,
                    color: Colors.redAccent,
                  );
                },
              );
            } else {
              return Text('Error2: ${snapshot.error}');
            }
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        height: 100,
        child: Column(
          children: [
            Consumer<CartProvider>(builder: (context, value, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Grand Total: ',
                    style: TextStyle(
                        // fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3),
                  ),
                  Text(
                    r'$' + value.getTotalPrice().toStringAsFixed(2),
                    style: const TextStyle(
                        // fontSize: 22
                        ),
                  ),
                ],
              );
            }),
            const SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () { },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Place Order",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    fontSize: 18,
                  ),
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
        });
  }
}
