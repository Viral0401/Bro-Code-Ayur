import 'package:flutter/material.dart';
class CriteriaRecord extends StatelessWidget {
  final String criteria;
  final String value;
  final String asset;
  final  GlobalKey formKey;

  const CriteriaRecord({super.key, required this.criteria, required this.value, required this.asset, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black, width: 1)
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: Image.asset(asset,fit: BoxFit.cover,),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: [
              Text(criteria),
              SizedBox(
                width: 40,
                height: 30,
                child: TextFormField(
                  initialValue: value,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      )),
                  onSaved: (val) {},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
