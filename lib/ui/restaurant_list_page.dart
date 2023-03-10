import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/list_provider.dart';
import 'package:restaurant_app/ui/restaurant_search_page.dart';
import 'package:restaurant_app/widget/restaurant_card.dart';

class RestaurantListPage extends StatelessWidget {
  static const String routeName = '/restaurant_list';
  const RestaurantListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListProvider>(
      create: (context) => ListProvider(apiService: (ApiService())),
      child: Scaffold(body: Consumer<ListProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.state == ResultState.hasData) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Restaurant",
                                      style: TextStyle(fontSize: 32.0)),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context,
                                            RestaurantSearchPage.routeName);
                                      },
                                      icon: const Icon(Icons.search))
                                ],
                              ),
                              const Text(
                                "Recomendation restaurant for you!",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.result.restaurants.length,
                        itemBuilder: (context, index) {
                          var list = state.result.restaurants[index];
                          return RestaurantCard(restaurant: list);
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          } else if (state.state == ResultState.noData) {
            return Center(
              child: Material(
                child: Text(state.message),
              ),
            );
          } else if (state.state == ResultState.error) {
            return Center(
              child: Material(
                child: Text(state.message),
              ),
            );
          } else {
            return const Center(
              child: Material(
                child: Text(''),
              ),
            );
          }
        },
      )),
    );
  }
}
