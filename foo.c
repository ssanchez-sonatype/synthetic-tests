#include <stdlib.h>
int *demo_a_pair_of_missed_leaks(void) {
    int *alloc1 = NULL;
    int *alloc2 = NULL;

    alloc1 = malloc(4);
    if (!alloc1) return NULL;
    alloc2 = malloc(4);
    if (!alloc2) {
        // Here we should free(alloc1) or leak memory
        return NULL;
    }

    // Here we should free alloc2 or leak memory
    return alloc1;
}
