#include<cstdlib>
#include<unistd.h>
#include<signal.h>
#include<stdint.h>
#include<sys/wait.h>

extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
	pid_t pid = fork();
	if(pid==0){ //Child process
  		if((int)(*data)%2 == 0){ ; } else { ; }
		if((int)(*data)%3 == 0){ ; } else { ; }
  		if((int)(*data)%5 == 0){ ; } else { ; }
  		if((int)(*data)%7 == 0){ ; } else { ; }
	}  else { //Parent process
		wait(NULL); //Wait for child to terminate
	}
	return 0;
}