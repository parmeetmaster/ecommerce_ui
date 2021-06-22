

import 'package:flutter/material.dart';

getBottomNavBar(){
  return Container(
    height: kToolbarHeight,
    child: Row(
      children: [
        Expanded(child: Center(child:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotatedBox(

                quarterTurns: 1,
                child: Icon(Icons.compare_arrows,size: 30,color: Colors.grey[400],)),
            SizedBox(width: 5,),
            Text("SORT",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.black87),)
          ],)
          ,)),
        Expanded(child: Center(child:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.filter_list_alt,size: 30,color: Colors.grey[400],),
            SizedBox(width: 5,),
            Text("FILTER",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.black87),)
          ],)
          ,)),
      ],
    ),
  );
}