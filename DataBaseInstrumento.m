//
//  DataBaseInstrumento.m
//  DesenhoPartitura
//
//  Created by Vinicius Resende Fialho on 07/06/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import "DataBaseInstrumento.h"

@implementation DataBaseInstrumento



+(DataBaseInstrumento*)sharedManager{
    static DataBaseInstrumento *unicoInstrumento = nil;
    if(!unicoInstrumento){
        unicoInstrumento = [[super allocWithZone:nil]init];
    }
    return unicoInstrumento;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

-(id)init{
    self = [super init];
    if(self){
          self.listaInstrumentos = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)instanciaInstrumentoViolao{
    Instrumento *instr1 = [[Instrumento alloc]init];
    instr1.nomeInstrumento = @"natural";
    
    NSMutableArray *nomeNotas = [[NSMutableArray alloc]init];
    [nomeNotas addObject:@"0A"];
    [nomeNotas addObject:@"0AS"];
    [nomeNotas addObject:@"0B"];
    [nomeNotas addObject:@"1C"];
    [nomeNotas addObject:@"1Cs"];
    [nomeNotas addObject:@"1D"];
    [nomeNotas addObject:@"1Ds"];
    [nomeNotas addObject:@"1E"];
    [nomeNotas addObject:@"1F"];
    [nomeNotas addObject:@"1Fs"];
    [nomeNotas addObject:@"1G"];
    [nomeNotas addObject:@"1Gs"];
    [nomeNotas addObject:@"1A"];
    [nomeNotas addObject:@"1As"];
    [nomeNotas addObject:@"1B"];
    [nomeNotas addObject:@"2C"];
    [nomeNotas addObject:@"2Cs"];
    [nomeNotas addObject:@"2D"];
    [nomeNotas addObject:@"2Ds"];
    [nomeNotas addObject:@"2E"];
    [nomeNotas addObject:@"2F"];
    [nomeNotas addObject:@"2Fs"];
    [nomeNotas addObject:@"2G"];
    [nomeNotas addObject:@"2Gs"];
    [nomeNotas addObject:@"2A"];
    [nomeNotas addObject:@"2As"];
    [nomeNotas addObject:@"2B"];
    [nomeNotas addObject:@"3C"];
    [nomeNotas addObject:@"3Cs"];
    [nomeNotas addObject:@"3D"];
    [nomeNotas addObject:@"3Ds"];
    [nomeNotas addObject:@"3E"];
    [nomeNotas addObject:@"3F"];
    [nomeNotas addObject:@"3Fs"];
    [nomeNotas addObject:@"3G"];
    [nomeNotas addObject:@"3Gs"];
    [nomeNotas addObject:@"3A"];
    [nomeNotas addObject:@"3As"];
    [nomeNotas addObject:@"3B"];
    [nomeNotas addObject:@"4C"];
    [nomeNotas addObject:@"4Cs"];
    [nomeNotas addObject:@"4D"];
    [nomeNotas addObject:@"4Ds"];
    [nomeNotas addObject:@"4E"];
    [nomeNotas addObject:@"4F"];
    [nomeNotas addObject:@"4Fs"];
    [nomeNotas addObject:@"4G"];
    [nomeNotas addObject:@"4Gs"];
    [nomeNotas addObject:@"4A"];
    [nomeNotas addObject:@"4As"];
    [nomeNotas addObject:@"4B"];
    [nomeNotas addObject:@"5C"];
    [nomeNotas addObject:@"5Cs"];
    [nomeNotas addObject:@"5D"];
    [nomeNotas addObject:@"5Ds"];
    [nomeNotas addObject:@"5E"];
    [nomeNotas addObject:@"5F"];
    [nomeNotas addObject:@"5Fs"];
    [nomeNotas addObject:@"5G"];
    [nomeNotas addObject:@"5Gs"];
    [nomeNotas addObject:@"5A"];
    [nomeNotas addObject:@"5As"];
    [nomeNotas addObject:@"5B"];
    [nomeNotas addObject:@"6C"];
    [nomeNotas addObject:@"6Cs"];
    [nomeNotas addObject:@"6D"];
    [nomeNotas addObject:@"6Ds"];
    [nomeNotas addObject:@"6E"];
    [nomeNotas addObject:@"6F"];
    [nomeNotas addObject:@"6Fs"];
    [nomeNotas addObject:@"6G"];
    [nomeNotas addObject:@"6Gs"];
    [nomeNotas addObject:@"6A"];
    [nomeNotas addObject:@"6As"];
    [nomeNotas addObject:@"6B"];
    [nomeNotas addObject:@"7C"];
    [nomeNotas addObject:@"7Cs"];
    [nomeNotas addObject:@"7D"];
    [nomeNotas addObject:@"7Ds"];
    [nomeNotas addObject:@"7E"];
    [nomeNotas addObject:@"7F"];
    [nomeNotas addObject:@"7Fs"];
    [nomeNotas addObject:@"7G"];
    [nomeNotas addObject:@"7Gs"];
    [nomeNotas addObject:@"7A"];
    [nomeNotas addObject:@"7As"];
    [nomeNotas addObject:@"7B"];
    [nomeNotas addObject:@"8C"];
    //[instr1 ordenaNotas:nomeNotas];
    instr1.ordemNotasInstrumento = nomeNotas;
    instr1.numeroIniciaNota = 15;
    instr1.metodoPrimeiroTocar = @"tocarPrimeiroPentagramaViolao";
    instr1.metodoSegundoTocar = @"tocarSegundoPentagramaViolao";
    
    [self AddInstrumento:instr1];

}

-(void)instanciaInstrumentoPiano{
    Instrumento *instr1 = [[Instrumento alloc]init];
    instr1.nomeInstrumento = @"Piano";
    
    NSMutableArray *nomeNotas = [[NSMutableArray alloc]init];
    [nomeNotas addObject:@"0A"];
    [nomeNotas addObject:@"0AS"];
    [nomeNotas addObject:@"0B"];
    [nomeNotas addObject:@"1C"];
    [nomeNotas addObject:@"1Cs"];
    [nomeNotas addObject:@"1D"];
    [nomeNotas addObject:@"1Ds"];
    [nomeNotas addObject:@"1E"];
    [nomeNotas addObject:@"1F"];
    [nomeNotas addObject:@"1Fs"];
    [nomeNotas addObject:@"1G"];
    [nomeNotas addObject:@"1Gs"];
    [nomeNotas addObject:@"1A"];
    [nomeNotas addObject:@"1As"];
    [nomeNotas addObject:@"1B"];
    [nomeNotas addObject:@"2C"];
    [nomeNotas addObject:@"2Cs"];
    [nomeNotas addObject:@"2D"];
    [nomeNotas addObject:@"2Ds"];
    [nomeNotas addObject:@"2E"];
    [nomeNotas addObject:@"2F"];
    [nomeNotas addObject:@"2Fs"];
    [nomeNotas addObject:@"2G"];
    [nomeNotas addObject:@"2Gs"];
    [nomeNotas addObject:@"2A"];
    [nomeNotas addObject:@"2As"];
    [nomeNotas addObject:@"2B"];
    [nomeNotas addObject:@"3C"];
    [nomeNotas addObject:@"3Cs"];
    [nomeNotas addObject:@"3D"];
    [nomeNotas addObject:@"3Ds"];
    [nomeNotas addObject:@"3E"];
    [nomeNotas addObject:@"3F"];
    [nomeNotas addObject:@"3Fs"];
    [nomeNotas addObject:@"3G"];
    [nomeNotas addObject:@"3Gs"];
    [nomeNotas addObject:@"3A"];
    [nomeNotas addObject:@"3As"];
    [nomeNotas addObject:@"3B"];
    [nomeNotas addObject:@"4C"];
    [nomeNotas addObject:@"4Cs"];
    [nomeNotas addObject:@"4D"];
    [nomeNotas addObject:@"4Ds"];
    [nomeNotas addObject:@"4E"];
    [nomeNotas addObject:@"4F"];
    [nomeNotas addObject:@"4Fs"];
    [nomeNotas addObject:@"4G"];
    [nomeNotas addObject:@"4Gs"];
    [nomeNotas addObject:@"4A"];
    [nomeNotas addObject:@"4As"];
    [nomeNotas addObject:@"4B"];
    [nomeNotas addObject:@"5C"];
    [nomeNotas addObject:@"5Cs"];
    [nomeNotas addObject:@"5D"];
    [nomeNotas addObject:@"5Ds"];
    [nomeNotas addObject:@"5E"];
    [nomeNotas addObject:@"5F"];
    [nomeNotas addObject:@"5Fs"];
    [nomeNotas addObject:@"5G"];
    [nomeNotas addObject:@"5Gs"];
    [nomeNotas addObject:@"5A"];
    [nomeNotas addObject:@"5As"];
    [nomeNotas addObject:@"5B"];
    [nomeNotas addObject:@"6C"];
    [nomeNotas addObject:@"6Cs"];
    [nomeNotas addObject:@"6D"];
    [nomeNotas addObject:@"6Ds"];
    [nomeNotas addObject:@"6E"];
    [nomeNotas addObject:@"6F"];
    [nomeNotas addObject:@"6Fs"];
    [nomeNotas addObject:@"6G"];
    [nomeNotas addObject:@"6Gs"];
    [nomeNotas addObject:@"6A"];
    [nomeNotas addObject:@"6As"];
    [nomeNotas addObject:@"6B"];
    [nomeNotas addObject:@"7C"];
    [nomeNotas addObject:@"7Cs"];
    [nomeNotas addObject:@"7D"];
    [nomeNotas addObject:@"7Ds"];
    [nomeNotas addObject:@"7E"];
    [nomeNotas addObject:@"7F"];
    [nomeNotas addObject:@"7Fs"];
    [nomeNotas addObject:@"7G"];
    [nomeNotas addObject:@"7Gs"];
    [nomeNotas addObject:@"7A"];
    [nomeNotas addObject:@"7As"];
    [nomeNotas addObject:@"7B"];
    [nomeNotas addObject:@"8C"];
    [instr1 ordenaNotas:nomeNotas];
    
    instr1.numeroIniciaNota = 21;
    instr1.metodoPrimeiroTocar = @"tocarpentagrama1";
    instr1.metodoSegundoTocar = @"tocarpentagrama2";
    
    [self AddInstrumento:instr1];
    
}



-(void)addInstrumentosPadroesDoApplicativo {
    
    [self instanciaInstrumentoPiano];
    [self instanciaInstrumentoViolao];
}


-(void)AddInstrumento:(Instrumento *)instrumento{
    
    [[[DataBaseInstrumento sharedManager]listaInstrumentos]addObject:instrumento];
    
}

-(Instrumento*)retornaInstrumento:(NSString*)nomeInstrumentoRetorna{
   
    Instrumento *instrumento;
    
    for(int i=0;i<self.listaInstrumentos.count;i++){
        instrumento = [[self listaInstrumentos] objectAtIndex:i];
        if([[instrumento nomeInstrumento]isEqualToString:nomeInstrumentoRetorna]){
            return  instrumento;
        }
    }
    
    return [[self listaInstrumentos ] objectAtIndex:0];
}


@end






