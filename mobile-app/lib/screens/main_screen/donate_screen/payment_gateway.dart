import 'package:flutter/material.dart';
import '../../../widgets/textfield.dart';
import '../../../widgets/pay.dart';
class PaymentGateway extends StatefulWidget {
  static const routeName = '/payment-gateway';
  const PaymentGateway({Key? key}) : super(key: key);

  @override
  State<PaymentGateway> createState() => _PaymentGatewayState();
}

class _PaymentGatewayState extends State<PaymentGateway> {

  @override
  Widget build(BuildContext context) {
    String price="200";

    return Scaffold(
        appBar: AppBar(
          title: const Text('Payment Gateway'),
          backgroundColor: Color(0xff263077),
        ),
        body: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset('assets/images/paypal.jpg',height: 100,width: 100,),
            SizedBox(height:12),
            Padding(padding: EdgeInsets.symmetric(horizontal: 22) ,
              child:TextField_1('Enter Your Account Number', 'Account Number', Icons.account_box),
            ),

            SizedBox(height:5),
            Padding(padding: EdgeInsets.symmetric(horizontal: 22) ,
              child:TextField_1('Enter Your Password', 'Password', Icons.lock),
            ),
            SizedBox(height:10),
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(Pay.routeName, arguments: {
                  'price': price,

                });
              },
              child: Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 22),
                decoration: BoxDecoration(
                  color: Color(0xff263077),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Card(
                  color: Color(0xff263077),
                  child: Center(
                    child: Text(
                      'Pay',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ) ,)
          ],

        )
    );
  }
}