import 'package:assessment1/view_model/provider.dart';
import 'package:assessment1/widgets/dropdownwidget.dart';
import 'package:assessment1/widgets/navigation_widget.dart';
import 'package:assessment1/widgets/textfieldwidget.dart';
import 'package:assessment1/widgets/trianglewidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CustomPaint(
                        size: const Size(100, 100),
                        painter: TrianglePainter(),
                      ),
                      const Positioned(
                        top: 18,
                        left: 17,
                        child: Icon(Icons.menu, color: Colors.white, size: 30),
                      ),
                    ],
                  ),
                  const Text(
                    'Enquiry Form',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const TextFieldWithLabel(
                        hintText: 'Place',
                      ),
                      const SizedBox(height: 15),
                      const TextFieldWithLabel(
                        hintText: 'Contact Number',
                      ),
                      const SizedBox(height: 15),
                      const TextFieldWithLabel(
                        hintText: 'Reference Number',
                      ),
                      const SizedBox(height: 15),
                      const TextFieldWithLabel1(),
                      const SizedBox(height: 15),
                      Consumer<HomeProvider>(
                        builder: (context, dropdownState, _) {
                          return Container(
                            // color: Colors.black,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                for (var i = 0;
                                    i < dropdownState.dropdownVisibility.length;
                                    i++)
                                  if (dropdownState.dropdownVisibility[i])
                                    const DropdownWidget(),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                        ),
                                        child: SizedBox(
                                          height: 50,
                                          width: 130,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                IconButton(
                                                  icon:
                                                      Icon(Icons.add, size: 30),
                                                  onPressed: () {
                                                    dropdownState.addDropdown();
                                                  },
                                                ),
                                                const Text(
                                                  "Add",
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      if (dropdownState
                                          .dropdownVisibility.isNotEmpty)
                                        Container(
                                          height: 50,
                                          width: 130,
                                          decoration: BoxDecoration(
                                            // color: Colors.cyan,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Colors.red,
                                              width: 2,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                IconButton(
                                                  icon: const Icon(Icons.delete,
                                                      size: 25),
                                                  onPressed: () {
                                                    dropdownState
                                                        .removeDropdown();
                                                  },
                                                ),
                                                const Text(
                                                  "Remove",
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 15),
                      const TextFieldWithLabel(
                        hintText: 'Occupation',
                      ),
                      const SizedBox(height: 15),
                      const TextFieldWithLabel(
                        hintText: 'Requirement',
                      ),
                      const SizedBox(height: 15),
                      const TextFieldWithLabel(
                        hintText: 'Customer budget',
                      ),
                      const SizedBox(height: 15),
                      const TextFieldWithLabel(
                        hintText: 'Remarks',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: 0,
          onItemTapped: (index) {},
        ),
      ),
    );
  }
}