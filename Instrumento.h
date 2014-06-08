//
//  Instrumento.h
//  DesenhoPartitura
//
//  Created by Vinicius Resende Fialho on 07/06/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Instrumento : NSObject {
    
}


@property NSString *nomeInstrumento;
@property NSMutableArray *ordemNotasInstrumento;
@property int numeroIniciaNota;
@property NSString *metodoPrimeiroTocar;
@property NSString *metodoSegundoTocar;


-(void)ordenaNotas:(NSMutableArray*)listaNotas;
-(NSString*)retornaIndiceListaMusicas:(NSString*)nota :(int)escalaTom;
-(int)retornarNumeroNotaInstrumento:(NSMutableArray*)listaNotasInstrumento :(NSString*)notaXML;


@end
