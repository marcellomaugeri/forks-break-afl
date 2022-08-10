#include<cstdlib>
#include<unistd.h>
#include<signal.h>

extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
  pid_t pid = fork();
  if(pid==0){
      raise(SIGSEGV);
  } else {
      sleep(1);
  }
  return 0;
}
