def main():
    # C = cara
    # K = coroa

    # Espaço amostral:
    # (C,C), (C,K), (K,C), (K,K)

    A = 1 / 2 * 100
    B = 1 / 2 * 100

    P_Ae_B = 1 / 4 * 100

    # Depois que A aconteceu, restam:
    # (C,C), (C,K)
    # Apenas (C,C) também possui B.
    P_Bc_A = 1 / 2 * 100

    print(f"Probabilidade de P(A) = {A}%")
    print(f"Probabilidade de P(B) = {B}%")
    print(f"Probabilidade de P(A ∩ B) = {P_Ae_B}%")
    print(f"Probabilidade de P(B | A) = {P_Bc_A}%")

    independentes = P_Bc_A == B

    print(f"Os eventos são independentes: {independentes}")


if __name__ == "__main__":
    main()
