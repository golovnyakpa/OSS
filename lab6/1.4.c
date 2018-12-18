#include <stdio.h>

extern char **environ;
int main(int argc, char *argv[])
{
        char **p;
        int args_num, counter = 0;
        sscanf(argv[argc - 1], "%d", &args_num);
        if (args_num > 0)
        {
                for (p = environ; *p != NULL; p++) /* перебор всех элементов массива */
                {
                        printf("%s\n", *p);
                        counter++;
                        if (counter == args_num) break;
                }
				if (args_num != counter) 
				{
					printf("Ошибка ввода: слишком большое число или введена не цифра\n");
				}
		}
		else 
		{
			printf("Вы ввели 0\n");
		}
}
