#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char * argv[])
{
	int start = fkc();
	printf(1, "Starting fork count: %d\n", start);

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

	int end = fkc();
	printf(1, "Ending fork count: %d\n", end);

	wait();
	wait();

	exit();
}
