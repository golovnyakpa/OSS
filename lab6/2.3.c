#include <stdio.h>
#include <unistd.h>

int main ()
{
	int pid;
	int i;
	for (i=1 ; i <= 9 ; i++) //делаем на один проход меньше, так как текущая программа первый потомок bash
	{
		pid = fork();    
		if (pid) 
		{
			break;        
		}
    printf("Child PID %d\n", getpid()); 
    printf("My parent PID is %d\n \n", getppid());
    sleep(1);
	}
	sleep(14);
	return 0;
}
