Tasks Involved in the Project
1. Designing and developing a 4-bit arithmetic unit that can add and subtract signed integers: The
processor should be able to execute addition and subtraction.
2. Implementing the decode instructions to activate necessary components on the processor: The instruction decoding logic analyzes the incoming instructions and determines
which components of the processor should be activated or controlled based on the instruction
being executed.
3. Designing and implementing multiplexers that allow multiple signals or data to be routed or
selected based on control inputs. These components are essential for connecting various parts
of the processor.
4. Transfering the logical design to the real circuit we have to update the constraints file and
generate the bit stream which will activate the necessary components.



## Top Level Component Diagrams
![image](https://github.com/user-attachments/assets/5dcb453b-db6e-49bb-8613-bbbf5e131293)

## Implementation in the Board
![image](https://github.com/user-attachments/assets/7154fc40-e7f9-4b92-8819-75173eed6e43)


Instructions to Run the Program

- Use connect the device in the Vivado source panel to connect the FPGA board to the computer.
- Then press the program device to program the device using the FPGA board.
- You have a one-segment display that will start to show numbers.
- If you want to reset the program, press the reset button in the middle of the push button set.
- Then it will show the result of 3+2+1.
- The result will stay the same until you push the reset button.
