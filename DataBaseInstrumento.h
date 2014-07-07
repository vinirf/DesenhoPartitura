//
//  DataBaseInstrumento.h
//  DesenhoPartitura
//
//  Created by Vinicius Resende Fialho on 07/06/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Instrumento.h"

@interface DataBaseInstrumento : NSObject {
    
}

//Atributos
@property NSMutableArray *listaInstrumentos;


//Metodos
+(DataBaseInstrumento*)sharedManager;


-(void)AddInstrumento:(Instrumento *)instrumento;
-(void)addInstrumentosPadroesDoApplicativo;
-(Instrumento*)retornaInstrumento:(NSString*)nomeInstrumentoRetorna;

@end
