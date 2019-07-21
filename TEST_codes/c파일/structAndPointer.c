#include <stdio.h>
#include <stdlib.h>
int apple_add(int a, int b)
{
	return 100;
}
//구조체 
typedef struct apple {
	int i;
	int (*add) (int,int);
}Apple;

Apple* new_Apple(int j){
	Apple* n;
	n = (Apple*) malloc(sizeof(Apple));
	n-> i = j;
	n->add = apple_add;
	return n;
}
int main(){
//	struct apple* t;
//	 t = (Apple*) malloc(sizeof(Apple));
//	t = (struct apple*) malloc(sizeof(struct apple));
	Apple* t;
	t = new_Apple(100);
	printf("%d\n",(t->i+t->add(10,20)));
	free(t);
	
	return 0;
}
