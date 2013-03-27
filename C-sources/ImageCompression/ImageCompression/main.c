//
//  main.c
//  ImageCompression
//
//  Created by Andrey Moskvin on 3/20/13.
//
//

#include <stdio.h>
#include "qdbmp.h"
#include "DCT.h"
#include <math.h>

struct CompressedEntry {
    int count;
    int value;
};

struct CompressedSequence {
    int count;
    struct CompressedEntry* entires;
};

void rle_encode(struct CompressedEntry entry[64], const int transformant[8][8])
{
    int currentValue = transformant[0][0];
    int currentSection = 0;
    int entryIndex = 0;
    
    for (int y = 0; y < 8; y += 1)
    {
        for (int x = 0; x < 8; x += 1)
        {
            int value = transformant[x][y];
            if (currentValue != value)
            {
                entry[entryIndex].count = currentSection;
                entry[entryIndex].value = currentValue;
                entryIndex += 1;
                
                currentValue = value;
                currentSection = 1;
            }
            else
            {
                currentSection += 1;
            }
        }
    }
    entry[entryIndex].count = currentSection;
    entry[entryIndex].value = currentValue;
}

void rle_decode(int transformant[8][8], const struct CompressedEntry entries[64])
{
    int entryIndex = 0;
    int serieIndex = entries[entryIndex].count;
    
    for (int y = 0; y < 8; y += 1)
    {
        for (int x = 0; x < 8; x += 1)
        {
            transformant[x][y] = entries[entryIndex].value;
            serieIndex -= 1;
            
            if (serieIndex == 0)
            {
                entryIndex += 1;
                serieIndex = entries[entryIndex].count;
            }
        }
    }
}

int main(int argc, const char * argv[])
{
    BMP*    bmp;
    
    const char * inputImagePath = argv[1];
    const char * outputImagePath = argv[2];

    /* Read an image file */

    bmp = BMP_ReadFile( inputImagePath );
    BMP_CHECK_ERROR( stderr, -1 ); /* If an error has occurred, notify and exit */
    
    int redTransformant[8][8];
    int greenTransformant[8][8];
    int blueTransformant[8][8];

    double dct_redTransformant[8][8];
    double dct_greenTransformant[8][8];
    double dct_blueTransformant[8][8];
    
    int signs_redTransformant[8][8];
    int signs_blueTransformant[8][8];
    int signs_greenTransformnt[8][8];
    
    int int_redTransformant[8][8];
    int int_greenTransformant[8][8];
    int int_blueTransformant[8][8];
    
    struct CompressedEntry redEntries[64];
    struct CompressedEntry greenEntries[64];
    struct CompressedEntry blueEntries[64];
    
    for (int heightNumber = 0; heightNumber < BMP_GetHeight(bmp); heightNumber +=8 )
    {
        for (int widthNumber = 0; widthNumber < BMP_GetWidth(bmp); widthNumber += 8)
        {
            for (int y = 0; y < 8; y += 1)
            {
                for (int x = 0; x < 8; x += 1)
                {
                    UCHAR r,g,b;
                    BMP_GetPixelRGB(bmp, widthNumber + x, heightNumber + y,
                                    &r,&g,&b);
                    
                    redTransformant[x][y] = r;
                    greenTransformant[x][y] = g;
                    blueTransformant[x][y] = b;
                }
            }
            
            dct(dct_redTransformant, redTransformant);
            dct(dct_greenTransformant, greenTransformant);
            dct(dct_blueTransformant, blueTransformant);
//            
//            // Separate signs
//            for (int y = 0; y < 8; y += 1)
//            {
//                for (int x = 0; x < 8; x += 1)
//                {
//                    signs_redTransformant[x][y] = signbit(dct_redTransformant[x][y]);
//                    signs_greenTransformnt[x][y] = signbit(dct_greenTransformant[x][y]);
//                    signs_blueTransformant[x][y] = signbit(dct_blueTransformant[x][y]);
//                    
//                    int_redTransformant[x][y] = fabs(round(dct_redTransformant[x][y]));
//                    int_greenTransformant[x][y] = fabs(round(dct_greenTransformant[x][y]));
//                    int_blueTransformant[x][y] = fabs(round(dct_blueTransformant[x][y]));
//                }
//            }
//            
//            // RLE
//            
//            rle_encode(redEntries, int_redTransformant);
//            rle_encode(greenEntries, int_greenTransformant);
//            rle_encode(blueEntries, int_blueTransformant);
//            
//            rle_decode(int_redTransformant, redEntries);
//            rle_decode(int_greenTransformant, greenEntries);
//            rle_decode(int_blueTransformant, blueEntries);
//            
//            // Apply signs
//            for (int y = 0; y < 8; y += 1)
//            {
//                for (int x = 0; x < 8; x += 1)
//                {
//                    if (signs_redTransformant[x][y] == 1)
//                    {
//                        dct_redTransformant[x][y] = -int_redTransformant[x][y];
//                    }
//                    if (signs_greenTransformnt[x][y] == 1)
//                    {
//                        dct_greenTransformant[x][y] = -int_greenTransformant[x][y];
//                    }
//                    if (signs_blueTransformant[x][y] == 1)
//                    {
//                        dct_blueTransformant[x][y] = -int_blueTransformant[x][y];
//                    }
//                }
//            }
//            
            idct(redTransformant, dct_redTransformant);
            idct(greenTransformant, dct_greenTransformant);
            idct(blueTransformant, dct_blueTransformant);
            
            for (int y = 0; y < 8; y += 1)
            {
                for (int x = 0; x < 8; x += 1)
                {
                    UCHAR r,g,b;
                    
                    r = redTransformant[x][y];
                    g = greenTransformant[x][y];
                    b = blueTransformant[x][y];
                    
                    BMP_SetPixelRGB(bmp, widthNumber + x, heightNumber + y, r, g, b);
                }
            }
        }
    }
    /* Save result */
    BMP_WriteFile( bmp, outputImagePath );
    BMP_CHECK_ERROR( stderr, -2 );
    
    /* Free all memory allocated for the image */
    BMP_Free( bmp );
    
    return 0;
}

