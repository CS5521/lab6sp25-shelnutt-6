#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char * argv[])
{
	int n;
	n = fkc(1);

	printf(1, "number of forks when program starts: %d\n", n);

	int pid_1 = fork();
	if (pid_1 == 0)
	{
		exit();
	}

	int pid_2 = fork();
	if (pid_2 == 0)
	{
		exit();
	}

	n = fkc(1);
	printf(1, "number of forks after two more forks: %d\n", n);

	fkc(0); // clear
	n = fkc(1);
	printf(1, "number of forks after fork count cleared: %d\n",n);

	int pid3 = fork();
	if (pid3 == 0)
	{
		exit();
	}
	
	int pid4 = fork();
	if (pid4 == 0)
	{
		exit();
	}

	int pid5 = fork();
	if(pid5 == 0)
	{
		exit();
	}

	n = fkc(1);
	printf(1, "number of forks after three more forks: %d\n", n);

	wait();
	wait();
	wait();
	wait();
	wait();

	exit();
}
