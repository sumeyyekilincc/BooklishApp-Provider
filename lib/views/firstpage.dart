import 'package:books/controller/firstpage_controller.dart';
import 'package:books/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerHomePage = Provider.of<ControllerFirstPage>(context);
    return Consumer(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Latest Book Releases",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(color: Colors.grey),
          child: controllerHomePage.isBusy == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: controllerHomePage.newbook?.result?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Card(
                        color: Colors.grey.shade300,
                        shadowColor: Colors.black,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 180,
                              width: 180,
                              child: Image.network(
                                controllerHomePage
                                        .newbook?.result?[index].image ??
                                    R.drawable.img1.noimage,
                                errorBuilder: (context, error, stackTrace) {
                                  return SizedBox(
                                    height: 100,
                                    width: 80,
                                    child: Image.asset(
                                      R.drawable.img1.noimage,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controllerHomePage
                                          .newbook?.result?[index].title ??
                                      "--",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                                Text(
                                  controllerHomePage
                                          .newbook?.result?[index].yazar ??
                                      "--",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                Text(
                                  controllerHomePage
                                          .newbook?.result?[index].yayN ??
                                      "--",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                                Text(
                                  controllerHomePage
                                          .newbook?.result?[index].fiyat ??
                                      "--",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
