namespace Entanglement
{
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Intrinsic;

    @EntryPoint()
    operation HelloQ() : (Result, Result)[]
    {
        mutable results = [(Zero, Zero),(Zero, Zero),(Zero, Zero),(Zero, Zero),(Zero, Zero)];

        for i in 0..4
        {
            use (q1, q2) = (Qubit(), Qubit());
            
            H(q1);
            CNOT(q1,q2);

            let b1 = M(q1);
            let b2 = M(q2);

            set results w/= i <- (b1, b2);

            ResetAll([q1, q2]);
        }

        return results;
    }
}