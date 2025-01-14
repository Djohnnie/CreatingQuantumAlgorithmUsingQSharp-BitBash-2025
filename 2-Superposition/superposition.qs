namespace Superposition
{
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Intrinsic;    

    @EntryPoint()
    operation HelloQ() : Result[]
    {
        mutable results = [Zero, Zero, Zero, Zero, Zero];

        for i in 0..4
        {
            use q = Qubit();

            H(q);

            let b = M(q);

            set results w/= i <- b;

            Reset(q);
        }

        return results;
    }
}