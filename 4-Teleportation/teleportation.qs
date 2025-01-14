namespace Teleportation
{
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Math;

    @EntryPoint()
    operation HelloQ() : Unit
    {
        use qMessage = Qubit();
        
        Ry(3.0 * PI() / 8.0, qMessage);
        TeleportQubit(qMessage);

        Reset(qMessage);
    }

    operation TeleportQubit(message: Qubit) : Unit
    {
        use qRegistry = Qubit[2];
        
        let qMessage = message;
        let qAlice = qRegistry[0];
        let qBob = qRegistry[1];

        // Write diagnostics
        DumpRegister([qMessage]);
        DumpRegister([qAlice]);
        DumpRegister([qBob]);

        // Entangle Alice and Bob qubits
        H(qAlice);
        CNOT(qAlice, qBob);

        // Entangle Alice and Message
        CNOT(qMessage, qAlice);
        H(qMessage);

        let bAlice = M(qAlice);
        if( bAlice == One )
        {
          X(qBob);
        }

        let bMessage = M(qMessage);
        if( bMessage == One )
        {
          Z(qBob);
        }

        // Write diagnostics
        DumpRegister([qMessage]);
        DumpRegister([qAlice]);
        DumpRegister([qBob]);
            
        // Reset unmeasured Qubits.
        ResetAll([qMessage, qAlice, qBob]);
    }
}