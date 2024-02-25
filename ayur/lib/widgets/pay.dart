import 'package:flutter/material.dart';
class Pay extends StatelessWidget {
  static const routeName = '/pay';
  const Pay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sk =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    String price= sk['price'] as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Gateway'),
        backgroundColor: Color(0xff263077),
      ),
      body: Center(
          child: Container(
            padding: EdgeInsets.all(22.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),

            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.all(8.0),
                  child:Text('Medicine Name:-${price} '),
                ),

                SizedBox(height:2),
                Padding(padding: EdgeInsets.all(8.0),
                  child:Text('Tax:-0'),
                ),

                SizedBox(height:2),
                Divider(thickness: 1, color: Colors.black,),
                SizedBox(height:2),

                Padding(padding: EdgeInsets.all(8.0),
                  child:Text('Total:- ${price}'),
                ),
                SizedBox(height:22),
                ElevatedButton(onPressed: (){}, child: Text('Pay Now')),

              ],
            ),
          )
      ),
    );
  }
}