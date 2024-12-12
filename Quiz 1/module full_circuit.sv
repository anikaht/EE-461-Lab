module full_circuit(output out, input a, b, c);

    // OR Gate: Implements b + c
    wire or_result;         // Intermediate signal for the OR gate output
    wire pmos_pullup_temp;  // Intermediate wire for the PMOS network in the OR gate

    // NMOS Network: Pulls or_result low (0) when b = 1 or c = 1
    nmos n1(or_result, 1'b1, b);    // Pull down if b = 1
    nmos n2(or_result, 1'b1, c);    // Pull down if c = 1

    // PMOS Network: Pulls or_result high (1) when b = 0 or c = 0
    pmos p1(pmos_pullup_temp, 1'b0, b);  // Pull up temp if b = 0
    pmos p2(or_result, pmos_pullup_temp, c); // Pull up output if temp = 1 and c = 0

    // AND Gate: Implements a · (b + c)
    wire temp; // Intermediate signal for the NMOS network in the AND gate

    // PMOS Network: Pulls out high (1) when a = 0 or or_result = 0
    pmos n3(out, 1'b0, a);          // Pull up if a = 0
    pmos n4(out, 1'b0, or_result);  // Pull up if or_result = 0

    // NMOS Network: Pulls out low (0) when both a = 1 and or_result = 1
    nmos p3(temp, 1'b1, a);         // Pull down temp if a = 1
    nmos p4(out, temp, or_result);  // Pull down output if temp = 0 and or_result = 1

endmodule
