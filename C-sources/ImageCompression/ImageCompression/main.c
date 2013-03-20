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

int main(int argc, const char * argv[])
{
    BMP*    bmp;
    UINT    width, height;
    
    const char * inputImagePath = argv[1];
    const char * outputImagePath = argv[2];

    /* Read an image file */

    bmp = BMP_ReadFile( inputImagePath );
    BMP_CHECK_ERROR( stderr, -1 ); /* If an error has occurred, notify and exit */
    
    float** redTransformant = calloc_mat(8, 8);
    float** greenTransformant = calloc_mat(8, 8);
    float** blueTransformant = calloc_mat(8, 8);
    
    float** dct_redTransformant = calloc_mat(8, 8);
    float** dct_greenTransformant = calloc_mat(8, 8);
    float** dct_blueTransformant = calloc_mat(8, 8);

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
            
            dct(dct_redTransformant, redTransformant, 8, 8);
            dct(dct_greenTransformant, greenTransformant, 8, 8);
            dct(dct_blueTransformant, blueTransformant, 8, 8);
            
            idct(redTransformant, dct_redTransformant, 8, 8);
            idct(greenTransformant, dct_greenTransformant, 8, 8);
            idct(blueTransformant, dct_blueTransformant, 8, 8);
            
            for (int y = 0; y < 8; y += 1)
            {
                for (int x = 0; x < 8; x += 1)
                {
                    UCHAR r,g,b;
                    
                    r = (roundf(redTransformant[x][y]));
                    g = (roundf(greenTransformant[x][y]));
                    b = (roundf(blueTransformant[x][y]));
                    
                    BMP_SetPixelRGB(bmp, widthNumber + x, heightNumber + y, r, g, b);
                }
            }
        }
    }
    free_mat(redTransformant);
    free_mat(greenTransformant);
    free_mat(blueTransformant);
    
    free_mat(dct_redTransformant);
    free_mat(dct_greenTransformant);
    free_mat(dct_blueTransformant);
    
    /* Save result */
    BMP_WriteFile( bmp, outputImagePath );
    BMP_CHECK_ERROR( stderr, -2 );
    
    /* Free all memory allocated for the image */
    BMP_Free( bmp );
    
    return 0;
}

