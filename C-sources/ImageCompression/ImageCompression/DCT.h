//
//  DCT.h
//  ImageCompression
//
//  Created by Andrey Moskvin on 3/20/13.
//
//

#ifndef ImageCompression_DCT_h
#define ImageCompression_DCT_h

void dct(double data[8][8], const int color[8][8]);

void idct(int colors[8][8], const double data[8][8]);

#endif
