import 'package:flutter/material.dart';

class userinfo extends StatelessWidget {
  var name;
  var weight;
  var s1;
  var s2;
  var a1;
  var a2;
  var a3;
  var a4;
  var tracking;
  var billing;
  var desc;
  var refno1;
  var refno2;

  userinfo(
      {super.key,
      required this.name,
      required this.s1,
      required this.s2,
      required this.a1,
      required this.a2,
      required this.a3,
      required this.a4,
      required this.tracking,
      required this.weight,
      required this.billing,
      required this.desc,
      required this.refno1,
      required this.refno2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(width: 0.5),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: $name',
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              ),
              Text(
                'Weight: $weight',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(12),
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(width: 0.5),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'S1:$s1',
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              ),
              Text(
                'S2:$s2',
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(12),
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(width: 0.5),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'A1: $a1',
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              ),
              Text(
                'A2: $a2',
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              ),
              Text(
                'A3: $a3',
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              ),
              Text(
                'A4: $a4',
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(12),
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(width: 0.5),
              borderRadius: BorderRadius.circular(12)),
          child: Text(
            'Tracking #: $tracking',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(12),
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(width: 0.5),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Billing: $billing',
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              ),
              Text(
                'Desc: $desc',
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              ),
              Text(
                '$refno1',
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              ),
              Text(
                '$refno2',
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
