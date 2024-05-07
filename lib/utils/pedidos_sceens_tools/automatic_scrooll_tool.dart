import 'dart:async';
import 'package:flutter/material.dart';

class AutomaticScroollTool{
  int currentPage=0;
  final int cantidadPagina;
  final PageController controller=PageController();
  Timer?   timerScrollAutomatico;
  Timer? timerdetectarInactividad;
  bool comprovarInactividad = false;
  bool detenerScroll=false;

  AutomaticScroollTool({
    required this.cantidadPagina,
    
  });

  set setCurrentPage(int value){
    currentPage=value;
  }

  void cancelarTimers(){
    timerScrollAutomatico?.cancel();
    timerdetectarInactividad?.cancel();
  }

  void cancelarScroll(bool cargarInactivad) {
    comprovarInactividad=cargarInactivad;
    detenerScroll = cargarInactivad;
    timerScrollAutomatico?.cancel(); // Cancelar el temporizador de desplazamiento
    timerdetectarInactividad?.cancel(); // Cancelar el temporizador de detección de inactividad
    
    detectarInactividad(); // Reiniciar la detección de inactividad
  }

  void starScrollTimer() {
    if (!detenerScroll) {
      comprovarInactividad = false;
      timerScrollAutomatico = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (currentPage < cantidadPagina-1) {
          currentPage++;
        } else {
          currentPage = 0;
        }
        controller.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      });
    }
  }

  void detectarInactividad() {
    if (comprovarInactividad) {
      timerdetectarInactividad =
          Timer.periodic(const Duration(seconds: 8), (timer) {
        if (detenerScroll) {
          detenerScroll = false;
          starScrollTimer(); // Reiniciar el temporizador de desplazamiento
        }
      });
    }
  }

  void nextPage(){
    cancelarScroll(true);
    controller.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.decelerate,
    );
  }
  
  void previousPage(){
    cancelarScroll(true);
    controller.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.decelerate,
    );
  }
}