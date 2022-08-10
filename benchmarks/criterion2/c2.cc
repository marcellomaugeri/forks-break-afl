#include<cstdlib>
#include<unistd.h>
#include<signal.h>

extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
  pid_t pid = fork();
  if(pid==0){
    while(1){} //Simulation of blocking code
  } 
  return 0;
}
