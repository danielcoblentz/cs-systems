#include <stdio.h>
#include <unistd.h>
#include <sys/stat.h>

int main() {
    char cwd[1024];
    struct stat buffer;
    
    // Print current working directory
    if (getcwd(cwd, sizeof(cwd)) != NULL) {
        printf("Current working directory: %s\n", cwd);
    }
    
    // Check if file exists
    if (stat("front.in", &buffer) == 0) {
        printf("front.in exists and file size is: %ld bytes\n", buffer.st_size);
    } else {
        printf("front.in does NOT exist\n");
    }
    
    // Try to open the file
    FILE *fp = fopen("front.in", "r");
    if (fp == NULL) {
        printf("Cannot open front.in\n");
        perror("Error details");
    } else {
        printf("Successfully opened front.in!\n");
        char buffer[100];
        if (fgets(buffer, sizeof(buffer), fp) != NULL) {
            printf("First line: %s", buffer);
        }
        fclose(fp);
    }
    
    return 0;
}