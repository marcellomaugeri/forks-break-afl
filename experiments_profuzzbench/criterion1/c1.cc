#include<cstdlib>
#include<unistd.h>
#include<signal.h>
#include<stdint.h>
#include<sys/wait.h>

int main(int argc, char **argv){
	if(fork()==0){ //Child process
		raise(SIGSEGV); //Simulated crash
	} else { //Parent process
		wait(NULL); //Wait for child to terminate
	}
	return 0;
}