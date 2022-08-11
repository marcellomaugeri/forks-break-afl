#include<cstdlib>
#include<unistd.h>
#include<signal.h>

extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
  if(fork()==0){ //Crash before parent's termination
    raise(SIGSEGV);
  } else if(fork()==0) { //Crash after parent's termination
    sleep(2);
    raise(SIGSEGV);
  } else {
    sleep(1);
  }
  return 0;
}
