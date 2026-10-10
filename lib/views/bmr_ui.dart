import 'package:flutter/material.dart';

class BmrUI extends StatefulWidget {
  const BmrUI({super.key});

  @override
  State<BmrUI> createState() => _BmrUIState();
}

class _BmrUIState extends State<BmrUI> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  bool male = true;
  double bmr = 0.00;

  void calculateBMR() {
    double weight = double.tryParse(weightController.text) ?? 0;
    double height = double.tryParse(heightController.text) ?? 0;
    double age = double.tryParse(ageController.text) ?? 0;

    if (weight > 0 && height > 0 && age > 0) {
      setState(() {
        if (male) {
          bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5;
        } else {
          bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161;
        }
      });
    }
  }

  void clearData() {
    setState(() {
      weightController.clear();
      heightController.clear();
      ageController.clear();
      male = true;
      bmr = 0.00;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 26,
            right: 26,
            top: 25,
            bottom: 20,
          ),
          child: Column(
            children: [
              const Text(
                "คำนวณหาอัตราการเผาผลาญที่\nร่างกายต้องการ (BMR)",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Image.asset(
                'assets/images/bmr.png',
                width: 125,
                height: 125,
              ),

              const SizedBox(height: 5),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "เพศ",
                  style: TextStyle(fontSize: 12),
                ),
              ),

              const SizedBox(height: 7),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          male = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            male ? Colors.lightBlue[100] : Colors.white,
                        foregroundColor:
                            male ? Colors.blue[700] : Colors.grey[700],
                        elevation: 0,
                        side: const BorderSide(
                          color: Color(0xFFE0E0E0),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                      ),
                      child: const Text("ชาย"),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          male = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            !male ? Colors.lightBlue[100] : Colors.white,
                        foregroundColor:
                            !male ? Colors.blue[700] : Colors.grey[700],
                        elevation: 0,
                        side: const BorderSide(
                          color: Color(0xFFE0E0E0),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                      ),
                      child: const Text("หญิง"),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "น้ำหนัก (kg.)",
                  style: TextStyle(fontSize: 12),
                ),
              ),

              const SizedBox(height: 5),

              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "กรอกน้ำหนักของคุณ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "ส่วนสูง (cm.)",
                  style: TextStyle(fontSize: 12),
                ),
              ),

              const SizedBox(height: 5),

              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "กรอกส่วนสูงของคุณ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "อายุ (ปี)",
                  style: TextStyle(fontSize: 12),
                ),
              ),

              const SizedBox(height: 5),

              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "กรอกอายุของคุณ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  onPressed: calculateBMR,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color.fromARGB(255, 255, 65, 0),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    "คำนวณ BMR",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  onPressed: clearData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
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

              const SizedBox(height: 13),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                color: const Color.fromARGB(
                  255,
                  200,
                  230,
                  201,
                ),
                child: Column(
                  children: [
                    const Text(
                      "BMR",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      bmr.toStringAsFixed(2),
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(
                          255,
                          255,
                          61,
                          50,
                        ),
                      ),
                    ),

                    const Text(
                      "kcal/day",
                      style: TextStyle(
                        fontSize: 11,
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
