//
//  DesenhaPartitura.m
//  DesenhoPartitura
//
//  Created by VINICIUS RESENDE FIALHO on 13/06/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import "DesenhaPartitura.h"

#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#define CASE(str)                       if ([__s__ isEqualToString:(str)])
#define SWITCH(s)                       for (NSString *__s__ = (s); ; )
#define DEFAULT


@implementation DesenhaPartitura

+(DesenhaPartitura*)sharedManager{
    static DesenhaPartitura *unicoInstrumento = nil;
    if(!unicoInstrumento){
        unicoInstrumento = [[super allocWithZone:nil]init];
    }
    return unicoInstrumento;
}

-(id)init{
    self = [super init];
    if(self){
            }
    return self;
}


+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}


-(void)desenhaContornoPartitura{
    
    float posVerticaRiscoPentagrama = 150.0f;
    float espacamentoRiscoPentagrama = 20.0f;
    float espacamentoEntrePentagrama = 100.0f;
    
    float posVerticalColuna = 260.0f;
    float espacamentoColunaPentagrama = 260.0f;
    float espacamentroColunaentrePentagrama = 100.0f;
    
//    NSLog(@"Numero Compassso = %@",codeValue2);
//    NSLog(@"Numero de pentragrans = %f",[codeValue2 floatValue] / 4);
    
    int numeroDivisaoPentagrama = 4;
    int numeroPentagrama;
    if([codeValue2 floatValue] / numeroDivisaoPentagrama > [codeValue2 intValue] / numeroDivisaoPentagrama ){
        numeroPentagrama = [codeValue2 intValue] / numeroDivisaoPentagrama + 1;
    }else{
        numeroPentagrama = [codeValue2 intValue] / numeroDivisaoPentagrama;
    }
    
    
    self.listaImagensColunaPentagrama = [[NSMutableArray alloc]init];
     self.listaImagensTracoPentagrama = [[NSMutableArray alloc]init];
    
    for(int i=0;i<numeroPentagrama;i++){
        for(int i =1;i<=4;i++){
            
            if(i==4){
                UIImageView *coluna = [[UIImageView alloc]
                                       initWithFrame:CGRectMake(posVerticalColuna,posVerticaRiscoPentagrama, 2.0f, 120.0f)];
                coluna.backgroundColor = [UIColor blackColor];
                posVerticalColuna += espacamentoColunaPentagrama;
                
                [ self.listaImagensColunaPentagrama addObject:coluna];
            }else{
                UIImageView *coluna = [[UIImageView alloc]
                                       initWithFrame:CGRectMake(posVerticalColuna,posVerticaRiscoPentagrama, 2.0f, 120.0f)];
                coluna.backgroundColor = [UIColor blackColor];
                posVerticalColuna += espacamentoColunaPentagrama;
        
                [ self.listaImagensColunaPentagrama addObject:coluna];
            }
        }
        
        posVerticalColuna = 250.0f;
        espacamentroColunaentrePentagrama +=  espacamentroColunaentrePentagrama;
        
        
        for(int i=0;i<5;i++){
            UIImageView *linha = [[UIImageView alloc]
                                  initWithFrame:CGRectMake(0.0f, posVerticaRiscoPentagrama + espacamentoRiscoPentagrama, 1100.0f, 2.0f)];
            linha.backgroundColor = [UIColor blackColor];
            posVerticaRiscoPentagrama = posVerticaRiscoPentagrama + espacamentoRiscoPentagrama;
   
            [ self.listaImagensTracoPentagrama addObject:linha];
        }
        
        posVerticaRiscoPentagrama = posVerticaRiscoPentagrama +  espacamentoEntrePentagrama;
        
    }
}

-(void)desenhaObjetosClave {
    
    NSString *tipoClave = [[[[Sinfonia sharedManager] listaPartiturasSinfonia] objectAtIndex:0]tipoClave];
    int linhaClave = [[[[[Sinfonia sharedManager] listaPartiturasSinfonia] objectAtIndex:0]linhaClave] intValue];
    UIImage *image = [UIImage imageNamed:@"claveSol.png"];
    UIImageView *clave = [[UIImageView alloc] initWithImage:image];
    UIImageView *posLinha = [ self.listaImagensTracoPentagrama objectAtIndex:linhaClave];
    [clave setFrame:CGRectMake(posLinha.frame.origin.x, posLinha.frame.origin.y-50,50 , 120)];
    self.tipoClave = clave;
   
    
    NSString *quantidadeArmadura = [[[[Sinfonia sharedManager] listaPartiturasSinfonia] objectAtIndex:0]armaduraClave];
    UIImage *imgArmadura = [UIImage imageNamed:@"sharp.png"];
    UIImageView *Imagemarmadura = [[UIImageView alloc] initWithImage:imgArmadura];
    UIImageView *posLinhaArmadura = [ self.listaImagensTracoPentagrama objectAtIndex:0];
    
    
    int acrecentaDistanciaArmadura = 0;
    int acrecentaDistanciaArmaduraHorizontal = 45;
    
    for(int i=0;i<[quantidadeArmadura intValue];i++){
        UIImageView *Imagemarmadura = [[UIImageView alloc] initWithImage:imgArmadura];
        [Imagemarmadura setFrame:CGRectMake(posLinhaArmadura.frame.origin.x+acrecentaDistanciaArmaduraHorizontal, posLinhaArmadura.frame.origin.y+acrecentaDistanciaArmadura,18 , 18)];
        [ self.listaArmadurasClave addObject:Imagemarmadura];
      
        acrecentaDistanciaArmadura += 25;
    }
    
    
    NSString *beats = [[[[Sinfonia sharedManager] listaPartiturasSinfonia] objectAtIndex:0]numeroTempo];
    NSString *beatsType = [[[[Sinfonia sharedManager] listaPartiturasSinfonia] objectAtIndex:0]unidadeTempo];
    UIImageView *posLinhaBeats = [ self.listaImagensTracoPentagrama objectAtIndex:0];
    UITextView * textoBeats = [[UITextView alloc] initWithFrame:CGRectMake(posLinhaBeats.frame.origin.x+75, posLinhaBeats.frame.origin.y-15, 60, 60)];
    textoBeats.font = [UIFont systemFontOfSize:50.0];
    textoBeats.backgroundColor = [UIColor clearColor];
    textoBeats.text = beats;
     self.textoNumeroTempo = textoBeats;
   
    
    
    UITextView * textoBeatsType = [[UITextView alloc] initWithFrame:CGRectMake(posLinhaBeats.frame.origin.x+75, posLinhaBeats.frame.origin.y+25, 60, 60)];
    textoBeatsType.font = [UIFont systemFontOfSize:50.0];
    textoBeatsType.backgroundColor = [UIColor clearColor];
    textoBeatsType.text = beatsType;
    self.textoUnidadeTempo = textoBeatsType;
  
    
}

-(void)desenhaPartitura{
    
    codeValue2 = [[Sinfonia sharedManager]numeroCompassos];
    
    UILabel *tituloPartitura = [[UILabel alloc] initWithFrame: CGRectMake(270,0,500,100)];
    UILabel *tipoInstrumento = [[UILabel alloc] initWithFrame: CGRectMake(270,28,500,100)];
    
    tituloPartitura.text = [[Sinfonia sharedManager] nomeSinfonia];
    tipoInstrumento.text = [[Sinfonia sharedManager] nomeInstrumentoSinfonia];
    
    [tituloPartitura setFont:[UIFont fontWithName:@"HelveticaNeue" size:36]];
    [tipoInstrumento setFont:[UIFont fontWithName:@"HelveticaNeue" size:20]];
    
    tituloPartitura.textAlignment = NSTextAlignmentCenter;
    tipoInstrumento.textAlignment = NSTextAlignmentCenter;
     self.textoNomeInstrumento = tipoInstrumento;
     self.textoNomePartitura = tituloPartitura;
    
    
    [self desenhaContornoPartitura];
    
    [self desenhaObjetosClave];
    
    int auxSoma = 30;
    int contaNumeroNotasCadaCompasso =0;
    NSMutableArray *listaNotasParaTraco = [[NSMutableArray alloc]init];
    BOOL estado  = true;
    UIImageView *nodasPartituraAdd;
    NSMutableArray *auxReordenaNotas = [[NSMutableArray alloc]init];
    NSMutableArray *auxReordenaNotasAcidentes = [[NSMutableArray alloc]init];
    int contadorAuxReordena =0;
    UIImageView *acidenteNota;

    int quantidadeNotas = [[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura].count;
    
    for(int j=0;j<[codeValue2 intValue];j++){
        
        for(int i=quantidadeNotas-1;i>=0;i--){
            
            int compassoNota = [[[[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura] objectAtIndex:i] numeroCompasso] intValue];
            
            for(int i=0;i<quantidadeNotas;i++){
                int compassoNota2 = [[[[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura] objectAtIndex:i] numeroCompasso] intValue];
                
                if(compassoNota == compassoNota2){
                    contaNumeroNotasCadaCompasso += 1;
                }
            }
            
            if(compassoNota-1 == j){
                NSString *escalaNota = [[[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura] objectAtIndex:i] nomeNota];
                
                NSString *tipoNota = [[[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura] objectAtIndex:i] tipoNota];
                
                NSString *rotacaoNota = [[[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura] objectAtIndex:i] posicaoRadiano];
                
                NSString *escudo = [[[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura] objectAtIndex:i] tom];
                
                float posEscalaNota;
                
                
                if([escalaNota isEqualToString:@""]){
                    nodasPartituraAdd = [self retornaImagemDaNotaPausa:tipoNota];
                    posEscalaNota = [self retornaPosNotaPausaPentagrama:tipoNota];
                }else{
                    nodasPartituraAdd = [self retornaImagemDaNota:tipoNota:rotacaoNota];
                    posEscalaNota = [self retornaPosNotaPentagrama:escalaNota];
                }
                
                UIImageView *posLinha = [self.listaImagensColunaPentagrama objectAtIndex:j];
                
                
                [nodasPartituraAdd setFrame:CGRectMake(posLinha.frame.origin.x-auxSoma, posLinha.frame.origin.y+posEscalaNota,tamanhoHorizontal,tamanhoVertical)];
                
                
                if(contaNumeroNotasCadaCompasso == 1){
                    auxSoma += 100;
                    [nodasPartituraAdd setFrame:CGRectMake(posLinha.frame.origin.x-auxSoma, posLinha.frame.origin.y+posEscalaNota,tamanhoHorizontal,tamanhoVertical)];
                }else if(contaNumeroNotasCadaCompasso == 2){
                    auxSoma += 120;
                }else if(contaNumeroNotasCadaCompasso == 3){
                    auxSoma += 60;
                }else if(contaNumeroNotasCadaCompasso == 4){
                    auxSoma += 50;
                }else if(contaNumeroNotasCadaCompasso == 5){
                    auxSoma += 40;
                }else if(contaNumeroNotasCadaCompasso == 6){
                    auxSoma += 30;
                }else if(contaNumeroNotasCadaCompasso == 7){
                    auxSoma += 30;
                }else if(contaNumeroNotasCadaCompasso == 8){
                    auxSoma += 25;
                }else if(contaNumeroNotasCadaCompasso == 9){
                    auxSoma += 24;
                }else if(contaNumeroNotasCadaCompasso == 10){
                    auxSoma += 23;
                }else{
                    auxSoma += 20;
                }
                
                
                [listaNotasParaTraco addObject:nodasPartituraAdd];
                [auxReordenaNotas addObject:nodasPartituraAdd];
               
                
                if([escudo isEqualToString:@"-1"]){
                    UIImage *image = [UIImage imageNamed:@"bemol"];
                     acidenteNota= [[UIImageView alloc] initWithImage:image];
                    [acidenteNota setFrame:CGRectMake(nodasPartituraAdd.frame.origin.x-10, nodasPartituraAdd.frame.origin.y,15,20)];
                }
                else if([escudo isEqualToString:@"1"]){
                    UIImage *image = [UIImage imageNamed:@"sharp"];
                    acidenteNota = [[UIImageView alloc] initWithImage:image];
                    [acidenteNota setFrame:CGRectMake(nodasPartituraAdd.frame.origin.x-10, nodasPartituraAdd.frame.origin.y,15,20)];
                }
                else if([escudo isEqualToString:@"0"]){
                    UIImage *image = [UIImage imageNamed:@"natural"];
                    acidenteNota = [[UIImageView alloc] initWithImage:image];
                    [acidenteNota setFrame:CGRectMake(nodasPartituraAdd.frame.origin.x-10, nodasPartituraAdd.frame.origin.y,15,20)];
                }else{
                    UIImage *image = [UIImage imageNamed:@"natural"];
                    acidenteNota = [[UIImageView alloc] initWithImage:image];
                    [acidenteNota setFrame:CGRectMake(nodasPartituraAdd.frame.origin.x-10, nodasPartituraAdd.frame.origin.y,0,0)];
                }
                
                [auxReordenaNotasAcidentes addObject:acidenteNota];

            }
            
            
            contaNumeroNotasCadaCompasso = 0;
            estado = false;
        }
        //distancia nota e barra de compassos
        auxSoma =40;
        
        //Aux para reordenar as notas e setar as imagens da nota
        for(int i=auxReordenaNotas.count-1;i>=0;i--){
            
            UIImageView *notaOrdenada = [auxReordenaNotas objectAtIndex:i];
            UIImageView *notaOrdenadaAcidente = [auxReordenaNotasAcidentes objectAtIndex:i];
            
            [[[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:contadorAuxReordena] setImagemNota:notaOrdenada];
            [[[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:contadorAuxReordena] setImagemAcidente:notaOrdenadaAcidente];
            
            contadorAuxReordena ++;
        }
        [auxReordenaNotas removeAllObjects];
        [auxReordenaNotasAcidentes removeAllObjects];

    }
    
    [self desenhaTracoEntreNotas];
    
}

-(void)desenhaTracoEntreNotas {
    self.listaTracoNotas = [[NSMutableArray alloc]init];
    
    for(int i=0;i<[[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura] count]-1;i++){
        
        Nota *nota = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:i];
        
        if([nota.concatenaNota isEqualToString: @"begin"]){
            
            Nota *notaAux = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:i];
            
            while(![notaAux.concatenaNota isEqualToString: @"end"]){
                nota = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:i];
                notaAux = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:i+1];
                
                UIImageView *posLinha2 =  notaAux.imagemNota;
                UIImageView *posLinha1 = nota.imagemNota;
                
                UIImage *notaNova = [UIImage imageNamed:@"seminima"];
                posLinha1.image = notaNova;
                posLinha2.image = notaNova;
 
                int tamanhoTraco = (posLinha1.frame.origin.x-posLinha2.frame.origin.x)-5;
                UIImage *traco = [UIImage imageNamed:@"4-2Pausa"];
                UIImageView *tracoView = [[UIImageView alloc] initWithImage:traco];
                [tracoView setFrame:CGRectMake(posLinha2.frame.origin.x+posLinha2.frame.size.width+tamanhoTraco, posLinha2.frame.origin.y,(posLinha2.frame.origin.x-posLinha1.frame.origin.x),10)];
                
                [self.listaTracoNotas addObject:tracoView];

                i=i+1;
            }
            
        }
    }

}

-(UIImageView*)retornaImagemDaNota:(NSString*)nomeNota :(NSString*)rotacaoNota{
    
    NSString *tipoNota;
    tamanhoHorizontal = 30;
    tamanhoVertical = 80;
    
    SWITCH (nomeNota) {
        
        CASE (@"whole") {
            tipoNota = @"semibreve";
            tamanhoHorizontal = 30;
            tamanhoVertical = 30;
            break;
        }
        CASE (@"half") {
            tipoNota = @"minima";
            break;
        }
        CASE (@"quarter") {
            tipoNota = @"seminima";
            break;
        }
        CASE (@"eighth") {
            tipoNota = @"colcheia";
            break;
        }
        CASE (@"16th") {
            tipoNota = @"semicolcheia";
            break;
        }
        CASE (@"32th") {
            tipoNota = @"fusa";
            break;
        }
        CASE (@"64th") {
            tipoNota = @"semifusa";
            break;
        }
        DEFAULT{
            tipoNota = @"sharp";
            break;
        }
    }
    
    
    
    UIImage *image = [UIImage imageNamed:tipoNota];
    CGImageRef imageRef = [image CGImage];
    UIImage *rotatedImage;
    if([rotacaoNota isEqualToString:@"down"]){
        rotatedImage = [UIImage imageWithCGImage:imageRef scale:1.0 orientation:UIImageOrientationDown];
    }else{
        rotatedImage = [UIImage imageWithCGImage:imageRef scale:1.0 orientation:UIImageOrientationUp];
    }
    
    UIImageView *nota = [[UIImageView alloc] initWithImage:rotatedImage];
    
    return nota;
}

-(UIImageView*)retornaImagemDaNotaPausa:(NSString*)nomeNota{
    
    NSString *tipoNota;
    
    tamanhoHorizontal = 23;
    tamanhoVertical = 28;
    
    SWITCH (nomeNota) {
        
        CASE (@"whole") {
            tipoNota = @"4-2Pausa";
            tamanhoHorizontal = 30;
            tamanhoVertical = 10;
            break;
        }
        CASE (@"half") {
            tipoNota = @"4-2Pausa";
            tamanhoHorizontal = 30;
            tamanhoVertical = 10;
            break;
        }
        CASE (@"quarter") {
            tipoNota = @"seminimaPausa";
            break;
        }
        CASE (@"eighth") {
            tipoNota = @"colcheiaPausa";
            break;
        }
        CASE (@"16th") {
            tipoNota = @"semicolcheiaPausa";
            break;
        }
        CASE (@"32th") {
            tipoNota = @"fusaPausa";
            break;
        }
        CASE (@"64th") {
            tipoNota = @"semifusaPausa";
            break;
        }
        DEFAULT{
            tipoNota = @"4-2Pausa";
            tamanhoHorizontal = 30;
            tamanhoVertical = 10;
            break;
        }
    }
    
    UIImage *image = [UIImage imageNamed:tipoNota];
    UIImageView *nota = [[UIImageView alloc] initWithImage:image];
    
    return nota;
}

-(float)retornaPosNotaPentagrama:(NSString*)tipoNota{
    
    float pos;
    
    SWITCH (tipoNota) {
        
        CASE (@"C") {
            pos = 50.0;
            break;
        }
        CASE (@"D") {
            pos = 45.0;
            break;
        }
        CASE (@"E") {
            pos = 37.0;
            break;
        }
        CASE (@"F") {
            pos = 17.0;
            break;
        }
        CASE (@"G") {
            pos = 7.0;
            break;
        }
        CASE (@"A") {
            pos = -4.0;
            break;
        }
        CASE (@"B") {
            pos = -13.0;
            break;
        }
        DEFAULT{
            pos = 17.0;
            break;
        }
    }
    
    
    return  pos;
    
}

-(float)retornaPosNotaPausaPentagrama:(NSString*)tipoNota{
    
    float pos;
    
    
    SWITCH (tipoNota) {
        
        CASE (@"whole") {
            pos = 40.0;
            break;
        }
        CASE (@"half") {
            pos = 50.0;
            break;
        }
        CASE (@"quarter") {
            pos = 50.0;
            break;
        }
        CASE (@"eighth") {
            pos = 50;
            break;
        }
        CASE (@"16th") {
            pos = 50;
            break;
        }
        CASE (@"32th") {
            pos = 50;
            break;
        }
        CASE (@"64th") {
            pos = 50;
            break;
        }
        DEFAULT{
            pos = 50;
            break;
        }
    }
    
    
    return  pos;
    
}

-(void)metodosDesenhaPartitura{
    
    [self desenhaPartitura];
    
}


@end