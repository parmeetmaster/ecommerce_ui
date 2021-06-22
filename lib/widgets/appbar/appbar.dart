import 'package:flutter/material.dart';

getHomeAppBar({String? title="", bool? subenable=false}) {
  return AppBar(
    toolbarHeight: kToolbarHeight, // Set this height
    flexibleSpace: Container(
      //   width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_outlined),
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$title',
                      style: TextStyle(fontSize: subenable==true?18:20,fontWeight: FontWeight.w800),
                      overflow: TextOverflow.ellipsis,

                    ),
                    if(subenable==true)
                    Text(
                      '1 Item',
                      style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
              Padding(
                padding: EdgeInsets.all(4),
                child: Stack(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_bag_outlined)),
                    Positioned(
                      right: 4,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.pink[300], shape: BoxShape.circle),
                        child: Text(
                          "1",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
