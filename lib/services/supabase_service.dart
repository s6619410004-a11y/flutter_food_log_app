import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_food_log_app/model/food.dart';

class SupabaseService {
  final supabase = Supabase.instance.client;

  Future<List<Food>> getAllFood() async {
    final data = await supabase
        .from('food_tb')
        .select('*')
        .order('foodDate', ascending: false);

    return data.map<Food>((e) => Food.fromJson(e)).toList();
  }

  Future insertFood(Food food) async {
    await supabase.from('food_tb').insert(food.toJson());
  }
}
