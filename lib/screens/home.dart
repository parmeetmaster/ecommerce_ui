import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_task/api/api_base.dart';
import 'package:flutter_task/model/shopping_model.dart';
import 'package:flutter_task/provider/shopping_provider.dart';
import 'package:flutter_task/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'product_detail.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ShoppingModel? model;

  @override
  void initState() {
    super.initState();
    _loadShoppingItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getHomeAppBar(title: "Title imposed here"),
      body: Consumer<ShoppingProvider>(builder: (context, value, child) {
        if (model != null)
          return ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: model!.data!.length,
                padding: EdgeInsets.symmetric(horizontal: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? 3
                      : 2,
                  crossAxisSpacing: 8,
                  //  mainAxisSpacing: 5,

                  childAspectRatio: (0.5 / 1),
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(model:model!.data![index])));
                    },
                    child: LayoutBuilder(builder: (context, constraint) {
                      return Container(
                        margin: EdgeInsets.only(top: 10),
                        decoration: new BoxDecoration(
                          color: Colors.white,
                        ),
                        //  color: Colors.blue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if ((Uri.parse(model!.data![index].imageUrl!)
                                    .isAbsolute) ==
                                true)
                              Container(
                                height: constraint.maxHeight * 0.7,
                                width: constraint.maxWidth,
                                child: Image.network(
                                  "${model!.data![index].imageUrl}",
                                  fit: BoxFit.fill,
                                ),
                              )
                            else
                              Container(
                                height: constraint.maxHeight * 0.7,
                                width: constraint.maxWidth,
                                child: Image.network(
                                  "https://via.placeholder.com/400",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${model!.data![index].name}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      Container(
                                        width: constraint.maxWidth * 0.7,
                                        child: Text(
                                          "${model!.data![index].shortDesc}",
                                          style: TextStyle(
                                              color: Colors.grey[500],
                                              fontSize: 8,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: constraint.maxWidth * 0.73,
                                        child: Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          children: [
                                            Text(
                                              "\$ ${model!.data![index].discountPrice}",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "\$ ${model!.data![index].origPrice}",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey[500],
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "${model!.data![index].discountPercentage}",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors
                                                    .deepOrangeAccent[200],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.favorite_border),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  );
                },
              ),
            ],
          );
        else
          return Container(
            child: Center(child: CircularProgressIndicator()),
          );
      }),
      bottomNavigationBar: getBottomNavBar(),
    );
  }

  void _loadShoppingItems() async {
    ApiResponse? response =
        await ShoppingProvider.instance().getShoppingItems();
    model = ShoppingModel.fromJson(response!.completeResponse);
    ShoppingProvider.instance().notifyListeners();
  }
}
