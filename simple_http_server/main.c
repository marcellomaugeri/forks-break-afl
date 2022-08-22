#include "httpd.h"
#include<signal.h>

int main(int c, char** v)
{
    serve_forever("12913");
    return 0;
}

void route()
{
    ROUTE_START()

    ROUTE_GET("/c1"){
        raise(SIGSEGV);
        //printf("HTTP/1.1 500 Internal Server Error\r\n\r\n");
    }

    ROUTE_GET("/c2"){
        while(1){;} //Simulation of blocking code
        //printf("HTTP/1.1 500 Internal Server Error\r\n\r\n");
    }

    ROUTE_GET("/c3"){
        printf("HTTP/1.1 200 OK\r\n\r\n");
        if(payload_size%2==0){
            printf("Even payload size\r\n");
        } else {
            printf("Odd payload size\r\n");
        }
    }
  
    ROUTE_END()
}