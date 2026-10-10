import 'package:flutter/material.dart';

class BmiUI extends StatefulWidget {
  const BmiUI({super.key});

  @override
  State<BmiUI> createState() => _BmiUIState();
}

class _BmiUIState extends State<BmiUI> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  double bmi = 0.00;
  String result = "การแปลผล";

  void calculateBMI() {
    double weight = double.tryParse(weightController.text) ?? 0;
    double height = double.tryParse(heightController.text) ?? 0;

    if (weight > 0 && height > 0) {
      double heightMeter = height / 100;

      setState(() {
        bmi = weight / (heightMeter * heightMeter);

        if (bmi < 18.5) {
          result = "น้ำหนักน้อย";
        } else if (bmi < 23) {
          result = "ปกติ";
        } else if (bmi < 25) {
          result = "น้ำหนักเกิน";
        } else if (bmi < 30) {
          result = "อ้วนระดับ 1";
        } else {
          result = "อ้วนระดับ 2";
        }
      });
    }
  }

  void clearData() {
    setState(() {
      weightController.clear();
      heightController.clear();
      bmi = 0.00;
      result = "การแปลผล";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 38,
            right: 38,
            top: 25,
            bottom: 20,
          ),
          child: Column(
            children: [
              const Text(
                "คำนวณหาค่าดัชนีมวลกาย (BMI)",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Image.asset(
                'assets/images/bmi.png',
                width: 120,
                height: 120,
              ),

              const SizedBox(height: 20),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "น้ำหนัก (kg.)",
                  style: TextStyle(fontSize: 14),
                ),
              ),

              const SizedBox(height: 7),

              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "กรอกน้ำหนักของคุณ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "ส่วนสูง (cm.)",
                  style: TextStyle(fontSize: 14),
                ),
              ),

              const SizedBox(height: 7),

              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "กรอกส่วนสูงของคุณ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: calculateBMI,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color.fromARGB(255, 255, 65, 0),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "คำนวณ BMI",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: clearData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "ล้างข้อมูล",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 18),
                color: const Color.fromARGB(255, 200, 230, 201),
                child: Column(
                  children: [
                    const Text(
                      "BMI",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      bmi.toStringAsFixed(2),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 61, 50),
                      ),
                    ),

                    Text(
                      result,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
