ADD s0, 01
OUTPUT s0, 00
loop: CALL NZ, loop
OUTPUT sF, 00
death: JUMP death