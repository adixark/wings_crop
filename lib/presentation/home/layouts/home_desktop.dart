import 'package:flutter/material.dart';
import 'package:wings_crop/presentation/home/widgets/battery_info_widget.dart';
import 'package:wings_crop/presentation/home/widgets/bike_showcase_widget.dart';
import 'package:wings_crop/presentation/home/widgets/fault_widget.dart';
import 'package:wings_crop/presentation/home/widgets/header_widget.dart';
import 'package:wings_crop/presentation/home/widgets/start_repair_button.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF778290),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomHeader(),
            SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      BikeShowcaseWidget(
                        status: "ARMED",
                        statusColor: Colors.green,
                        bikeTitle: "2024 DSR/X",
                        bikeSubtitle: "DUAL SPORT",
                        vin: "219479120142",
                        isFromAsset: true,
                        imagePath: 'assets/images/DSRX.png',
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: BatteryInfoWidget(
                              mainValue: '12V',
                              label: 'BATTERY VOLTAGE',
                            ),
                          ),
                          Expanded(
                            child: BatteryInfoWidget(
                              mainValue: '56%',
                              label: 'STATE OF CHARGE',
                              icon: Icons.bolt,
                              iconColor: Colors.green,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    spacing: 16,
                    children: [
                      FaultWidget(
                        faultCount: 1,
                        faultNumber: 1,
                        faultTitle: 'High Throttle',
                        faultDescription:
                            'Likely throttle connection or potentiometer issue',
                        onTroubleshootPressed: () {
                          // Handle troubleshoot action
                        },
                      ),

                      // 5) Start Repair Button
                      SizedBox(
                        width: 300,
                        height: 70,
                        child: StartRepairButton(
                          onPressed: () {
                            // Handle button press
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            // 1) Bike Showcase

            // 2) Fault Widget
          ],
        ),
      ),
    );
  }
}
