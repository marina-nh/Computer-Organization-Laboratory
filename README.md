# Computer Organization 2021 - Lab Work: VC FrameBuffer in QEMU Emulating an RPi3

## Description

This project is part of the practical work for the "Computer Organization" course. The main objective was to write programs in ARMv8 assembly language to manipulate a video FrameBuffer structure on a Raspberry Pi 3 emulated with QEMU.

## Objectives

- **Write programs in ARMv8 assembly language.**
- **Understand the memory-mapped I/O interface of the microprocessor using a visual interface.**
- **Implement and verify the functionality of a FrameBuffer structure on an emulated Raspberry Pi 3.**

## Exercises

### Exercise 1: Static Pattern Generation

A program was developed in ARMv8 assembly based on a provided example code. The program generates a static image of Mario Bros on a pipe, using the character's characteristic colors. The image meets the following requirements:

- **Utilizes the entire screen area.**
- **Is not a random pattern.**
- **Uses at least 3 different colors.**
- **Includes at least two figures of different shapes.**
- **The image can be described in two lines of text.**

### Exercise 2: Mario Bros Animation

This exercise reuses the code from Exercise 1 to animate the image of Mario Bros emerging from the pipe. The animation meets the following requirements:

- **The pattern covers the entire screen.**
- **Is not a random pattern.**
- **Uses at least 3 different colors.**
- **Includes at least two figures of different shapes.**
- **The movement sequence lasts at least 10 seconds.**

## Requirements

- **QEMU** (to emulate the Raspberry Pi 3).
- **ARMv8 assembly compiler.**
- **ARM development tools (such as `gcc-arm-none-eabi`).**

## Execution

To run the programs in a QEMU environment emulating a Raspberry Pi 3, follow these steps:

1. Compile the assembly code:
   ```bash
   arm-none-eabi-as -o exercise1.o exercise1.s
   arm-none-eabi-ld -T linker.ld -o exercise1.elf exercise1.o
   ```

2. Launch QEMU with the generated ELF file:
   ```bash
   qemu-system-aarch64 -M raspi3 -kernel exercise1.elf -serial null -serial mon:stdio
   ```

3. Observe the output in the QEMU window.

## Results

- **Exercise 1:** Static image of Mario Bros on a pipe.
- **Exercise 2:** Animation of Mario Bros emerging from the pipe.

## Contributions

This project was developed as part of the "Computer Organization" course. Thanks to the instructors for their guidance and the examples provided.
