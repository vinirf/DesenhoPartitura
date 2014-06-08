//
//  Partitura.h
//  DesenhoPartitura
//
//  Created by Vinicius Resende Fialho on 07/06/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Nota.h"

@interface Partitura : NSObject {
    
}


@property NSString *divisaoPartitura;
@property NSString *armaduraClave;
@property NSString *numeroTempo;
@property NSString *unidadeTempo;
@property NSString *tipoClave;
@property NSString *linhaClave;
@property NSMutableArray *listaNotasPartitura;

@end
