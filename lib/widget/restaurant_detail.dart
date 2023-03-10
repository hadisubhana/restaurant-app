import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/detail_model.dart';

class RestaurantDetail extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantDetail({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
                "https://restaurant-api.dicoding.dev/images/large/${restaurant.pictureId}"),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(restaurant.name,
                            style: const TextStyle(
                                fontSize: 32.0, fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            const Icon(
                              Icons.place_outlined,
                              size: 15.0,
                              color: Colors.black54,
                            ),
                            const SizedBox(width: 5.0),
                            Text(
                              restaurant.city,
                              style: const TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_border_outlined,
                              size: 15.0,
                              color: Colors.black54,
                            ),
                            const SizedBox(width: 5.0),
                            Text(
                              restaurant.rating.toString(),
                              style: const TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.black54,
                          thickness: 0.5,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Description",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5.0),
                              Text(restaurant.description)
                            ]),
                        const Divider(
                          color: Colors.black54,
                          thickness: 0.5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Menus",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text("Foods :"),
                            const SizedBox(height: 5),
                            SizedBox(
                              height: 40,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: restaurant.menus.foods.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    color: Colors.blue[50],
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    margin: const EdgeInsets.only(right: 10.0),
                                    child: Center(
                                        child: Text(restaurant
                                            .menus.foods[index].name)),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Drinks :"),
                            const SizedBox(height: 5),
                            SizedBox(
                              height: 40,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: restaurant.menus.drinks.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    color: Colors.blue[50],
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    margin: const EdgeInsets.only(right: 10.0),
                                    child: Center(
                                        child: Text(restaurant
                                            .menus.drinks[index].name)),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
