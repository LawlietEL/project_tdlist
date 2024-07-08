import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_tdlist/app/data/controller/page_index_controller.dart';
import 'package:project_tdlist/app/style/app_color.dart';

class CustomBottomNavigationBar extends GetView<PageIndexController> {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: 97,
          width: MediaQuery.of(context).size.width,
          color: Colors.transparent,
          child: Stack(
            alignment: const FractionalOffset(.5, 1.0),
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  height: 65,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          color: AppColor.secondaryExtraSoft, width: 1),
                    ),
                  ),
                  child: BottomAppBar(
                    shape: const CircularNotchedRectangle(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            onTap: () => controller.changePage(0),
                            child: SizedBox(
                              height: 65,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 4),
                                    child: (controller.pageIndex.value == 0)
                                        ? const Icon(Icons.home)
                                        : const Icon(Icons.home_outlined),
                                  ),
                                  const Text(
                                    "Home",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: AppColor.secondarySoft,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 32,
                child: SizedBox(
                  width: 64,
                  height: 64,
                  child: FloatingActionButton(
                    onPressed: () => controller.changePage(1),
                    elevation: 0,
                    child: const Icon(Icons.fingerprint),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
