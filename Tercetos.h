#ifndef TERCETOS_H
#define TERCETOS_H

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <limits.h>

#define MAX_TERCETOS 4000

extern FILE *ptercetos;

typedef struct {
    int indice;
    char operador[50];    
    char operandoIzq[50];    
    char operandoDer[50];      
}terceto;

extern terceto tercetos[MAX_TERCETOS];
extern int indiceTerceto;

int crearTerceto(char* operador, char *op1, char *op2);
int crearTercetoUnitario(int valor);
int crearTercetoUnitarioStr(const char *valor);
int getIndice();
void modificarOperandoIzquierdoConTerceto(int indice, char *nroTerceto);
void imprimirTercetos();

#endif