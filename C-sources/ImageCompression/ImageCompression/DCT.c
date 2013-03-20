//
//  DCT.c
//  ImageCompression
//
//  Created by Andrey Moskvin on 3/20/13.
//
//

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include "DCT.h"

float **calloc_mat(int dimX, int dimY){
    float **m = calloc(dimX, sizeof(float*));
    float *p = calloc(dimX*dimY, sizeof(float));
    int i;
    for(i=0; i <dimX;i++){
        m[i] = &p[i*dimY];
        
    }
    return m;
}

void free_mat(float **m){
    free(m[0]);
    free(m);
}

void dct(float **DCTMatrix, float **Matrix, int N, int M){
    
    int i, j, u, v;
    for (u = 0; u < N; ++u) {
        for (v = 0; v < M; ++v) {
            DCTMatrix[u][v] = 0;
            for (i = 0; i < N; i++) {
                for (j = 0; j < M; j++) {
                    DCTMatrix[u][v] += Matrix[i][j] * cos(M_PI/((float)N)*(i+1./2.)*u)*cos(M_PI/((float)M)*(j+1./2.)*v);
                }
            }
        }
    }
}

void idct(float **Matrix, float **DCTMatrix, int N, int M){
    int i, j, u, v;
    
    for (u = 0; u < N; ++u) {
        for (v = 0; v < M; ++v) {
            Matrix[u][v] = 1/4.*DCTMatrix[0][0];
            for(i = 1; i < N; i++){
                Matrix[u][v] += 1/2.*DCTMatrix[i][0];
            }
            for(j = 1; j < M; j++){
                Matrix[u][v] += 1/2.*DCTMatrix[0][j];
            }
            
            for (i = 1; i < N; i++) {
                for (j = 1; j < M; j++) {
                    Matrix[u][v] += DCTMatrix[i][j] * cos(M_PI/((float)N)*(u+1./2.)*i)*cos(M_PI/((float)M)*(v+1./2.)*j);
                }
            }
            Matrix[u][v] *= 2./((float)N)*2./((float)M);
        }
    }
}
