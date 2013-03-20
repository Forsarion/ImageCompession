//
//  DCT.h
//  ImageCompression
//
//  Created by Andrey Moskvin on 3/20/13.
//
//

#ifndef ImageCompression_DCT_h
#define ImageCompression_DCT_h

void dct(float **DCTMatrix, float **Matrix, int N, int M);
void idct(float **Matrix, float **DCTMatrix, int N, int M);
float **calloc_mat(int dimX, int dimY);
void free_mat(float **p);


#endif
