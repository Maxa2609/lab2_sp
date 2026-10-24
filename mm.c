#include <stdio.h>
#define N 1024
static double A[N][N], B[N][N], C[N][N];

__attribute__((noinline)) void init(void){
    for(int i=0;i<N;i++) for(int j=0;j<N;j++){ A[i][j]=i+j; B[i][j]=i-j; }
}
__attribute__((noinline)) void multiply(void){
    for(int i=0;i<N;i++)
        for(int k=0;k<N;k++)
            for(int j=0;j<N;j++)
                C[i][j]+=A[i][k]*B[k][j];
}
int main(void){
    init(); multiply();
    printf("%f\n", C[N/2][N/2]);
    return 0;
}
