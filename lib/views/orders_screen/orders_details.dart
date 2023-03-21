import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/views/orders_screen/components/order_status.dart';
import 'package:ecommerce_app/views/orders_screen/order_place_details.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart' as intl;

class OrderDetails extends StatelessWidget {
  final dynamic data;
  const OrderDetails({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Order Details"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            orderStatus(
              color: redColor,
              icon: Icons.done,
              title: "Placed",
              showDone: data['order_placed'],
            ),
            orderStatus(
              color: Colors.blue,
              icon: Icons.thumb_up,
              title: "Confirmed",
              showDone: data['order_confirmed'],
            ),
            orderStatus(
              color: Colors.yellow,
              icon: Icons.car_crash,
              title: "On Delivery",
              showDone: data['order_on_delivery'],
            ),
            orderStatus(
              color: Colors.purple,
              icon: Icons.done_all_rounded,
              title: "Delivered",
              showDone: data['order_delivered'],
            ),
            const Divider(),
            10.heightBox,
            orderPlaceDetails(
                d1: data['order_code'],
                d2: data['shipping_method'],
                title1: "Order Code",
                title2: "Shipping Method"),
            orderPlaceDetails(
                d1: intl.DateFormat("h:mma")
                    .format((data['order_date'].toDate())),
                d2: data['payment_method'],
                title1: "Order Date",
                title2: "Payment Method"),
          ],
        ),
      ),
    );
  }
}
