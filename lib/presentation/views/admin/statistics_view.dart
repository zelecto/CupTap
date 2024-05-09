import 'package:cutap/presentation/widgets/admin/Managment/products/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text('Estadisticas'), ),
        body: Center(
            child: SafeArea(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 32,
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Estadisticas',
                  style: GoogleFonts.bebasNeue(fontSize: 62),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200, // Ajusta este valor según tus necesidades
              width: 200,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      color: Colors.red,
                      value: 40,
                      title: 'Rojo',
                      radius: 50,
                    ),
                    PieChartSectionData(
                      color: Colors.green,
                      value: 30,
                      title: 'Verde',
                      radius: 50,
                    ),
                    PieChartSectionData(
                      color: Colors.blue,
                      value: 20,
                      title: 'Azul',
                      radius: 50,
                    ),
                    PieChartSectionData(
                      color: Colors.yellow,
                      value: 10,
                      title: 'Amarillo',
                      radius: 50,
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Historial de ventas',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
