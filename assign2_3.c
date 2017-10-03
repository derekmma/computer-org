#include <stdio.h>
int main () {
    int x, y;
    x = 3;
    y = 17;
    // Assume variable x and y are already been declaimed with values
    int i;
    i = 0;
    while (y != 0){
        i += x;
        y -= 1;
    }
    i += 1;
    // return i;
    printf("%d", i);
}