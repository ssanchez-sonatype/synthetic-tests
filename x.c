#include <stdlib.h>
#include "x.h"
int f()
{
    void *x = malloc(10);
    void *y = malloc(10);
    if(x) {
        return 1;
    }
    if(y) {
        return 2;
    }
    return X;
}
