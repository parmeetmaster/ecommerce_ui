import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/model/shopping_model.dart';
import 'package:flutter_task/widgets/appbar/appbar.dart';

class ProductDetailScreen extends StatefulWidget {
  ShoppingItemModel? model;

  ProductDetailScreen({this.model});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getHomeAppBar(),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          shrinkWrap: true,
          children: [
            Image.network(
              "${  ((Uri.parse(widget.model!.imageUrl!).isAbsolute) ==
        false)?"https://via.placeholder.com/400":widget.model!.imageUrl}",
              fit: BoxFit.fill,
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Card(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "${widget.model!.name}.\t",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                color: Colors.black87)),
                        TextSpan(
                          text: "${widget.model!.shortDesc!}",
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[400]),
                        ),
                      ])),
                      SizedBox(
                        height: 5,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text:
                              "${widget.model!.longDesc!.details!.first.productDetails}",
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[400]),
                        ),
                      ])),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "\$${widget.model!.discountPrice}\t\t\t",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                color: Colors.black87)),
                        TextSpan(
                            text: "\$${widget.model!.origPrice}",
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 18,
                                color: Colors.grey[500])),
                        TextSpan(
                            text: "\t\t",
                            style: TextStyle(
                                fontSize: 18, color: Colors.grey[500])),
                        TextSpan(
                            text: "\$${widget.model!.discountPercentage}",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.deepOrangeAccent[200])),
                      ])),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Inclusive all taxes",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.green[400],
                              fontSize: 14,
                            ))
                      ])),
                    ],
                  ),
                ),
                Card(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Text(
                        "${widget.model!.longDesc!.discountDetails}.\t",
                        style: TextStyle(fontSize: 15, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                Card(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/svgs/calendar-day-30-svgrepo-com.svg",
                            width: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${widget.model!.longDesc!.exchangeDtls}.\t",
                            style:
                                TextStyle(fontSize: 15, color: Colors.black87),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Row(
                        children: [
                          Text(
                            "SELECT SIZE",
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            "SIZE CHART",
                            style: TextStyle(
                                color: Colors.red[400],
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 50,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            ...widget.model!.longDesc!.sizeDetails!.map((e) =>   Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              child: Center(child: Text("${e.keys.toString().replaceAll("(", "").replaceAll(")", "")}")),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(

                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black87)
                              ),
                            ))


                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Text(
                        "Product Detail",
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${widget.model!.longDesc!.details!.first.productDetails}",
                        style: TextStyle(
                            color: Colors.black87,
                          ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "Size and Fit",
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${widget.model!.longDesc!.details![1].sizeFit}",
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "Material & Care",
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${widget.model!.longDesc!.details![2].materialCare}",
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "Style Note",
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${widget.model!.longDesc!.details![3].styleNote}",
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
