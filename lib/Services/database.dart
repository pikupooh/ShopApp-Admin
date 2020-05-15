import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_admin/Models/customer.dart';
import 'package:shop_admin/Models/orderItems.dart';

class DatabaseServices {
  final _db = Firestore.instance;
  Stream<List<OrderItem>> getOrderItem(String type) {
    var ref = _db
        .collection("Orders")
        .where('status', isEqualTo: type)
        .orderBy('orderDate', descending: true)
        .snapshots();
    return ref.map((list) =>
        list.documents.map((item) => OrderItem.fromFirebase(item)).toList());
  }

  Stream<List<Customer>> getUsers() {
    var ref = _db.collection("Users").snapshots();
    return ref.map((list) =>
        list.documents.map((item) => Customer.fromfirebase(item)).toList());
  }
}
