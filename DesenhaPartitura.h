//
//  DesenhaPartitura.h
//  DesenhoPartitura
//
//  Created by VINICIUS RESENDE FIALHO on 13/06/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sinfonia.h"

@interface DesenhaPartitura : NSObject {
    NSString *codeValue2;

    float tamanhoHorizontal;
    float tamanhoVertical;
    
    float pos;
}

+(DesenhaPartitura*)sharedManager;
-(void)metodosDesenhaPartitura;

@property  NSMutableArray *listaImagensTracoPentagrama;
@property  NSMutableArray *listaImagensColunaPentagrama;
@property  NSMutableArray *listaArmadurasClave;
@property  NSMutableArray *listaTracoNotas;
@property  NSMutableArray *listaTracoNotasH;

@property  UITextView *textoNumeroTempo;
@property  UITextView *textoUnidadeTempo;

@property  UILabel *textoNomeInstrumento;
@property  UILabel *textoNomePartitura;

@property  UIImageView *tipoClave;



@end
