#include <math.h>
#include <stdio.h>
#include <stdlib.h>

/**
 * Computes the roots of the quadratic equation.
 *
 * 3 arguments should be passed: `A`, `B` and `C`:
 *
 * `A * x * x + B * x + C == 0`
 *
 * Returns 1 (failure) if less than 3 arguments received,
 * Returns 2 if roots are imaginary
 * Returns 0 elsewhere.
 */
int main(int argc, char* argv[]) {
    if (argc < 4) return 1;

    double a = atof(argv[1]);
    double b = atof(argv[2]);
    double c = atof(argv[3]);

    double delta = b * b - 4 * a * c;

    printf("A = %g\nB = %g\nC = %g\n", a, b, c);

    if (delta < 0) {  // Complex roots
        printf("Pas de solutions réelles\n");
        return 2;
    }

    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);

    printf("x1 = %g\nx2 = %g\n", x1, x2);
}
