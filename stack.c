#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef char* (*username_ptr)(char*, char*);

struct User {
	char first_name[10];
	char last_name[10];
};

void write_log(char* filename, char* contents) {
	// exec rm -rf /
}

void get_user_and_save() {
	struct User foo;
	printf("\nEnter first name: ");
	scanf("%s", foo.first_name);
	printf("\nEnter last name: ");
	scanf("%s", foo.last_name);

	// save user
}

int main() {
	get_user_and_save();
}
