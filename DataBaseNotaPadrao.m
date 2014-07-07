//
//  DataBaseNotaPadrao.m
//  DesenhoPartitura
//
//  Created by VINICIUS RESENDE FIALHO on 24/06/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import "DataBaseNotaPadrao.h"

@implementation DataBaseNotaPadrao


+(DataBaseNotaPadrao*)sharedManager{
    static DataBaseNotaPadrao *unicoInstrumento = nil;
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
        self.listaNotasPadroes = [[NSMutableArray alloc]init];
        [self addNotasPadroesDoApplicativo];
    }
    return self;
}


-(void)addNotasPadroesDoApplicativo {
    
    Nota *nota1 = [[Nota alloc]init];
    nota1.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1.png"]];
    nota1.nomeNota = @"semibreve";
    nota1.tipoNota = @"whole";
    
    Nota *nota2 = [[Nota alloc]init];
    nota2.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"6.png"]];
    nota2.nomeNota = @"minima";
    nota2.tipoNota = @"half";
    
    
    Nota *nota3 = [[Nota alloc]init];
    nota3.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"4.png"]];
    nota3.nomeNota = @"seminima";
    nota3.tipoNota = @"quarter";
    
    
    Nota *nota4 = [[Nota alloc]init];
    nota4.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"3.png"]];
    nota4.nomeNota = @"colcheia";
    nota4.tipoNota = @"eighth";
    
    
    Nota *nota5 = [[Nota alloc]init];
    nota5.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2.png"]];
    nota5.nomeNota = @"semicolcheia";
    nota5.tipoNota = @"16th";
    
    
    Nota *nota6 = [[Nota alloc]init];
    nota6.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"7.png"]];
    nota6.nomeNota = @"fusa";
    nota6.tipoNota = @"32th";

    
    Nota *nota7 = [[Nota alloc]init];
    nota7.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"semifusa.png"]];
    nota7.nomeNota = @"semifusa";
    nota7.tipoNota = @"64th";
    
    [self.listaNotasPadroes addObject:nota1];
    [self.listaNotasPadroes addObject:nota2];
    [self.listaNotasPadroes addObject:nota3];
    [self.listaNotasPadroes addObject:nota4];
    [self.listaNotasPadroes addObject:nota5];
    [self.listaNotasPadroes addObject:nota6];
    [self.listaNotasPadroes addObject:nota7];
   
    Nota *notaPausa1 = [[Nota alloc]init];
    notaPausa1.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"4-2Pausa.png"]];
    notaPausa1.nomeNota = @"semibrevePausa";
    notaPausa1.tipoNota = @"whole";
    
    Nota *notaPausa2 = [[Nota alloc]init];
    notaPausa2.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"4-2Pausa.png"]];
    notaPausa2.nomeNota = @"minimaPausa";
    notaPausa2.tipoNota = @"half";
    
    
    Nota *notaPausa3 = [[Nota alloc]init];
    notaPausa3.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"seminimaPausa.png"]];
    notaPausa3.nomeNota = @"seminimaPausa";
    notaPausa3.tipoNota = @"quarter";
    
    
    Nota *notaPausa4 = [[Nota alloc]init];
    notaPausa4.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"colcheiaPausa.png"]];
    notaPausa4.nomeNota = @"colcheiaPausa";
    notaPausa4.tipoNota = @"eighth";
    
    
    Nota *notaPausa5 = [[Nota alloc]init];
    notaPausa5.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"semicolcheiaPausa.png"]];
    notaPausa5.nomeNota = @"semicolcheiaPausa";
    notaPausa5.tipoNota = @"16th";
    
    
    Nota *notaPausa6 = [[Nota alloc]init];
    notaPausa6.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"fusaPausa.png"]];
    notaPausa6.nomeNota = @"fusaPausa";
    notaPausa6.tipoNota = @"32th";
    
    
    Nota *notaPausa7 = [[Nota alloc]init];
    notaPausa7.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"semifusaPausa.png"]];
    notaPausa7.nomeNota = @"semifusaPausa";
    notaPausa7.tipoNota = @"64th";
    
    [self.listaNotasPadroes addObject:notaPausa1];
    [self.listaNotasPadroes addObject:notaPausa2];
    [self.listaNotasPadroes addObject:notaPausa3];
    [self.listaNotasPadroes addObject:notaPausa4];
    [self.listaNotasPadroes addObject:notaPausa5];
    [self.listaNotasPadroes addObject:notaPausa6];
    [self.listaNotasPadroes addObject:notaPausa7];
}


-(void)AddInstrumento:(Nota*)nota{
    
    [[[DataBaseNotaPadrao sharedManager]listaNotasPadroes]addObject:nota];
    
}

-(Nota*)retornaNotaPadrao:(NSString*)nomeNota{
    
    Nota *nota;
    
    for(int i=0;i<self.listaNotasPadroes.count;i++){
        nota = [[self listaNotasPadroes] objectAtIndex:i];
        if([[nota nomeNota]isEqualToString:nomeNota]){
            return  nota;
        }
    }
    
    return NULL;
}

@end
