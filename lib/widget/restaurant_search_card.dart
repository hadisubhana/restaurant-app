import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/search_model.dart';
import 'package:restaurant_app/ui/restaurant_detail_page.dart';

class RestaurantSearchCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantSearchCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, RestaurantDetailpage.routeName,
              arguments: restaurant.id);
        },
        contentPadding: const EdgeInsets.symmetric(
          vertical: 4.0,
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            "https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}",
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          restaurant.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.place,
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
            const SizedBox(height: 10.0),
            Row(
              children: [
                const Icon(
                  Icons.star,
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
          ],
        ),
      ),
    );
  }
}
