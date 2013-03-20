//
//  main.c
//  ImageCompression
//
//  Created by Andrey Moskvin on 3/20/13.
//
//

#include <stdio.h>
#include "qdbmp.h"

int main(int argc, const char * argv[])
{
    BMP*    bmp;
    UINT    width, height;
    
    const char * inputImagePath = argv[1];
    const char * outputImagePath = argv[2];

    /* Read an image file */

    bmp = BMP_ReadFile( inputImagePath );
    BMP_CHECK_ERROR( stderr, -1 ); /* If an error has occurred, notify and exit */
    
    /* Get image's dimensions */
    width = BMP_GetWidth( bmp );
    height = BMP_GetHeight( bmp );
        
    /* Save result */
    BMP_WriteFile( bmp, outputImagePath );
    BMP_CHECK_ERROR( stderr, -2 );
    
    /* Free all memory allocated for the image */
    BMP_Free( bmp );
    
    return 0;
}

