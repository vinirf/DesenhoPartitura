//
//  LeitorPartituraXML.h
//  DesenhoPartitura
//
//  Created by Vinicius Resende Fialho on 08/06/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Partitura.h"
#import "Nota.h"
#import "Sinfonia.h"


@interface LeitorPartituraXML : NSObject <NSXMLParserDelegate> {
    
    NSXMLParser *parser;
    
    NSMutableArray *descricaoGeralPartitura;
    NSMutableArray *pentagramaPartitura;
    NSMutableArray *notasPartitura;
    NSMutableArray *notasPartitura2;
    
    NSString *element;
    NSString *codeValue;
    NSString *codeValue2;
    BOOL auxCodeValue2;
    
    NSMutableDictionary *item;
    NSMutableDictionary *partitura;
    NSMutableDictionary *notas;
    
    //descricao da partitura
    NSMutableString *titulo;
    NSMutableString *data;
    NSMutableString *nomeInstrumento;
    
    //partitura
    NSMutableString *n1;
    NSMutableString *armaduraClave;
    NSMutableString *numeroDeTempo;
    NSMutableString *unidadeDeTempo;
    NSMutableString *tipoClave;
    NSMutableString *linhaClave;
    
    //Notas
    NSMutableString *n2;
    NSMutableString *n3;
    NSMutableString *n4;
    NSMutableString *n5;
    NSMutableString *tom;
    NSMutableString *nivelPentagrama;
    NSMutableString *numeroCompasso;
    NSMutableString *posNotaCimaBaixo;
    NSMutableString *continuaNota;
    NSMutableString *pontoNota;
    
    NSMutableArray *recebeOrdemNotasDoInstrumento;
    
    BOOL estadoStaff;
    int auxIndiceNotas;
    int auxIndiceNotas2;
    NSString *auxCompassoPorNota;
    
}
@property NSString *numeroCompassos;

-(void)iniciaLeiuturaXML:(NSString*)nomeXML;
+(LeitorPartituraXML*)sharedManager;


@end
