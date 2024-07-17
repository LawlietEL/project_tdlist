import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_tdlist/app/data/controller/auth_controller.dart';
import 'package:project_tdlist/app/data/controller/page_index_controller.dart';
import 'package:project_tdlist/app/widget/custom_bottom_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    final PageIndexController pageController = Get.find<PageIndexController>();

    return Scaffold(
      backgroundColor: const Color(0xFFB0E3CE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 200,
        leading: Row(
          children: [
            GestureDetector(
              onTap: () {
                // Logic to upload profile picture
              },
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/pp.png'),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => Text(
                        authController.currentName.value,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )),
                  const SizedBox(height: 1),
                  Obx(() => Text(
                        authController.currentEmail.value,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                      )),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(Icons.settings,
                  color: Color.fromARGB(255, 48, 48, 48)),
              onPressed: () {
                // Tampilkan dialog atau navigasi ke halaman pengaturan
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Settings'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: const Icon(Icons.lock,
                                color: Color.fromARGB(255, 48, 48, 48)),
                            title: const Text('Change Password'),
                            onTap: () {
                              Get.toNamed('/change-password');
                            },
                          ),
                          const Divider(),
                          ListTile(
                            leading: const Icon(Icons.logout,
                                color: Color.fromARGB(255, 48, 48, 48)),
                            title: const Text('Sign Out'),
                            onTap: () {
                              logout(context);
                            },
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(5.0),
          child: Divider(
            color: Colors.grey,
            height: 1,
            thickness: 1,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.wb_sunny_outlined, color: Colors.black),
            title: const Text("Today's"),
            onTap: () {
              Get.toNamed('/todays');
            },
          ),
          ListTile(
            leading: const Icon(Icons.star_outline, color: Colors.black),
            title: const Text('Important'),
            onTap: () {
              Get.toNamed('/important');
            },
          ),
          ListTile(
            leading: const Icon(Icons.list_alt_outlined, color: Colors.black),
            title: const Text('All Tasks'),
            onTap: () {
              Get.toNamed('/all-tasks');
            },
          ),
          const SizedBox(
            width: 16,
            height: 8,
          ),
          const Divider(
            color: Colors.grey,
            height: 1,
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(Icons.add, color: Colors.black),
            title: const Text('New To Do List'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Add Category'),
                    content: TextField(
                      decoration: const InputDecoration(
                        hintText: "Add Category",
                      ),
                      onSubmitted: (value) {
                        authController.addCategory(value);
                        Navigator.of(context).pop();
                      },
                    ),
                  );
                },
              );
            },
          ),
          Obx(() {
            return Column(
              children: authController.categories.map((category) {
                return ListTile(
                  leading: const Icon(Icons.list, color: Colors.black),
                  title: Text(category),
                  onTap: () {
                    Get.toNamed('/category/$category');
                  },
                );
              }).toList(),
            );
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => pageController.changePage(0),
        // ignore: sort_child_properties_last
        child: Obx(() => Icon(
              pageController.pageIndex.value == 0
                  ? Icons.home
                  : Icons.home_outlined,
            )),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

Future<void> logout(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              AuthController authController = Get.find<AuthController>();
              authController.logout(); // Example method to sign out
              Navigator.of(context).popUntil(ModalRoute.withName('/login'));
            },
            child: const Text('Sign Out'),
          ),
        ],
      );
    },
  );
}
