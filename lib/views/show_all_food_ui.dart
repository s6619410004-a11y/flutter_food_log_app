import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_food_log_app/model/food.dart';
import 'package:flutter_food_log_app/services/supabase_service.dart';
import 'package:flutter_food_log_app/views/add_food_ui.dart';

class ShowAllFoodUi extends StatefulWidget {
  const ShowAllFoodUi({super.key});

  @override
  State<ShowAllFoodUi> createState() => _ShowAllFoodUiState();
}

class _ShowAllFoodUiState extends State<ShowAllFoodUi> {
  List<Food> foods = [];

  final service = SupabaseService();

  void loadAllFood() async {
    final data = await service.getAllFood();
    setState(() {
      foods = data;
    });
  }

  @override
  void initState() {
    super.initState();
    loadAllFood();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'กินกันหลอก',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Image.asset(
              'assets/images/logo.png',
              width: 180,
              height: 180,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: foods.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsetsGeometry.only(
                      left: 30,
                      right: 30,
                      top: 5,
                      bottom: 5,
                    ),
                    child: ListTile(
                      onTap: () {},
                      leading: Image.asset(
                        'assets/images/food_img.png',
                      ),
                      trailing: Icon(
                        Icons.info,
                        color: Colors.red,
                      ),
                      title: Text(
                        'กิน ${foods[index].foodName}',
                      ),
                      subtitle: Text(
                        'วันที่ ${foods[index].foodDate} มื้อ: ${foods[index].foodMeal}',
                      ),
                      tileColor: index % 2 == 0
                          ? Colors.blueAccent[50]
                          : Colors.green[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddFoodUi(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
