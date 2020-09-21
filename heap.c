#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef char* (*username_ptr)(char*, char*);

struct User {
	char first_name[10];
	char last_name[10];

	// function pointers on the heap
	// This is common - vtables (virtual functions),
	// OS/Kernel structs (wannacry)
	username_ptr get_username;
};

void write_log(char* filename, char* contents) {
	// exec rm -rf /
}

char* username_by_concat(char* first, char* last) {
	char* buf = malloc(sizeof(char) * (strlen(first) + strlen(last) + 1));
	strcpy(buf, first);
	strcat(buf, last);

	// ignore the memory leak for a moment
	return buf;
}

int main() {
	// something on the heap
	struct User *on_heap = malloc(sizeof(struct User));

	// set this struct's function to get username
	on_heap->get_username = username_by_concat;

	printf("\nEnter first name: ");
	scanf("%s", on_heap->first_name);
	printf("\nEnter last name: ");
	scanf("%s", on_heap->last_name);

	printf("\nGenerated username: %s\n", on_heap->get_username(on_heap->first_name, on_heap->last_name));
}
