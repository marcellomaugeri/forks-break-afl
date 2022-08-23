#include<cstdlib>
#include<unistd.h>
#include<signal.h>
#include<stdint.h>
#include<sys/wait.h>
#include<iostream>
#include<fstream>

int main(int argc, char **argv){
	pid_t pid = fork();
	if(pid==0){ //Child process
		if(argc>1){
			std::ifstream infile(argv[1]);
			std::string s;
			if (infile.good()){
				getline(infile, s);
				long number;
				try{ 
					number = stol(s, NULL, 10);
				} catch(std::exception e) { 
					std::cout << "Invalid conversion\n";
					exit(0);
				}
				if(number%2 == 0){ printf("2\n"); } else { printf("!2\n"); }
				if(number%3 == 0){ printf("3\n"); } else { printf("!3\n"); }
				if(number%5 == 0){ printf("5\n"); } else { printf("!5\n"); }
				if(number%7 == 0){ printf("7\n"); } else { printf("!7\n"); }
			}
		}
	}  else { //Parent process
		wait(NULL); //Wait for child to terminate
	}
	return 0;
}