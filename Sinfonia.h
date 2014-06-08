//
//  Sinfonia.h
//  DesenhoPartitura
//
//  Created by Vinicius Resende Fialho on 07/06/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Partitura.h"
#import "Instrumento.h"
#import "DataBaseInstrumento.h"
#import "SoundBankPlayer.h"
#import "Nota.h"
//#import "LeitorPartituraXML.h"

#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>
#import <AudioToolbox/AudioToolbox.h>
#import <QuartzCore/QuartzCore.h>


@interface Sinfonia : NSObject < NSXMLParserDelegate >{
    
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
    
    NSMutableArray *recebeOrdemNotasDoInstrumento;
    
    int auxIndiceNotas;
    int auxIndiceNotas2;
    BOOL estadoStaff;
    
    float controleVelocidaTranNota;
    
    SoundBankPlayer *_soundBankPlayer;
    SoundBankPlayer *_soundBankPlayer2;
    

}

//////////////////// Atributos da Sinfonia ////////////////

@property NSString *nomeSinfonia;
@property NSString *dataSinfonia;
@property NSString *nomeInstrumentoSinfonia;
@property NSMutableArray *listaPartiturasSinfonia;
@property NSString *numeroCompassos;

//////////////////// ATRIBUTOS XML //////////////////////////


@property Instrumento *instrumento;


-(void)metodoIniciaSinfonia:(NSString*)nomePartitura :(NSString*)nomeInstrumento;
+(Sinfonia*)sharedManager;


@property SEL selectors;
@property NSString *no;
-(void)teste;
@end






