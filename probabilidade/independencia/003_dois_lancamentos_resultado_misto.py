def main():
    # C = cara
    # K = coroa

    # Espaço amostral:
    # (C,C), (C,K), (K,C), (K,K)

    A = 1 / 2 * 100
    B = 1 / 2 * 100

    # A = primeiro lançamento C
    # B = segundo lançamento K
    #
    # Apenas (C,K) satisfaz A e B.
    P_Ae_B = 1 / 4 * 100

    # Sabendo que A aconteceu, restam:
    # (C,C), (C,K)
    #
    # Apenas (C,K) possui B.
    P_Bc_A = 1 / 2 * 100

    print(f"Probabilidade de P(A) = {A}%")
    print(f"Probabilidade de P(B) = {B}%")
    print(f"Probabilidade de P(A ∩ B) = {P_Ae_B}%")
    print(f"Probabilidade de P(B | A) = {P_Bc_A}%")

    independentes = P_Bc_A == B

    print(f"Os eventos são independentes: {independentes}")


if __name__ == "__main__":
    main()
