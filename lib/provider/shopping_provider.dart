import 'package:flutter/material.dart';
import 'package:flutter_task/api/api_base.dart';

// api wrapper defined here
mixin shoppingApi {
  Future<ApiResponse?> getShoppingItems() async {
    ApiResponse response = await ApiBase().baseFunction(
        () => ApiBase.getInstance().get("/b/60141159ef99c57c734b89aa"));
    return response;
  }
}

// this is change notifier class all object are not removed automatically
class ShoppingProvider extends ChangeNotifier with shoppingApi {
  static ShoppingProvider? _instance;

  ShoppingProvider._private();

  factory ShoppingProvider.instance() {
    _instance ??= ShoppingProvider._private();
    return _instance!;
  }
}
