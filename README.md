# Organización del Computador 2021 - Trabajo de Laboratorio: VC FrameBuffer en QEMU emulando una RPi3

## Descripción

Este proyecto forma parte del trabajo práctico de la materia "Organización del Computador". El objetivo principal fue escribir programas en lenguaje ensamblador ARMv8 para manipular una estructura FrameBuffer de video en una Raspberry Pi 3 emulada con QEMU.

## Objetivos

- **Escribir programas en ensamblador ARMv8.**
- **Comprender la interfaz de entrada/salida en memoria del microprocesador utilizando una interfaz visual.**
- **Implementar y verificar el funcionamiento de una estructura FrameBuffer en una Raspberry Pi 3 emulada.**

## Ejercicios

### Ejercicio 1: Generación de Patrón Estático

Se desarrolló un programa en ensamblador ARMv8 basado en un código de ejemplo proporcionado. El programa genera una imagen estática de Mario Bros sobre una tubería, utilizando los colores característicos del personaje. La imagen cumple con los siguientes requisitos:

- **Utiliza toda la extensión de la pantalla.**
- **No es un patrón aleatorio.**
- **Se emplean al menos 3 colores diferentes.**
- **Incluye al menos dos figuras de distinta forma.**
- **La imagen puede describirse en dos líneas de texto.**

### Ejercicio 2: Animación de Mario Bros

Este ejercicio reutiliza el código del Ejercicio 1 para animar la imagen de Mario Bros saliendo de la tubería. La animación cumple con los siguientes requisitos:

- **El patrón ocupa toda la pantalla.**
- **No es un patrón aleatorio.**
- **Se emplean al menos 3 colores diferentes.**
- **Incluye al menos dos figuras de distinta forma.**
- **La secuencia de movimiento dura al menos 10 segundos.**

## Requisitos

- **QEMU** (para emular la Raspberry Pi 3).
- **Compilador de ensamblador ARMv8.**
- **Herramientas de desarrollo para ARM (como `gcc-arm-none-eabi`).**

## Ejecución

Para ejecutar los programas en un entorno QEMU que emula una Raspberry Pi 3, sigue los siguientes pasos:

1. Compila el código ensamblador:
   ```bash
   arm-none-eabi-as -o ejercicio1.o ejercicio1.s
   arm-none-eabi-ld -T linker.ld -o ejercicio1.elf ejercicio1.o
   ```

2. Inicia QEMU con el archivo ELF generado:
   ```bash
   qemu-system-aarch64 -M raspi3 -kernel ejercicio1.elf -serial null -serial mon:stdio
   ```

3. Observa el resultado en la ventana de QEMU.

## Resultados

- **Ejercicio 1:** Imagen estática de Mario Bros sobre una tubería.
- **Ejercicio 2:** Animación de Mario Bros saliendo de la tubería.

## Contribuciones

Este proyecto fue desarrollado como parte de la materia "Organización del Computador". Se agradece a los docentes por la guía y los ejemplos proporcionados.
