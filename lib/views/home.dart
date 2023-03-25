import 'package:ecommerce/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc/api_bloc.dart';
import '../bloc/bloc/api_state.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Ecommerce"),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                child: Icon(Icons.man),
              ),
              Tab(
                child: Icon(Icons.woman),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 10,
          ),
          child: TabBarView(
            children: <Widget>[
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoaded) {
                    var jew = (state.productModel.where(
                            (element) => element.category == "men's clothing"))
                        .toList();
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 20,
                        crossAxisCount: 2,
                      ),
                      itemCount: state.productModel
                          .where(
                              (element) => element.category == "men's clothing")
                          .length,
                      itemBuilder: (BuildContext ctx, index) {
                        if (state.productModel[index].category ==
                            "men's clothing") {
                          return ProductCard(jew[index]);
                        } else {
                          return const SizedBox();
                        }
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoaded) {
                    var jew = (state.productModel
                            .where((element) => element.category == "jewelery"))
                        .toList();
                    print(jew);
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 20,
                        crossAxisCount: 2,
                      ),
                      itemCount: jew.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return ProductCard(jew[index]);
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card ProductCard(ProductModel product) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.47,
              height: 130,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(product.image.toString()),
                      fit: BoxFit.contain),
                  borderRadius: BorderRadius.circular(15)),
            ),
            Text(
              product.title.toString(),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Rs. ${product.price.toString()}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
