import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partwork/usingGetx/controller/binance_webSocket_controller.dart';

class BinanceDataScreen extends StatelessWidget {
  
  // Instantiate the controller


  final controller = Get.put(BinanceDataController());

   BinanceDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Binance Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Tasks (Sell Orders):'),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.tasks.length,
                    itemBuilder: (context, index) {
                      var task = controller.tasks[index];
                      return ListTile(


                        // Display task price
                        title: Text('Price: ${task.price}'),

                        // Display task quantity
                        subtitle: Text('Quantity: ${task.quantity}'),
                      );
                    },
                  )),
            ),
            const SizedBox(height: 20),
            const Text('Bids (Buy Orders):'),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.bids.length,
                    itemBuilder: (context, index) {
                      var bid = controller.bids[index];
                      return ListTile(

                        
                        // Display bid price
                        title: Text('Price: ${bid.price}'),

                        // Display bid quantity
                        subtitle: Text('Quantity: ${bid.quantity}'),
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
