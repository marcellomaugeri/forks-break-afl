#include<cstdlib>
#include<unistd.h>
#include<signal.h>
#include<stdint.h>
#include<sys/wait.h>

int main(int argc, char **argv){
	pid_t pid = fork();
	if(pid==0){ //Child process
  		if((int)(*argv[0]) > 0){ ; } else { ; }
	}  else { //Parent process
		wait(NULL); //Wait for child to terminate
	}
	return 0;
}