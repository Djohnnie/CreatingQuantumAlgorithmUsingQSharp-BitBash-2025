namespace Introduction
{
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Intrinsic;
    
    @EntryPoint()
    operation HelloQ() : (Result, Result)
    {
        use (q1, q2) = (Qubit(), Qubit());

        X(q2);

        let b1 = M(q1);
        let b2 = M(q2);

        ResetAll([q1, q2]);

        return (b1, b2);
    }
}