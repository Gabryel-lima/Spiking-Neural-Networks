def main():
    # V = vermelha
    # Z = azul

    # Espaço amostral:
    # V,V,V,Z,Z

    # A = primeira bola vermelha
    # B = segunda bola vermelha
    A = 3 / 5 * 100
    B = 3 / 5 * 100

    # Sabendo que A aconteceu, uma V saiu, foi anotada e voltou.
    # Restam:
    # V,V,V,Z,Z
    #
    # 3 vermelhas e 2 azuis.
    P_Bc_A = 3 / 5 * 100

    print(f"Probabilidade de P(A) = {A}%")
    print(f"Probabilidade de P(B) = {B}%")
    print(f"Probabilidade de P(B | A) = {P_Bc_A}%")

    # A bola volta pra urna, então a primeira retirada
    # não muda nada pra segunda.
    independentes = P_Bc_A == B

    print(f"Os eventos são independentes: {independentes}")


if __name__ == "__main__":
    main()
