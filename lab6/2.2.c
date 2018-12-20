#include <stdio.h>
#include <unistd.h>

int main(void)
{	
    int pid = fork();
    if (pid == 0) 
    {
	sleep(5);
	printf("Это сообщение из дочернего процесса.\n");
    } else if (pid > 0) 
    {
	sleep(10);
	printf("Это сообщение из родительского процесса.\n");
    }
    return 0;
}
