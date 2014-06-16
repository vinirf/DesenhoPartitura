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
    
    float posVerticalColuna = 0.0f;
    float espacamentoColunaPentagrama = 260.0f;
    float espacamentroColunaentrePentagrama = 100.0f;
    
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
    UIImageView *clave;
    
    if([tipoClave isEqualToString:@"G"]){
        UIImage *image = [UIImage imageNamed:@"claveSol.png"];
        clave = [[UIImageView alloc] initWithImage:image];
        UIImageView *posLinha = [ self.listaImagensTracoPentagrama objectAtIndex:linhaClave];
        [clave setFrame:CGRectMake(posLinha.frame.origin.x, posLinha.frame.origin.y-50,50,120)];
    }
    
    if([tipoClave isEqualToString:@"F"]){
        UIImage *image = [UIImage imageNamed:@"claveFa.png"];
        clave = [[UIImageView alloc] initWithImage:image];
        UIImageView *posLinha = [ self.listaImagensTracoPentagrama objectAtIndex:linhaClave];
        [clave setFrame:CGRectMake(posLinha.frame.origin.x, posLinha.frame.origin.y-80,55,65)];
    }

    self.tipoClave = clave;
   
    
    int quantidadeArmadura = [[[[[Sinfonia sharedManager] listaPartiturasSinfonia] objectAtIndex:0]armaduraClave]intValue];
    UIImage *imgArmadura;
    int nomeArmadura = 0;
    
    if(quantidadeArmadura > 0) {imgArmadura = [UIImage imageNamed:@"sharp.png"];nomeArmadura =0;}
    if(quantidadeArmadura < 0) {imgArmadura = [UIImage imageNamed:@"bemol.png"]; quantidadeArmadura = quantidadeArmadura * -1;nomeArmadura=1;}
    
    UIImageView *imagemarmadura;
    UIImageView *posLinhaArmadura = [ self.listaImagensTracoPentagrama objectAtIndex:0];
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
    UIImageView *posLinhaBeats = [ self.listaImagensTracoPentagrama objectAtIndex:0];
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
                
                NSString *oitavo = [[[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura] objectAtIndex:i] oitava];
                
                float posEscalaNota;
                
                UIImageView *posLinha = [self.listaImagensColunaPentagrama objectAtIndex:j+1];
                
                if([escalaNota isEqualToString:@""]){
                    nodasPartituraAdd = [self retornaImagemDaNotaPausa:tipoNota];
                    posEscalaNota = [self retornaPosNotaPausaPentagrama:tipoNota];
                }else{
                    nodasPartituraAdd = [self retornaImagemDaNota:tipoNota:rotacaoNota:oitavo:escalaNota];
                    posEscalaNota = pos;
                }
                
                
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
                    [acidenteNota setFrame:CGRectMake(nodasPartituraAdd.frame.origin.x+5, nodasPartituraAdd.frame.origin.y+30,15,20)];
                }
                else if([escudo isEqualToString:@"1"]){
                    UIImage *image = [UIImage imageNamed:@"sharp"];
                    acidenteNota = [[UIImageView alloc] initWithImage:image];
                    [acidenteNota setFrame:CGRectMake(nodasPartituraAdd.frame.origin.x+5, nodasPartituraAdd.frame.origin.y+30,15,20)];
                }
                else if([escudo isEqualToString:@"0"]){
                    UIImage *image = [UIImage imageNamed:@"natural"];
                    acidenteNota = [[UIImageView alloc] initWithImage:image];
                    [acidenteNota setFrame:CGRectMake(nodasPartituraAdd.frame.origin.x+5, nodasPartituraAdd.frame.origin.y+30,15,24)];
                }else{
                    UIImage *image = [UIImage imageNamed:@"natural"];
                    acidenteNota = [[UIImageView alloc] initWithImage:image];
                    [acidenteNota setFrame:CGRectMake(0,0,0,0)];
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

-(void)inclinaTraco{
    //                CGFloat largura;
    //                CGFloat altura;
    //
    //                if(posLinha2.frame.origin.x > posLinha1.frame.origin.x){
    //                    largura = posLinha2.frame.origin.x - posLinha1.frame.origin.x;
    //                }else{
    //                    largura = posLinha1.frame.origin.x - posLinha2.frame.origin.x;
    //                }
    //
    //                if(posLinha2.frame.origin.y > posLinha1.frame.origin.y){
    //                    altura =  posLinha2.frame.origin.y - posLinha1.frame.origin.y;
    //                }else{
    //                    altura =  posLinha1.frame.origin.y - posLinha2.frame.origin.y;
    //                }
    //
    //
    //                CGFloat tangente = (altura / largura);
    //
    //                tracoView.transform = CGAffineTransformMakeRotation(-fabs(tangente));
}

-(void)desenhaLinhaNotaAteTraco{
   
    UIImageView *tracoView;
    UIImageView *tracoViewH;
    Nota *notaRisco;
    int j=0;
    
    for(int i=0;i<[[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura] count]-1;i++){
        
        Nota *nota = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:i];
        
        if([nota.concatenaNota isEqualToString: @"begin"]){
            
           Nota *notaAux = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:i];
            
            while(![notaAux.concatenaNota isEqualToString: @"end"]){
                nota = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:i];
                notaAux = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:i+1];
                
                UIImageView *posLinha2 =  notaAux.imagemNota;
                UIImageView *posLinha1 = nota.imagemNota;
                
                UIImage *traco = [UIImage imageNamed:@"4-2Pausa"];
                
                tracoView = [[self listaTracoNotas]objectAtIndex:j];
                
                float diferencaTracoBarra = posLinha1.frame.origin.y-tracoView.frame.origin.y;
                float acrecentaTracoNotaInvisivel = posLinha1.frame.size.height-30;
                float tiraPedacoSobrando = posLinha1.frame.size.height;

                if(diferencaTracoBarra <0){
                    diferencaTracoBarra = 0;
                }
                
                tracoViewH = [[UIImageView alloc] initWithImage:traco];
                [tracoViewH setFrame:CGRectMake(posLinha1.frame.origin.x+25,tracoView.frame.origin.y,3.0,diferencaTracoBarra+acrecentaTracoNotaInvisivel)];
                [self.listaTracoNotas addObject:tracoViewH];
                
                
                i=i+1;
            }
            j++;
        }
    }

}

-(void)desenhaTracoEntreNotas {
    self.listaTracoNotas = [[NSMutableArray alloc]init];
    UIImageView *tracoView;
    UIImageView *tracoViewH;
    Nota *notaRisco;
    UIImageView *posLinha2;
    UIImageView *posLinhaPegaMaiorNota;
    int tamanhoTraco = 0 ;
    UIImageView *posLinhaComeco;
    
    for(int i=0;i<[[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura] count]-1;i++){
        
        Nota *nota = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:i];
        
        if([nota.concatenaNota isEqualToString: @"begin"]){
            
            Nota *notaAux = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:i];
            notaRisco = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:i];
           
            
            while(![notaAux.concatenaNota isEqualToString: @"end"]){
                nota = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:i];
                notaAux = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:i+1];
        
                UIImage *notaNova = [UIImage imageNamed:@"seminimaCortada"];
                UIImage *notaInteira = [UIImage imageNamed:@"seminima"];
                
                if(nota.imagemNota.frame.origin.x < notaAux.imagemNota.frame.origin.x){
                    posLinhaPegaMaiorNota =  nota.imagemNota;
                }else{
                    posLinhaPegaMaiorNota = notaAux.imagemNota;
                }
                
                posLinha2 =  notaAux.imagemNota;

                
                UIImageView *posLinha1 = nota.imagemNota;
                posLinhaComeco = notaRisco.imagemNota;

                
                posLinha1.image = notaNova;
                posLinha2.image = notaNova;
 
                tamanhoTraco = (posLinhaComeco.frame.origin.x-posLinhaPegaMaiorNota.frame.origin.x)-5;
                UIImage *traco = [UIImage imageNamed:@"4-2Pausa"];
                tracoView = [[UIImageView alloc] initWithImage:traco];
                
                
               
                
                i=i+1;
            }
            
            [tracoView setFrame:CGRectMake(posLinhaPegaMaiorNota.frame.origin.x-3+posLinha2.frame.size.width+tamanhoTraco,
                                           posLinhaPegaMaiorNota.frame.origin.y,
                                           (posLinha2.frame.origin.x-posLinhaComeco.frame.origin.x+10),
                                           10)];
            [self.listaTracoNotas addObject:tracoView];
        }
    }
    
    [self desenhaLinhaNotaAteTraco];

}

//UIImage *notaNova = [UIImage imageNamed:@"seminimaCortada"];
//CGImageRef imageRef = [notaNova CGImage];
//UIImage *rotatedImage;
//if([nota.posicaoRadiano isEqualToString:@"down"]){
//    rotatedImage = [UIImage imageWithCGImage:imageRef scale:1.0 orientation:UIImageOrientationDown];
//}else{
//    rotatedImage = [UIImage imageWithCGImage:imageRef scale:1.0 orientation:UIImageOrientationUp];
//}
//
//posLinha1.image = rotatedImage;
//posLinha2.image = rotatedImage;

-(UIImageView*)retornaImagemDaNota:(NSString*)nomeNota :(NSString*)rotacaoNota :(NSString*)oitava :(NSString*)siglaNota{
    
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
                pos = 2.0;
                break;
            }
            CASE (@"D") {
                pos = -8;
                break;
            }
            CASE (@"E") {
                pos = 40;
                break;
            }
            CASE (@"F") {
                pos = 30;
                break;
            }
            CASE (@"G") {
                pos = 20;
                break;
            }
            CASE (@"A") {
                pos = 10;
                break;
            }
            CASE (@"B") {
                pos = 0;
                tracoEntre = true;
                break;
            }
            DEFAULT{
                pos = 0;
                break;
            }
        }
    }

    if([oitava isEqualToString:@"4"]){
        SWITCH (siglaNota) {
            
            CASE (@"C") {
                pos = 50.0;
                tracoMeio = true;
                break;
            }
            CASE (@"D") {
                pos = 40.0;
                tracoEntre = true;
                break;
            }
            CASE (@"E") {
                pos = 32.0;
                break;
            }
            CASE (@"F") {
                pos = 22.0;
                break;
            }
            CASE (@"G") {
                pos = 12.0;
                break;
            }
            CASE (@"A") {
                pos = 2.0;
                break;
            }
            CASE (@"B") {
                pos = 48.0;
                break;
            }
            DEFAULT{
                pos = 0;
                break;
            }
        }
    }

    if([oitava isEqualToString:@"5"]){
        SWITCH (siglaNota) {
            
            CASE (@"C") {
                pos = 40;
                break;
            }
            CASE (@"D") {
                pos = 30;
                break;
            }
            CASE (@"E") {
                pos = 20;
                break;
            }
            CASE (@"F") {
                pos = 10;
                break;
            }
            CASE (@"G") {
                pos = 0.0;
                tracoEntre = true;
                break;
            }
            CASE (@"A") {
                pos = -8.0;
                tracoMeio = true;
                break;
            }
            CASE (@"B") {
                pos = -16.0;
                tracoEntre = true;
                break;
            }
            DEFAULT{
                pos = 0;
                break;
            }
        }
    }
    
    if([oitava isEqualToString:@"6"]){
        SWITCH (siglaNota) {
            
            CASE (@"C") {
                pos = -24;
                tracoMeio = true;
                break;
            }
            CASE (@"D") {
                pos = -32;
                tracoEntre = true;
                break;
            }
            CASE (@"E") {
                pos = -40;
                tracoMeio = true;
                break;
            }
            CASE (@"F") {
                pos = -48;
                tracoEntre = true;
                break;
            }
            CASE (@"G") {
                pos = -56;
                tracoMeio = true;
                break;
            }
            CASE (@"A") {
                pos = -64;
                tracoEntre = true;
                break;
            }
            CASE (@"B") {
                pos = -72;
                tracoMeio = true;
                break;
            }
            DEFAULT{
                pos = 0;
                break;
            }
        }
    }
    
    
    UIImageView *nota;
    UIImage *image = [UIImage imageNamed:tipoNota];
    CGImageRef imageRef = [image CGImage];
    UIImage *rotatedImage;
    
    if([rotacaoNota isEqualToString:@"down"]){
        rotatedImage = [UIImage imageWithCGImage:imageRef scale:1.0 orientation:UIImageOrientationDown];
        nota = [[UIImageView alloc] initWithImage:rotatedImage];
        
        if(tracoMeio){
            // traco no meio
            image = [UIImage imageNamed:@"4-2Pausa"];
            UIImageView *traco = [[UIImageView alloc] initWithImage:image];
            [traco setFrame:CGRectMake(-5,10,40.0,2.0)];
            [nota addSubview:traco];
        }
        
        if(tracoEntre){
            UIImageView *traco;
            image = [UIImage imageNamed:@"4-2Pausa"];
            traco = [[UIImageView alloc] initWithImage:image];
            [traco setFrame:CGRectMake(-5,0,40.0,2.0)];
            [nota addSubview:traco];
            image = [UIImage imageNamed:@"4-2Pausa"];
            traco = [[UIImageView alloc] initWithImage:image];
            [traco setFrame:CGRectMake(-5,20,40.0,2.0)];
            [nota addSubview:traco];
        }
        
    }else{
        rotatedImage = [UIImage imageWithCGImage:imageRef scale:1.0 orientation:UIImageOrientationUp];
        nota = [[UIImageView alloc] initWithImage:rotatedImage];
        
        if(tracoMeio){
            // traco no meio
            image = [UIImage imageNamed:@"4-2Pausa"];
            UIImageView *traco = [[UIImageView alloc] initWithImage:image];
            [traco setFrame:CGRectMake(-5,68,40.0,2.0)];
            [nota addSubview:traco];
        }
        
        if(tracoEntre){
            UIImageView *traco;
            image = [UIImage imageNamed:@"4-2Pausa"];
            traco = [[UIImageView alloc] initWithImage:image];
            [traco setFrame:CGRectMake(-5,60,40.0,2.0)];
            [nota addSubview:traco];
            image = [UIImage imageNamed:@"4-2Pausa"];
            traco = [[UIImageView alloc] initWithImage:image];
            [traco setFrame:CGRectMake(-5,78,40.0,2.0)];
            [nota addSubview:traco];
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
