import 'package:supabase_flutter/supabase_flutter.dart';

supabaseConfig() async {
  await Supabase.initialize(
      url: "https://jcvosgrhrkpcrbfsmddt.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Impjdm9zZ3JocmtwY3JiZnNtZGR0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMTEwNjYsImV4cCI6MjAxNTc4NzA2Nn0.x-B8Y7sci3UsbEkhBefzbYBmlOfQlk_aZcyiMQPWg0A");
}
