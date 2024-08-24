#include <stdio.h>
int func1(){
    return 1;
}
int func2(int a){
    return a;
}
int main(){
    int a = 0;
    int  b = 1;
    if(a>b) func1();
    else func2(b);
    
}