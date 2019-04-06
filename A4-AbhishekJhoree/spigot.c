/**
 * @author: Abhishek Jhoree
 * @email: ajhoree@uoguelph.ca
 * @id: 0986820
 * CIS 3190 Assignment 4
 **/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

/**
 * Function that performs the main functionality of the algorithm
 * writes the final output to the file
 * @param void
 * @return void
 **/
void spigot_algorithm();

/**
 * Helper funtion that helps to get the file information from the user
 * @param filename[char *] a pointer to the filename string. The input from the user will
 *  be assigned to this variable and will be used to open the file
 * @return void
 **/
void get_file_info(char* filename);

/**
 * Main function of the program
 * Makes a call to the spigot algorithm that perorms the required calculations
 * @param void
 * @return 0
 **/
int main(void){

    spigot_algorithm();
    
    return 0;
}

void spigot_algorithm(){
    char * filename = NULL;
    filename = calloc(250, sizeof(char));

    get_file_info(filename);
    // start the clock here
    clock_t start, end;
    double time_taken;

    start = clock();
    FILE *fptr = NULL;
    fptr = fopen(filename, "w+");
    if (fptr == NULL){
        printf("Failed to open/create the file!!\n");
        exit(0);
    }

    // start the spigot algo now
    int i, j, k, q, x;
    i = j = k = q = x = 0;
    int len;
    int nines = 0, predigit = 0;
    int N = 1000;

    len = (10 * N/3) + 1;
    int a[len];

    for(i = 0; i < len; i++){
        a[i] = 2;
    }
    char c = 'c';

    for(i = 1; i <= N; i++){
        q = 0;
        for(j = len; j > 0; j--){
            x = 10 * a[j - 1] + (q * j);
            a[j - 1] = x % (2 * j - 1);
            q = x / (2 * j - 1);
        }
        a[0] = q % 10;
        q = q / 10;
        if(q == 9){
            nines = nines + 1;
        }else if(q == 10){
            printf("%d", predigit + 1);
            c = predigit + 1 + '0';
            fputc(c, fptr);
            for(k = 0; k < nines; k++){
                printf("%d", 0);
                c = 0 + '0';
                fputc(c, fptr);
            }
            predigit = 0;
            nines = 0;
        }else{
            printf("%d", predigit);
            c = predigit + '0';
            fputc(c, fptr);
            predigit = q;
            if(nines != 0){
                for(k = 0; k <  nines; k++){
                    printf("%d", 9);
                    c = 9 + '0';
                    fputc(c, fptr);
                }
                nines = 0;
            }
        }
    }
    printf("%d\n", predigit);
    c = predigit + '0';
    fputc(c, fptr);
    c = '\n' + 0;
    fputc(c, fptr);
    fclose(fptr);

    
    end = clock();
    time_taken = ((double)end-start)/CLOCKS_PER_SEC;
    printf("\nspigot() took %f seconds to execute \n", time_taken); 
    printf("The output filename is: %s\n", filename);
    free(filename);
    return;
}

void get_file_info(char* filename){
    printf("Enter the filename to store:\n");
    fgets(filename, 200, stdin);
    strtok(filename, "\n");
    return;
}