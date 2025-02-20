import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/calculator_controller.dart';

/// A stateless widget that represents the Calculator UI.
class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initializing the CalculatorController using GetX
    final CalculatorController controller = Get.put(CalculatorController());

    return Scaffold(
      appBar: AppBar(
        title: Text("String Calculator"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input field for the user to enter numbers as a string
            TextField(
              onChanged: controller.updateInput, // Updates the input in the controller
              decoration: InputDecoration(
                labelText: "Enter numbers",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: controller.calculate, // Calls the calculate method from the controller
              child: Text("Calculate"),
            ),
            SizedBox(height: 20),

            // Displays the calculated result using Obx to reactively update UI
            Obx(() => Text(
              "Result: ${controller.result.value}",
              style: TextStyle(fontSize: 24),
            )),
          ],
        ),
      ),
    );
  }
}
