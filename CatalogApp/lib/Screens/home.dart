import 'package:demo_1/models/items.dart';
import 'package:demo_1/widgets/drawer.dart';
import 'package:demo_1/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var catalogJSON = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJSON);
    var productsData = decodedData["products"];
    CatalogItem.product = List.from(productsData)
        .map<Items>((item) => Items.fromJson(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogItem.product != null && CatalogItem.product.isNotEmpty)
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final item = CatalogItem.product[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: GridTile(
                      header: Container(
                        child: Text(item.name),
                        decoration: BoxDecoration(),
                        padding: const EdgeInsets.all(10),
                      ),
                      child: Image.network(item.image),
                      footer: Text(item.price.toString()),
                    ),
                  );
                },
                itemCount: CatalogItem.product.length,
              )
            : Center(child: CircularProgressIndicator()),
      )),
      drawer: DrawerMenu(),
    );
  }
}
