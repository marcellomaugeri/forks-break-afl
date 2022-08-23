#include<cstdlib>
#include<unistd.h>
#include<signal.h>
#include<stdint.h>
#include<sys/wait.h>
#include<stdio.h>

int main(int argc, char **argv){
	pid_t pid = fork();
	if(pid==0){ //Child process
  		if(strtol(argv[1], NULL, 10)%2 == 0){ printf("Ok\n"); } else { ; }
		if(strtol(argv[1], NULL, 10)%3 == 0){ printf("Ok1\n"); } else { ; }
  		if(strtol(argv[1], NULL, 10)%5 == 0){ printf("Ok2\n"); } else { ; }
		if(strtol(argv[1], NULL, 10)%7 == 0){ printf("Ok3\n"); } else { ; }
	}  else { //Parent process
		wait(NULL); //Wait for child to terminate
	}
	return 0;
}