//
//  DataBaseNotaPadrao.h
//  DesenhoPartitura
//
//  Created by VINICIUS RESENDE FIALHO on 24/06/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Nota.h"

@interface DataBaseNotaPadrao : NSObject {
    
}

//Metodos
+(DataBaseNotaPadrao*)sharedManager;

@property NSMutableArray *listaNotasPadroes;


-(Nota*)retornaNotaPadrao:(NSString*)nomeNota;


@end
