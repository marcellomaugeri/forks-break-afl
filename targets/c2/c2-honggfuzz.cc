#include<cstdlib>
#include<unistd.h>
#include<signal.h>
#include<stdint.h>

int main(int argc, char **argv){
	pid_t pid = fork();
	if(pid==0){ //Child process
		while(1){;} //Simulation of blocking code
	} 
  	return 0;
}