import 'package:flutter/material.dart';
import 'package:technovate/screens/main_screen/profile/health_record.dart';
class SettingComponent extends StatelessWidget {
  final IconData icons;
  final String name;
  final Color color;
  const SettingComponent({super.key, required this.icons, required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(name=="Health Record"){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const HealthRecordPage()));
        }
      },
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(icons, size: 75,color: Colors.white,),
            Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
