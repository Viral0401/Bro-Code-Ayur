import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  final String headText;
  final String subheadText;
  final String NamedText;
  final String specialist;
  final String cliniclist;
  final String asset;

  const CarouselCard(
      {super.key,
      required this.headText,
      required this.subheadText,
      required this.NamedText,
      required this.specialist,
      required this.cliniclist,
      required this.asset});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 160,
        width: 290,
        decoration: const BoxDecoration(
            color: Color(0xFF0FA47F),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10),
                  child: Text(
                    headText,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    subheadText,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 2,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            NamedText,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                          ),
                          Text(
                            specialist,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            cliniclist,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset(
                  asset,
                  fit: BoxFit.fitWidth,
                ))
          ],
        ));
  }
}
