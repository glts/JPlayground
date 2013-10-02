#include <stdio.h>

/*
 * This is very simple, faux legacy C code with lots of ugly corners (or which
 * is basically one giant ugly corner). The only purpose of this code is to
 * help me walk along the examples of the somewhat out-of-date "J for C
 * programmers" book.
 */

#define NEMP 4
#define NCLIENTS 3

int empno[NEMP] = { 316, 317, 319, 320 };
int payrate[NEMP] = { 60, 42, 44, 54 };
int billrate[NEMP] = { 120, 90, 90, 108 };
int clientlist[NCLIENTS] = { 10011, 10012, 10025 };
int emp_client[NEMP] = { 10012, 10025, 10012, 10025 };

int hoursworked[NEMP][31] = {
    {8, 0, 3, 10, 9, 8, 8, 9, 4, 0, 8, 7, 10, 10, 12, 9, 0, 6, 8, 9, 9, 9, 0, 0, 10, 11, 9, 7, 10, 2, 0},
    {8, 0, 0, 9, 9, 8, 9, 10, 0, 0, 8, 8, 10, 7, 10, 0, 0, 7, 8, 9, 8, 9, 0, 4, 9, 8, 9, 8, 9, 0, 0},
    {5, 0, 0, 8, 9, 9, 9, 9, 0, 0, 8, 7, 0, 0, 9, 0, 2, 10, 10, 9, 11, 8, 0, 0, 8, 9, 10, 8, 9, 0, 0},
    {9, 0, 0, 9, 10, 8, 6, 6, 8, 0, 9, 8, 10, 6, 9, 7, 0, 6, 8, 8, 8, 9, 0, 5, 8, 9, 8, 8, 12, 0, 0},
};

/* Finds the number of hours each employee worked in the given month. */
void emphours(int hrs[]) {
    int i, j;
    for (i = 0; i < NEMP; ++i) {
        for (j = 0; j < 31; ++j) {
            hrs[i] += hoursworked[i][j];
        }
    }
}

/* Determines the wages earned by each employee in the given month. */
void empearnings(int earns[]) {
    int i, j;
    for (i = 0; i < NEMP; ++i) {
        for (j = 0; j < 31; ++j) {
            earns[i] += hoursworked[i][j];
        }
        earns[i] *= payrate[i];
    }
}

/* Determines the profit brought in by each employee. */
void empprofit(int profit[]) {
    int i, j, temp;
    for (i = 0; i < NEMP; ++i) {
        for (j = 0, temp = 0; j < 31; ++j) {
            temp += hoursworked[i][j];
        }
        profit[i] = temp * (billrate[i] - payrate[i]);
    }
}

/* Returns the amount to bill a given client. */
int billclient(int cno)
{
    int i, j, temp, total;
    total = 0;
    for (i = 0; i < NEMP; ++i) {
        if (emp_client[i] == cno) {
            for (j = 0, temp = 0; j < 31; ++j) {
                temp += hoursworked[i][j];
            }
            total += billrate[i] * temp;
        }
    }
    return total;
}

/* Finds for each day of the month the employee who billed the most hours. */
void dailydrudge(int drudges[31])
{
    int i, j, highhours;
    for (i = 0; i < 31; ++i) {
        highhours = -1;
        for (j = 0; j < NEMP; ++j) {
            if (hoursworked[j][i] > highhours) {
                drudges[i] = empno[j];
                highhours = hoursworked[j][i];
            }
        }
    }
}

int main(int argc, char *argv[])
{
    int i;

    /* Problem 1 */
    int hrs[NEMP];
    emphours(hrs);
    for (i = 0; i < NEMP-1; i++) {
        printf("%d ", hrs[i]);
    }
    printf("%d\n", hrs[NEMP-1]);

    /* Problem 2 */
    int earns[NEMP];
    empearnings(earns);
    for (i = 0; i < NEMP-1; i++) {
        printf("%d ", earns[i]);
    }
    printf("%d\n", earns[NEMP-1]);

    /* Problem 3 */
    int profit[NEMP];
    empprofit(profit);
    for (i = 0; i < NEMP-1; i++) {
        printf("%d ", profit[i]);
    }
    printf("%d\n", profit[NEMP-1]);

    /* Problem 4 */
    int clientno = 10025;
    printf("%d\n", billclient(clientno));

    /* Problem 5 */
    int drudges[31];
    dailydrudge(drudges);
    for (i = 0; i < 30; i++) {
        printf("%d ", drudges[i]);
    }
    printf("%d\n", drudges[30]);

    return 0;
}
