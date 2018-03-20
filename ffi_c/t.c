#include<stdio.h>
#include<stdint.h>

struct constr_t {
    int a;
    int b;
    struct innerstr {
        int x;
        int y;
    } c;
};

void print_pconstr_t(struct constr_t *t)
{
    printf("a:%d\n", t->a);
    printf("b:%d\n", t->b);
    printf("c.x:%d\n", t->c.x);
    printf("c.y:%d\n", t->c.y);
}

int print_i(int x)
{
    printf("x: %d\n", x);
}

int print_pi(int *px)
{
    printf("px: %d\n", *px);
}

void print(const char *s)
{
    printf("%s\n", s);
}

