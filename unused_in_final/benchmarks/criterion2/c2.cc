#include<cstdlib>
#include<unistd.h>
#include<signal.h>
#include<stdint.h>

extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
	pid_t pid = fork();
	if(pid==0){ //Child process
		while(1){;} //Simulation of blocking code
	} 
  	return 0;
}