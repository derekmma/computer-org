#include <stdio.h>
int len(char *s) {
    int len;
    for (len=0; *s != '\0'; s++) len++;
    return len;
}

int main () {
    char[] str = "string";
    int a = len(str);
    printf("%d",a);
}