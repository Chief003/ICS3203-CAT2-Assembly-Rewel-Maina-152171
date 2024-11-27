# ICS3203-CAT2-Assembly-Rewel-Maina-152171
This repository contains solutions for ICS3203 CAT 2 Assembly programming tasks. Each task demonstrates the use of x86 assembly to perform specific operations, focusing on control flow, memory manipulation, modular programming, and simulated hardware interaction.

## Contents

1. **Task 1: Control Flow and Conditional Logic**  
2. **Task 2: Array Manipulation with Looping and Reversal**  
3. **Task 3: Modular Program for Factorial Calculation**  
4. **Task 4: Data Monitoring and Control Using Port-Based Simulation**

---

## Task 1: Control Flow and Conditional Logic
### Purpose:
This program accepts a number as input and classifies it as **POSITIVE**, **NEGATIVE**, or **ZERO** using branching logic. It demonstrates conditional (`JG`, `JL`, `JE`) and unconditional (`JMP`) jump instructions.

### Instructions:
1. Assemble the code:
   ```bash
   nasm -f elf32 task1.asm -o task1.o
   ld -m elf_i386 task1.o -o task1
   ```
2. Run the program:
   ```bash
   ./task1
   ```

### Insights/Challenges:
- The main challenge was handling user input and interpreting it as a signed number.
- Balancing between conditional and unconditional jumps for efficient flow control was insightful.

---

## Task 2: Array Manipulation with Looping and Reversal
### Purpose:
This program reverses an array of integers entered by the user in place, using pointers and loops. It demonstrates efficient memory handling without additional storage.

### Instructions:
1. Assemble the code:
   ```bash
   nasm -f elf32 task2.asm -o task2.o
   ld -m elf_i386 task2.o -o task2
   ```
2. Run the program:
   ```bash
   ./task2
   ```

### Insights/Challenges:
- Swapping values using registers without extra memory required careful planning.
- Managing pointers (`SI` and `DI`) to reverse the array efficiently while avoiding buffer overflows was challenging but rewarding.

---

## Task 3: Modular Program for Factorial Calculation
### Purpose:
This program calculates the factorial of a given number using a subroutine. It uses the stack to preserve and restore register values, demonstrating modularity and recursive logic.

### Instructions:
1. Assemble the code:
   ```bash
   nasm -f elf32 task3.asm -o task3.o
   ld -m elf_i386 task3.o -o task3
   ```
2. Run the program:
   ```bash
   ./task3
   ```

### Insights/Challenges:
- Implementing recursion required careful use of the stack to avoid register overwrites.
- Handling base cases (e.g., factorial of 0 and 1) within the subroutine ensured correctness.

---

## Task 4: Data Monitoring and Control Using Port-Based Simulation
### Purpose:
This program simulates a hardware control system by monitoring a "sensor" value and controlling a "motor" and "alarm" based on predefined thresholds. It demonstrates the use of memory as I/O ports.

### Instructions:
1. Assemble the code:
   ```bash
   nasm -f elf32 task4.asm -o task4.o
   ld -m elf_i386 task4.o -o task4
   ```
2. Run the program:
   ```bash
   ./task4
   ```

### Insights/Challenges:
- Simulating hardware with memory manipulation was challenging but highlighted how I/O ports work in real-world systems.
- The decision-making logic required careful comparison and branching to manage multiple outcomes.

---

## General Notes:
- All tasks use NASM assembler and are designed for a 32-bit Linux environment.
- Modify system calls (e.g., `INT 80H`) if running on other platforms or architectures.
- Properly test edge cases, such as inputting zero for factorial or an empty array for reversal.

---
