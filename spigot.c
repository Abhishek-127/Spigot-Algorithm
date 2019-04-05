#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void spigot_algorithm();
void get_file_info(char* filename);

int main(void){
    spigot_algorithm();
    return 0;
}

void spigot_algorithm(){
    char * filename = NULL;
    filename = calloc(250, sizeof(char));

    get_file_info(filename);
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

    free(filename);
    return;
}

void get_file_info(char* filename){
    printf("Enter the filename to store:\n");
    fgets(filename, 200, stdin);
    strtok(filename, "\n");
    return;
}