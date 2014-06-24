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
    
    float posVerticaRiscoPentagrama = 120.0f;
    float espacamentoRiscoPentagrama = 20.0f;
    float espacamentoEntrePentagrama = 10.0f;
    
    float posVerticalColuna = 0.0f;
    float espacamentoColunaPentagrama = 260.0f;
    float espacamentroColunaentrePentagrama = 100.0f;
    
    int auxPar= [codeValue2 intValue];
    if(auxPar %2 ==0) auxPar = auxPar +1;
    codeValue2 = [NSString stringWithFormat:@"%d",auxPar];
    
//    NSLog(@"Numero Compassso = %@",codeValue2);
//    NSLog(@"Numero de pentragrans = %f",[codeValue2 floatValue] / 4);
    [Sinfonia sharedManager].numeroTotalCompassos = [codeValue2 intValue];
    
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
        
        posVerticalColuna = 250.0f;
        
        for(int i =1;i<=4;i++){
            
            UIImageView *coluna = [[UIImageView alloc]
                                   initWithFrame:CGRectMake(posVerticalColuna,posVerticaRiscoPentagrama+100, 2.0f, 120.0f)];
            coluna.backgroundColor = [UIColor blackColor];
            posVerticalColuna += espacamentoColunaPentagrama;
    
            [ self.listaImagensColunaPentagrama addObject:coluna];
        
        }
        
       
        espacamentroColunaentrePentagrama +=  espacamentroColunaentrePentagrama;
        
        
        for(int i=0;i<11;i++){
            UIImageView *linha = [[UIImageView alloc]
                                  initWithFrame:CGRectMake(0.0f, posVerticaRiscoPentagrama + espacamentoRiscoPentagrama, 1100.0f, 2.0f)];
            posVerticaRiscoPentagrama = posVerticaRiscoPentagrama + espacamentoRiscoPentagrama;
            linha.backgroundColor = [UIColor clearColor];

            if((i>=5)&&(i<10)){
                linha.backgroundColor = [UIColor blackColor];
            }
   
            [ self.listaImagensTracoPentagrama addObject:linha];
        }
        
        posVerticaRiscoPentagrama = posVerticaRiscoPentagrama +  espacamentoEntrePentagrama;
        
    }
}

-(void)desenhaObjetosClave {
    
    NSString *tipoClave = [[[[Sinfonia sharedManager] listaPartiturasSinfonia] objectAtIndex:0]tipoClave];
    int linhaClave = [[[[[Sinfonia sharedManager] listaPartiturasSinfonia] objectAtIndex:0]linhaClave] intValue];
    UIImageView *clave;
    
    if([tipoClave isEqualToString:@"G"]){
        UIImage *image = [UIImage imageNamed:@"claveSol.png"];
        clave = [[UIImageView alloc] initWithImage:image];
        UIImageView *posLinha = [ self.listaImagensTracoPentagrama objectAtIndex:linhaClave+5];
        [clave setFrame:CGRectMake(posLinha.frame.origin.x, posLinha.frame.origin.y-50,50,120)];
    }
    
    if([tipoClave isEqualToString:@"F"]){
        UIImage *image = [UIImage imageNamed:@"claveFa.png"];
        clave = [[UIImageView alloc] initWithImage:image];
        UIImageView *posLinha = [ self.listaImagensTracoPentagrama objectAtIndex:linhaClave+5];
        [clave setFrame:CGRectMake(posLinha.frame.origin.x, posLinha.frame.origin.y-80,55,65)];
    }

    
    self.tipoClave = clave;
    
   
    int quantidadeArmadura = [[[[[Sinfonia sharedManager] listaPartiturasSinfonia] objectAtIndex:0]armaduraClave]intValue];
    UIImage *imgArmadura;
    int nomeArmadura = 0;
    
    if(quantidadeArmadura > 0) {imgArmadura = [UIImage imageNamed:@"sharp.png"];nomeArmadura =0;}
    if(quantidadeArmadura < 0) {imgArmadura = [UIImage imageNamed:@"bemol.png"]; quantidadeArmadura = quantidadeArmadura * -1;nomeArmadura=1;}
    
    UIImageView *imagemarmadura;
    UIImageView *posLinhaArmadura = [ self.listaImagensTracoPentagrama objectAtIndex:5];
    self.listaArmadurasClave = [[NSMutableArray alloc]init];
    
    int acrecentaDistanciaArmadura = 0;
    int acrecentaDistanciaArmaduraHorizontal = 55;
    
    for(int i=0;i<quantidadeArmadura;i++){
      
        if(nomeArmadura == 0){
            switch (i) {
                case 0:
                    acrecentaDistanciaArmadura = -20;
                    break;
                case 1:
                    acrecentaDistanciaArmadura = 10;
                    break;
                case 2:
                    acrecentaDistanciaArmadura = -30;
                    break;
                case 3:
                    acrecentaDistanciaArmadura = 0;
                    break;
                case 4:
                    acrecentaDistanciaArmadura = 30;
                    break;
                case 5:
                    acrecentaDistanciaArmadura = -10;
                    break;
                case 6:
                    acrecentaDistanciaArmadura = 20;
                    break;
                default:
                    break;
            }

        }else{
            switch (i) {
                case 0:
                    acrecentaDistanciaArmadura = 10;
                    break;
                case 1:
                    acrecentaDistanciaArmadura = -20;
                    break;
                case 2:
                    acrecentaDistanciaArmadura = 20;
                    break;
                case 3:
                    acrecentaDistanciaArmadura = -10;
                    break;
                case 4:
                    acrecentaDistanciaArmadura = 30;
                    break;
                case 5:
                    acrecentaDistanciaArmadura = 0;
                    break;
                case 6:
                    acrecentaDistanciaArmadura = 40;
                    break;
                default:
                    break;
            }
        }
        
        acrecentaDistanciaArmaduraHorizontal += 17;
        imagemarmadura = [[UIImageView alloc] initWithImage:imgArmadura];
        [imagemarmadura setFrame:CGRectMake(posLinhaArmadura.frame.origin.x+acrecentaDistanciaArmaduraHorizontal, posLinhaArmadura.frame.origin.y+acrecentaDistanciaArmadura,15 , 40)];
        [ self.listaArmadurasClave addObject:imagemarmadura];
        
       
    }
    
    
    NSString *beats = [[[[Sinfonia sharedManager] listaPartiturasSinfonia] objectAtIndex:0]numeroTempo];
    NSString *beatsType = [[[[Sinfonia sharedManager] listaPartiturasSinfonia] objectAtIndex:0]unidadeTempo];
    UIImageView *posLinhaBeats = [ self.listaImagensTracoPentagrama objectAtIndex:5];
    UITextView * textoBeats = [[UITextView alloc] initWithFrame:CGRectMake(posLinhaBeats.frame.origin.x+acrecentaDistanciaArmaduraHorizontal+30, posLinhaBeats.frame.origin.y-15, 60, 60)];
    textoBeats.font = [UIFont systemFontOfSize:50.0];
    textoBeats.backgroundColor = [UIColor clearColor];
    textoBeats.text = beats;
     self.textoNumeroTempo = textoBeats;
   
    
    UITextView * textoBeatsType = [[UITextView alloc] initWithFrame:CGRectMake(posLinhaBeats.frame.origin.x+acrecentaDistanciaArmaduraHorizontal+30, posLinhaBeats.frame.origin.y+25, 60, 60)];
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
    NSMutableArray *auxReordenaNotasPontos = [[NSMutableArray alloc]init];
    int contadorAuxReordena =0;
    UIImageView *acidenteNota;
    UIImageView *pontoNota;
    float posEscalaNota;

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
                
                Nota *notaDesenho = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura] objectAtIndex:i];
                
                NSString *escalaNota = [notaDesenho nomeNota];
                NSString *tipoNota = [notaDesenho tipoNota];
                NSString *rotacaoNota = [notaDesenho posicaoRadiano];
                NSString *escudo = [notaDesenho tom];
                NSString *oitavo =[notaDesenho oitava];
                NSString *ponto = [notaDesenho pontoNota];
                
               
                UIImageView *posLinha = [self.listaImagensColunaPentagrama objectAtIndex:j+1];
                
                if([escalaNota isEqualToString:@""]){
                    nodasPartituraAdd = [self retornaImagemDaNotaPausa:tipoNota];
                    posEscalaNota = [self retornaPosNotaPausaPentagrama:tipoNota];
                }else{
                    nodasPartituraAdd = [self retornaImagemDaNota:tipoNota:rotacaoNota:oitavo:escalaNota:notaDesenho];
                    posEscalaNota = posNotaReal;
                }
            
                [nodasPartituraAdd setFrame:CGRectMake(posLinha.frame.origin.x-auxSoma,(posLinha.frame.origin.y - 168)+posEscalaNota,tamanhoHorizontal,tamanhoVertical)];
                

                if(contaNumeroNotasCadaCompasso == 1){
                    auxSoma += 100;
                    [nodasPartituraAdd setFrame:CGRectMake(posLinha.frame.origin.x-auxSoma,(posLinha.frame.origin.y - 168)+posEscalaNota,tamanhoHorizontal,tamanhoVertical)];
                }else if(contaNumeroNotasCadaCompasso == 2){
                    auxSoma += 120;
                }else if(contaNumeroNotasCadaCompasso == 3){
                    auxSoma += 60;
                }else if(contaNumeroNotasCadaCompasso == 4){
                    auxSoma += 55;
                }else if(contaNumeroNotasCadaCompasso == 5){
                    auxSoma += 50;
                }else if(contaNumeroNotasCadaCompasso == 6){
                    auxSoma += 42;
                }else if(contaNumeroNotasCadaCompasso == 7){
                    auxSoma += 35;
                }else if(contaNumeroNotasCadaCompasso == 8){
                    auxSoma += 30;
                }else if(contaNumeroNotasCadaCompasso == 9){
                    auxSoma += 24;
                }else if(contaNumeroNotasCadaCompasso == 10){
                    auxSoma += 20;
                }else{
                    auxSoma += 22;
                }
                
                
                
                [listaNotasParaTraco addObject:nodasPartituraAdd];
                [auxReordenaNotas addObject:nodasPartituraAdd];
               
                
                if([escudo isEqualToString:@"-1"]){
                    UIImage *image = [UIImage imageNamed:@"bemol"];
                     acidenteNota= [[UIImageView alloc] initWithImage:image];
                    [acidenteNota setFrame:CGRectMake(nodasPartituraAdd.frame.origin.x-13, nodasPartituraAdd.frame.origin.y-10,15,20)];
                }
                else if([escudo isEqualToString:@"1"]){
                    UIImage *image = [UIImage imageNamed:@"sharp"];
                    acidenteNota = [[UIImageView alloc] initWithImage:image];
                    [acidenteNota setFrame:CGRectMake(nodasPartituraAdd.frame.origin.x-13, nodasPartituraAdd.frame.origin.y-10,15,20)];
                }
                else if([escudo isEqualToString:@"0"]){
                    UIImage *image = [UIImage imageNamed:@"natural"];
                    acidenteNota = [[UIImageView alloc] initWithImage:image];
                    [acidenteNota setFrame:CGRectMake(nodasPartituraAdd.frame.origin.x-13, nodasPartituraAdd.frame.origin.y-10,15,24)];
                }else{
                    UIImage *image = [UIImage imageNamed:@"natural"];
                    acidenteNota = [[UIImageView alloc] initWithImage:image];
                    [acidenteNota setFrame:CGRectMake(0,0,0,0)];
                }
                
                [auxReordenaNotasAcidentes addObject:acidenteNota];
                
                if([ponto isEqualToString:@"1"]){
                    UIImage *image = [UIImage imageNamed:@"dot.gif"];
                    pontoNota = [[UIImageView alloc] initWithImage:image];
                    [pontoNota setFrame:CGRectMake(nodasPartituraAdd.frame.origin.x+30, nodasPartituraAdd.frame.origin.y+5,8,8)];
                }else{
                    UIImage *image = [UIImage imageNamed:@"dot.gif"];
                    pontoNota = [[UIImageView alloc] initWithImage:image];
                    [pontoNota setFrame:CGRectMake(0,0,0,0)];
                }
                [auxReordenaNotasPontos addObject:pontoNota];

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
            UIImageView *notaOrdenadaPonto = [auxReordenaNotasPontos objectAtIndex:i];
            
            
            [[[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:contadorAuxReordena] setImagemNota:notaOrdenada];
            [[[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:contadorAuxReordena] setImagemAcidente:notaOrdenadaAcidente];
            [[[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:contadorAuxReordena] setImagePontoNota:notaOrdenadaPonto];

            
            contadorAuxReordena ++;
        }
        
        [auxReordenaNotas removeAllObjects];
        [auxReordenaNotasAcidentes removeAllObjects];
        [auxReordenaNotasPontos removeAllObjects];

    }
    
    [self desenhaTracoEntreNotas];
    
}

-(void)desenhaLinhaNotaAteTraco{
   
    UIImageView *tracoView;
    UIImageView *tracoViewH;
    float diferencaTracoBarra;
    float acrecentaTracoNotaInvisivel;
    float diferencaTracoBarra2;
    float acrecentaTracoNotaInvisivel2;
    
    int j=0;
    
    for(int i=0;i<[[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura] count]-1;i++){
        
        Nota *nota = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:i];
        
        if([nota.concatenaNota isEqualToString: @"begin"]){
            
           Nota *notaAux = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:i];
            
            while(![notaAux.concatenaNota isEqualToString: @"end"]){
                nota = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:i];
                notaAux = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:i+1];
                
                UIImageView *posLinha1 = nota.imagemNota;
                UIImage *traco = [UIImage imageNamed:@"4-2Pausa"];
                
                tracoView = [[self listaTracoNotas]objectAtIndex:j];
                
                diferencaTracoBarra = posLinha1.frame.origin.y-tracoView.frame.origin.y;
                acrecentaTracoNotaInvisivel = posLinha1.frame.size.height-30;

                diferencaTracoBarra2 = posLinha1.frame.origin.y-tracoView.frame.origin.y;
                acrecentaTracoNotaInvisivel2 = posLinha1.frame.size.height-30;
                
                if([notaAux.posicaoRadiano isEqualToString:@"up"]){
                    tracoViewH = [[UIImageView alloc] initWithImage:traco];
                    float aux = diferencaTracoBarra+acrecentaTracoNotaInvisivel;
                    if(aux <0) aux = aux * -1;
                    [tracoViewH setFrame:CGRectMake(posLinha1.frame.origin.x+25,
                                                    tracoView.frame.origin.y,
                                                    3.0,
                                                    aux)];
                }else{
                    tracoViewH = [[UIImageView alloc] initWithImage:traco];
                    diferencaTracoBarra = (posLinha1.frame.origin.y+posLinha1.frame.size.height)-tracoView.frame.origin.y;
                    if(diferencaTracoBarra<0)diferencaTracoBarra = diferencaTracoBarra * -1;
                    acrecentaTracoNotaInvisivel = posLinha1.frame.size.height-30;
                    float aux = diferencaTracoBarra+acrecentaTracoNotaInvisivel;
                    if(aux <0) aux = aux * -1;
                    [tracoViewH setFrame:CGRectMake(posLinha1.frame.origin.x+2,
                                                    tracoView.frame.origin.y-(aux),
                                                    3.0,
                                                    aux)];
                }
                
                if(tracoViewH.frame.size.height > 5.0f){
                    [self.listaTracoNotas addObject:tracoViewH];
                }
                
                i=i+1;

                notaAux = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:i];
                posLinha1 = notaAux.imagemNota;
                
                if([notaAux.concatenaNota isEqualToString: @"end"]){
                    
                    
                    if([notaAux.posicaoRadiano isEqualToString:@"up"]){
                        tracoViewH = [[UIImageView alloc] initWithImage:traco];
                        float aux = diferencaTracoBarra2+acrecentaTracoNotaInvisivel2;
                        if(aux <0) aux = aux * -1;
                        [tracoViewH setFrame:CGRectMake(posLinha1.frame.origin.x+25,
                                                        tracoView.frame.origin.y,
                                                        3.0,
                                                        aux)];
                    }else{
                        tracoViewH = [[UIImageView alloc] initWithImage:traco];
                        diferencaTracoBarra2 = (posLinha1.frame.origin.y+posLinha1.frame.size.height)-tracoView.frame.origin.y;
                        if(diferencaTracoBarra2<0)diferencaTracoBarra2 = diferencaTracoBarra2 * -1;
                        acrecentaTracoNotaInvisivel2 = posLinha1.frame.size.height-30;
                        float aux = diferencaTracoBarra2+acrecentaTracoNotaInvisivel2;
                        if(aux <0) aux = aux * -1;
                        [tracoViewH setFrame:CGRectMake(posLinha1.frame.origin.x+2,
                                                        tracoView.frame.origin.y-(aux),
                                                        3.0,
                                                        aux)];
                    }
                    if(tracoViewH.frame.size.height > 5.0f){
                        [self.listaTracoNotas addObject:tracoViewH];
                    }
                }

            }
            
            j++;
        }
    }

}

-(void)desenhaTracoEntreNotas {
    self.listaTracoNotas = [[NSMutableArray alloc]init];
    UIImageView *tracoView;
    Nota *notaRisco;
    UIImageView *posLinha2;
    UIImageView *posLinhaPegaMaiorNota = [[UIImageView alloc]init];
    int tamanhoTraco = 0 ;
    UIImageView *posLinhaComeco = [[UIImageView alloc]init];
    Nota *notaMaior;
    Nota *notaAux2;
    
    for(int i=0;i<[[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura] count]-1;i++){
        
        Nota *nota = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:i];
       
        
        if([nota.concatenaNota isEqualToString: @"begin"]){
            
            Nota *notaAux = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:i];
            notaRisco = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:i+1];
            notaMaior = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:i];
        
            
            int indicePrimeiro = i;

            for(int j=indicePrimeiro;j<[[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]count]-1;j++){
            
                notaAux2 = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:j+1];
                notaMaior = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:j];
                notaRisco = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:j];
                
                if(![notaAux2.concatenaNota isEqualToString: @"end"]){
                  
                    if(notaMaior.imagemNota.frame.origin.x  < notaAux2.imagemNota.frame.origin.x){
                        notaMaior = notaMaior;
                        posLinhaPegaMaiorNota = notaMaior.imagemNota;
                    }else{
                        notaMaior = notaAux2;
                        posLinhaPegaMaiorNota = notaAux2.imagemNota;
                    }
                    
                }else{
                    posLinha2 =  notaAux2.imagemNota;
                    posLinhaComeco = notaAux.imagemNota;
                    
                    if([notaMaior.posicaoRadiano isEqualToString:@"up"]){
                        
                        float valorDistanciaBarra = notaMaior.imagemNota.frame.origin.y-20;
                        tamanhoTraco = (notaAux.imagemNota.frame.origin.x-posLinhaPegaMaiorNota.frame.origin.x)-5;
                        UIImage *traco = [UIImage imageNamed:@"4-2Pausa"];
                        
                        tracoView = [[UIImageView alloc] initWithImage:traco];
                        
                        [tracoView setFrame:CGRectMake(posLinhaPegaMaiorNota.frame.origin.x-3+posLinha2.frame.size.width+tamanhoTraco,
                                                       valorDistanciaBarra,
                                                       (posLinha2.frame.origin.x-posLinhaComeco.frame.origin.x+10),
                                                       10)];
                        
                    }else{
                        
                        float valorDistanciaBarra = notaMaior.imagemNota.frame.origin.y+notaMaior.imagemNota.frame.size.height+20;
                        tamanhoTraco = (notaAux.imagemNota.frame.origin.x-posLinhaPegaMaiorNota.frame.origin.x)-5;
                        UIImage *traco = [UIImage imageNamed:@"4-2Pausa"];
                        
                        tracoView = [[UIImageView alloc] initWithImage:traco];
                        [tracoView setFrame:CGRectMake(posLinhaPegaMaiorNota.frame.origin.x+3+tamanhoTraco,
                                                       valorDistanciaBarra,
                                                        (posLinha2.frame.origin.x-posLinhaComeco.frame.origin.x+10),
                                                       10)];
                    }
                    
                    [self.listaTracoNotas addObject:tracoView];
                    
                    
                    j=[[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]count]-1;
                    break;
                }
                
            }
        }
        
    }

    [self desenhaLinhaNotaAteTraco];

}



-(UIImageView*)retornaImagemDaNota:(NSString*)nomeNota :(NSString*)rotacaoNota :(NSString*)oitava :(NSString*)siglaNota :(Nota*)notaParametro{
    
    NSString *tipoNota;
    tamanhoHorizontal = 30;
    tamanhoVertical = 80;
    BOOL tracoMeio = false;
    BOOL tracoEntre = false;
    
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
  
    
    if([oitava isEqualToString:@"3"]){
        SWITCH (siglaNota) {
            
            CASE (@"C") {
                posNotaReal = 290;
                tracoEntre = true;
                break;
            }
            CASE (@"D") {
                posNotaReal = 280;
                tracoMeio = true;
                break;
            }
            CASE (@"E") {
                posNotaReal = 270;
                tracoEntre = true;
                break;
            }
            CASE (@"F") {
                posNotaReal = 260;
                tracoMeio = true;
                break;
            }
            CASE (@"G") {
                posNotaReal = 250;
                tracoEntre = true;
                break;
            }
            CASE (@"A") {
                posNotaReal = 240;
                tracoMeio = true;
                break;
            }
            CASE (@"B") {
                posNotaReal = 230;//48.0
                tracoEntre = true;
                break;
            }
            DEFAULT{
                posNotaReal = 0;
                break;
            }
        }
    }
    
    if([oitava isEqualToString:@"4"]){
        SWITCH (siglaNota) {
            
            CASE (@"C") {
                posNotaReal = 220;
                tracoMeio = true;
                break;
            }
            CASE (@"D") {
                posNotaReal = 210;
                tracoEntre = true;
                break;
            }
            CASE (@"E") {
                posNotaReal = 200;
                break;
            }
            CASE (@"F") {
                posNotaReal = 190;
                break;
            }
            CASE (@"G") {
                posNotaReal = 180;
                break;
            }
            CASE (@"A") {
                posNotaReal = 170;
                break;
            }
            CASE (@"B") {
                posNotaReal = 160;//48.0
                break;
            }
            DEFAULT{
                posNotaReal = 0;
                break;
            }
        }
    }

    if([oitava isEqualToString:@"5"]){
        SWITCH (siglaNota) {
            
            CASE (@"C") {
                posNotaReal = 150;
                break;
            }
            CASE (@"D") {
                posNotaReal = 140;
                break;
            }
            CASE (@"E") {
                posNotaReal = 130;
                break;
            }
            CASE (@"F") {
                posNotaReal = 120;
                break;
            }
            CASE (@"G") {
                posNotaReal = 110;
                tracoEntre = true;
                break;
            }
            CASE (@"A") {
                posNotaReal = 100;
                tracoMeio = true;
                break;
            }
            CASE (@"B") {
                posNotaReal = 90;
                tracoEntre = true;
                break;
            }
            DEFAULT{
                posNotaReal = 0;
                break;
            }
        }
    }
    
    if([oitava isEqualToString:@"6"]){
        SWITCH (siglaNota) {
            
            CASE (@"C") {
                posNotaReal = 80;
                tracoMeio = true;
                break;
            }
            CASE (@"D") {
                posNotaReal = 70;
                tracoEntre = true;
                break;
            }
            CASE (@"E") {
                posNotaReal = 60;
                tracoMeio = true;
                break;
            }
            CASE (@"F") {
                posNotaReal = 50;
                tracoEntre = true;
                break;
            }
            CASE (@"G") {
                posNotaReal = 40;
                tracoMeio = true;
                break;
            }
            CASE (@"A") {
                posNotaReal = 30;
                tracoEntre = true;
                break;
            }
            CASE (@"B") {
                posNotaReal = 20;
                tracoMeio = true;
                break;
            }
            DEFAULT{
                posNotaReal = 0;
                break;
            }
        }
    }
    
    
    
    UIImageView *nota;
    UIImage *image;
    if([notaParametro.concatenaNota isEqualToString:@""]) image = [UIImage imageNamed:tipoNota];
    else image =  [UIImage imageNamed:@"seminimaCortada"];
    CGImageRef imageRef = [image CGImage];
    UIImage *rotatedImage;
    
    if([rotacaoNota isEqualToString:@"down"]){
        rotatedImage = [UIImage imageWithCGImage:imageRef scale:1.0 orientation:UIImageOrientationDown];
        nota = [[UIImageView alloc] initWithImage:rotatedImage];
        
        float auxRisco = posNotaReal;
        posNotaReal = posNotaReal + nota.frame.size.height +20;
        
        if(tracoMeio){
            // traco no meio
            image = [UIImage imageNamed:@"4-2Pausa"];//120//10
            int contador =10;
            for(int i=0;i<(120 - auxRisco)/20;i++){
                UIImageView *traco = [[UIImageView alloc] initWithImage:image];
                [traco setFrame:CGRectMake(-5,contador,40.0,2.0)];
                [nota addSubview:traco];
                contador += 20;
            }
        }
        
        if(tracoEntre){
            UIImageView *traco;
            image = [UIImage imageNamed:@"4-2Pausa"];
            traco = [[UIImageView alloc] initWithImage:image];
            [traco setFrame:CGRectMake(-5,0,40.0,2.0)];
            [nota addSubview:traco];
            
            int contador =0;
            for(int i=0;i<(120 - auxRisco)/20;i++){
                UIImageView *traco = [[UIImageView alloc] initWithImage:image];
                [traco setFrame:CGRectMake(-5,contador,40.0,2.0)];
                [nota addSubview:traco];
                contador += 20;
            }
        }
        
    }else{
        
        rotatedImage = [UIImage imageWithCGImage:imageRef scale:1.0 orientation:UIImageOrientationUp];
        nota = [[UIImageView alloc] initWithImage:rotatedImage];
        
        if(tracoMeio){
            image = [UIImage imageNamed:@"4-2Pausa"];//120//10
            int contador = 68;
            for(int i=0;i<(posNotaReal-200)/20;i++){
                UIImageView *traco = [[UIImageView alloc] initWithImage:image];
                [traco setFrame:CGRectMake(-5,contador,40.0,2.0)];
                [nota addSubview:traco];
                contador -= 20;
            }
        }
        
        if(tracoEntre){
            UIImageView *traco;
            image = [UIImage imageNamed:@"4-2Pausa"];
            traco = [[UIImageView alloc] initWithImage:image];
            [traco setFrame:CGRectMake(-5,58,40.0,2.0)];
            [nota addSubview:traco];
            
            int contador = 58;
            for(int i=0;i<(posNotaReal-200)/20;i++){
                UIImageView *traco = [[UIImageView alloc] initWithImage:image];
                [traco setFrame:CGRectMake(-5,contador,40.0,2.0)];
                [nota addSubview:traco];
                contador -= 20;
            }
        }
        
    }
    
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

-(float)retornaPosNotaPausaPentagrama:(NSString*)tipoNota{
    
    SWITCH (tipoNota) {
        
        CASE (@"whole") {
            posNotaReal = 210;
            break;
        }
        CASE (@"half") {
            posNotaReal = 220;
            break;
        }
        CASE (@"quarter") {
            posNotaReal = 215;
            break;
        }
        CASE (@"eighth") {
            posNotaReal = 215;
            break;
        }
        CASE (@"16th") {
            posNotaReal = 215;
            break;
        }
        CASE (@"32th") {
            posNotaReal = 215;
            break;
        }
        CASE (@"64th") {
            posNotaReal = 215;
            break;
        }
        DEFAULT{
            posNotaReal = 215;
            break;
        }
    }
    
    
    return  posNotaReal;
    
}


-(void)metodosDesenhaPartitura{
    
    [self desenhaPartitura];
    
}


@end
