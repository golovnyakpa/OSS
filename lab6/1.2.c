#include <stdio.h>

extern char **environ;
int main(int argc, char *argv[])
{
        char **p;
        int counter;
                for (p = environ; *p != NULL; p++) /* перебор всех элементов массива */
                        counter++;
        printf("Number of environment variables is %d\n", counter);
        printf("Number of console args is %d\n", argc);
}
