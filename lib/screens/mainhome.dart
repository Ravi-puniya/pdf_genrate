import 'package:fetch_data/models/detailfetch.dart';

import 'package:fetch_data/screens/usear_detail.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  void initState() {
    Provider.of<DetailFetch>(context, listen: false).getdata();
    super.initState();
  }

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<DetailFetch>(context, listen: false).getdata();
  }

  @override
  Widget build(BuildContext context) {
    final det = Provider.of<DetailFetch>(context);
    final userdetail = det.detail;
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
            elevation: 0,
            title: const Text(
              'USERS',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.grey[200]),
        body: RefreshIndicator(
          onRefresh: () => _refreshProducts(context),
          child: ListView.builder(
            itemCount: userdetail.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(10),
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Ink(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 245, 253, 252),
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return UserDetailPage(
                            name: userdetail[index].name,
                            w: userdetail[index].w,
                            s1: userdetail[index].s1,
                            s2: userdetail[index].s2,
                            a1: userdetail[index].a1,
                            a2: userdetail[index].a2,
                            a3: userdetail[index].a3,
                            a4: userdetail[index].a4,
                            tracking: userdetail[index].tracking,
                            tracking2: userdetail[index].tracking2,
                            billing: userdetail[index].billing,
                            desc: userdetail[index].decs,
                            refno1: userdetail[index].referanceno1,
                            refno2: userdetail[index].referanceno2,
                            lastD1: userdetail[index].lastData,
                            lastD2: userdetail[index].lastData2,
                            maxi: userdetail[index].maxi,
                            country: userdetail[index].country,
                          );
                        },
                      ));
                    },
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: Text(userdetail[index].name),
                    subtitle: Text(userdetail[index].tracking),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
