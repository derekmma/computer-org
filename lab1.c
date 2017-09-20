/*                                     */
/* Student Name: MA Mingyu(Derek)      */
/* Student Number: 14110562D           */
/*                                     */

#include <stdio.h>

/* the first function goes here */
int * doubleArr(int arr[]) {
    static int r[5];
    int i;

    for (i = 0; i < 5; ++i)
    {
        r[i] = arr[i]*2;
    }
    return r;
}

/* the second function goes here */
void * sortArr(int arr[]) {
    static int r[5];
    int i, j, a;
    for (i = 0; i < 5; ++i)
    {
        for (j = i + 1; j < 5; ++j)
        {
            if (arr[i] > arr[j])
            {
                a =  arr[i];
                arr[i] = arr[j];
                arr[j] = a;
            }
        }
    }
    return r;
}

/* main program */
int main () {
    /* given array is listed below */
    int num[5] = {11, 55, 22, 44, 33};
    int *p;
    int i;

    /* call the doubleArr function */
    p = doubleArr(num);

    /* print the five elements of array num[] */
    printf("After doubleArr function:\n");
    for (i = 0; i < sizeof(num) / sizeof (num[0]); i++)
    {
        num[i] = *(p+i);
        printf("    num[%d]: %d\n", i, num[i]);
    }

    /* call the sortArr function */
    p = sortArr(num);

    /* print the five elements of array num[] */
    printf("After sortArr function:\n");
    for (i = 0; i < sizeof(num) / sizeof (num[0]); i++)
    {
        printf("    num[%d]: %d\n", i, num[i]);
    }

    return 0;
}