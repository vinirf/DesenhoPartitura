//
//  Instrumento.m
//  DesenhoPartitura
//
//  Created by Vinicius Resende Fialho on 07/06/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import "Instrumento.h"

@implementation Instrumento


-(void)ordenaNotas:(NSMutableArray*)listaNotas {
    
//    self.ordemNotasInstrumento = [[NSMutableArray alloc]init];
    self.ordemNotasInstrumento = listaNotas;
}

-(int)retornarNumeroNotaInstrumento:(NSMutableArray*)listaNotasInstrumento :(NSString*)notaXML{
    
    int contadorDeNota = self.numeroIniciaNota;
    
    for(int i=0;i<listaNotasInstrumento.count;i++){
        NSString *nota = [listaNotasInstrumento objectAtIndex:i];
        if([notaXML isEqualToString:nota]){
            return contadorDeNota;
        }
        contadorDeNota ++;
    }
    
    return 0;
}


-(NSString*)retornaIndiceListaMusicas:(NSString*)nota :(int)escalaTom{
    
    NSString *notaAcima;
    
    for(int i=0;i<self.ordemNotasInstrumento.count;i++){
        if([nota isEqualToString:[self.ordemNotasInstrumento objectAtIndex:i]]){
            notaAcima = [self.ordemNotasInstrumento objectAtIndex:i+escalaTom];
            return notaAcima;
        }
    }
    
    return NULL;
}

@end
