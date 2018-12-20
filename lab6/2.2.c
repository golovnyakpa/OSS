#include <stdio.h>
#include <unistd.h>

int main(void)
{	
    int pid = fork();
    if (pid == 0) 
    {
	sleep(5);
	printf("Это дочерний процесс. Мой PID: %d\nPID моего родителя : %d\n\n ", getpid(), getppid());
    } else if (pid > 0) 
    {
	sleep(10);
	printf("Это сообщение из родительского процесса. Мой PID: %d\n", getpid());
    }
    return 0;
}
