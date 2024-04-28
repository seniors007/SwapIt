import 'package:swapit/features/profile/data/models/amount_model/amount_model.dart';
import 'package:swapit/features/profile/data/models/amount_model/details.dart';
import 'package:swapit/features/profile/data/models/item_list_model/item.dart';
import 'package:swapit/features/profile/data/models/item_list_model/item_list_model.dart';

({AmountModel amount, ItemListModel itemList}) getTransctionsData(int inCash) {
  int quantity = inCash * 5;

  var amount = AmountModel(
      total: inCash.toString(),
      currency: 'USD',
      details: Details(
          shipping: "0", shippingDiscount: 0, subtotal: inCash.toString()));

  List<OrderItemModel> orders = [
    OrderItemModel(
      currency: 'USD',
      name: 'Points',
      price: ".2",
      quantity: quantity,
    ),
  ];

  var itemList = ItemListModel(orders: orders);

  return (amount: amount, itemList: itemList);
}
