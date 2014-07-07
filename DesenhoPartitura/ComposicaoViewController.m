//
//  ComposicaoViewController.m
//  DesenhoPartitura
//
//  Created by VINICIUS RESENDE FIALHO on 24/06/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import "ComposicaoViewController.h"

@interface ComposicaoViewController ()

@end

#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);


@implementation ComposicaoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

-(Nota*)retornaNotaCriadaPeloUsuario:(float)j :(UIImageView*)t :(UIImageView*)t2 :(UIImageView*)ultimoTraco{
    
    Nota *aux;
    
    ///////////////// 7C ////////////////
    if(j==-0.5){
        aux = [[Nota alloc]init];
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
        [[aux imagemNota]setFrame:CGRectMake(posicaoX,(t.frame.origin.y-aux.imagemNota.frame.size.height-13)-15,80,130)];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"C";
        aux.oitava = @"7";
        aux.duracao = @"0";
        aux.tipoNota = nota.tipoNota;
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = posicaoX;
        posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux];
        return aux;

    }
    ///////////////// 6B ////////////////
    else if(j==0){
        aux = [[Nota alloc]init];
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
        [[aux imagemNota]setFrame:CGRectMake(posicaoX,t.frame.origin.y-aux.imagemNota.frame.size.height-13,80,130)];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"B";
        aux.oitava = @"6";
        aux.duracao = @"0";
        aux.tipoNota = nota.tipoNota;
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = posicaoX;
        posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux];
        return aux;


    }
    ///////////////// 6A ////////////////
    else if(j==0.5){
        aux = [[Nota alloc]init];
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
        float pos = (((t2.frame.origin.y-t.frame.origin.y)/2)+t.frame.origin.y);
        [[aux imagemNota]setFrame:CGRectMake(posicaoX,(pos)-aux.imagemNota.frame.size.height-13,80,130)];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"A";
        aux.oitava = @"6";
        aux.duracao = @"0";
        aux.tipoNota = nota.tipoNota;
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = posicaoX;
        posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux];
        return aux;

        
    }
    ///////////////// 6G ////////////////
    else if(j==1){
        aux = [[Nota alloc]init];
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
        [[aux imagemNota]setFrame:CGRectMake(posicaoX,t.frame.origin.y-aux.imagemNota.frame.size.height-13,80,130)];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"G";
        aux.oitava = @"6";
        aux.duracao = @"0";
        aux.tipoNota = nota.tipoNota;
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = posicaoX;
        posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux];
        return aux;

        
    }
    ///////////////// 6F ////////////////
    else if(j==1.5){
        aux = [[Nota alloc]init];
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
        float pos = (((t2.frame.origin.y-t.frame.origin.y)/2)+t.frame.origin.y);
        [[aux imagemNota]setFrame:CGRectMake(posicaoX,(pos)-aux.imagemNota.frame.size.height-13,80,130)];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"F";
        aux.oitava = @"6";
        aux.duracao = @"0";
        aux.tipoNota = nota.tipoNota;
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = posicaoX;
        posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux];
        return aux;

        
    }
    ///////////////// 6E ////////////////
    else if(j==2){
        aux = [[Nota alloc]init];
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
        [[aux imagemNota]setFrame:CGRectMake(posicaoX,t.frame.origin.y-aux.imagemNota.frame.size.height-13,80,130)];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"E";
        aux.oitava = @"6";
        aux.duracao = @"0";
        aux.tipoNota = nota.tipoNota;
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = posicaoX;
        posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux];
        return aux;

        
    }
    ///////////////// 6D ////////////////
    else if(j==2.5){
        aux = [[Nota alloc]init];
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
        float pos = (((t2.frame.origin.y-t.frame.origin.y)/2)+t.frame.origin.y);
        [[aux imagemNota]setFrame:CGRectMake(posicaoX,(pos)-aux.imagemNota.frame.size.height-13,80,130)];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"D";
        aux.oitava = @"6";
        aux.duracao = @"0";
        aux.tipoNota = nota.tipoNota;
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = posicaoX;
        posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux];
        return aux;

        
    }
    ///////////////// 6C ////////////////
    else if(j==3){
        aux = [[Nota alloc]init];
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
        [[aux imagemNota]setFrame:CGRectMake(posicaoX,t.frame.origin.y-aux.imagemNota.frame.size.height-13,80,130)];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"C";
        aux.oitava = @"6";
        aux.duracao = @"0";
        aux.tipoNota = nota.tipoNota;
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = posicaoX;
        posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux];
        return aux;

        
    }
    ///////////////// 5B ////////////////
    else if(j==3.5){
        aux = [[Nota alloc]init];
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
        float pos = (((t2.frame.origin.y-t.frame.origin.y)/2)+t.frame.origin.y);
        [[aux imagemNota]setFrame:CGRectMake(posicaoX,(pos)-aux.imagemNota.frame.size.height-13,80,130)];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"B";
        aux.oitava = @"5";
        aux.duracao = @"0";
        aux.tipoNota = nota.tipoNota;
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = posicaoX;
        posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux];
        return aux;

        
    }
    ///////////////// 5A ////////////////
    else if(j==4){
        aux = [[Nota alloc]init];
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
        [[aux imagemNota]setFrame:CGRectMake(posicaoX,t.frame.origin.y-aux.imagemNota.frame.size.height-13,80,130)];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"A";
        aux.oitava = @"5";
        aux.duracao = @"0";
        aux.tipoNota = nota.tipoNota;
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = posicaoX;
        posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux];
        return aux;

        
    }
    ///////////////// 5G ////////////////
    else if(j==4.5){
        aux = [[Nota alloc]init];
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
        float pos = (((t2.frame.origin.y-t.frame.origin.y)/2)+t.frame.origin.y);
        [[aux imagemNota]setFrame:CGRectMake(posicaoX,(pos)-aux.imagemNota.frame.size.height-13,80,130)];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"G";
        aux.oitava = @"5";
        aux.duracao = @"0";
        aux.tipoNota = nota.tipoNota;
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = posicaoX;
        posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux];
        return aux;

        
    }
    ///////////////// 5F ////////////////
    else if(j==5){
        aux = [[Nota alloc]init];
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
        [[aux imagemNota]setFrame:CGRectMake(posicaoX,t.frame.origin.y-aux.imagemNota.frame.size.height-13,80,130)];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"F";
        aux.oitava = @"5";
        aux.duracao = @"0";
        aux.tipoNota = nota.tipoNota;
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = posicaoX;
        posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux];
        return aux;

        
    }
    //////////////// 5E ////////////////
    else if(j==5.5){
        aux = [[Nota alloc]init];
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
        float pos = (((t2.frame.origin.y-t.frame.origin.y)/2)+t.frame.origin.y);
        [[aux imagemNota]setFrame:CGRectMake(posicaoX,(pos)-aux.imagemNota.frame.size.height-13,80,130)];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"E";
        aux.oitava = @"5";
        aux.duracao = @"0";
        aux.tipoNota = nota.tipoNota;
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = posicaoX;
        posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux];
        return aux;

        
    }
    //////////////// 5D ////////////////
    else if(j==6){
        aux = [[Nota alloc]init];
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
        [[aux imagemNota]setFrame:CGRectMake(posicaoX,t.frame.origin.y-aux.imagemNota.frame.size.height-13,80,130)];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"D";
        aux.oitava = @"5";
        aux.duracao = @"0";
        aux.tipoNota = nota.tipoNota;
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = posicaoX;
        posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux];
        return aux;

        
    }
    //////////////// 5C ////////////////
    else if(j==6.5){
        aux = [[Nota alloc]init];
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
        float pos = (((t2.frame.origin.y-t.frame.origin.y)/2)+t.frame.origin.y);
        [[aux imagemNota]setFrame:CGRectMake(posicaoX,(pos)-aux.imagemNota.frame.size.height-13,80,130)];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"C";
        aux.oitava = @"5";
        aux.duracao = @"0";
        aux.tipoNota = nota.tipoNota;
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = posicaoX;
        posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux];
        return aux;

        
    }
    //////////////// 4B ////////////////
    else if(j==7){
        aux = [[Nota alloc]init];
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
        [[aux imagemNota]setFrame:CGRectMake(posicaoX,t.frame.origin.y-aux.imagemNota.frame.size.height-13,80,130)];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"B";
        aux.oitava = @"4";
        aux.duracao = @"0";
        aux.tipoNota = nota.tipoNota;
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = posicaoX;
        posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux];
        return aux;

        
    }
    //////////////// 4A ////////////////
    else if(j==7.5){
        aux = [[Nota alloc]init];
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
        float pos = (((t2.frame.origin.y-t.frame.origin.y)/2)+t.frame.origin.y);
        [[aux imagemNota]setFrame:CGRectMake(posicaoX,(pos)-aux.imagemNota.frame.size.height-13,80,130)];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"A";
        aux.oitava = @"4";
        aux.duracao = @"0";
        aux.tipoNota = nota.tipoNota;
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = posicaoX;
        posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux];
        return aux;

        
    }
    //////////////// 4G ////////////////
    else if(j==8){
        aux = [[Nota alloc]init];
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
        [[aux imagemNota]setFrame:CGRectMake(posicaoX,t.frame.origin.y-aux.imagemNota.frame.size.height-13,80,130)];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"G";
        aux.oitava = @"4";
        aux.duracao = @"0";
        aux.tipoNota = nota.tipoNota;
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = posicaoX;
        posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux];
        return aux;

        
    }
    //////////////// 4F ////////////////
    else if(j==8.5){
        aux = [[Nota alloc]init];
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
        float pos = (((t2.frame.origin.y-t.frame.origin.y)/2)+t.frame.origin.y);
        [[aux imagemNota]setFrame:CGRectMake(posicaoX,(pos)-aux.imagemNota.frame.size.height-13,80,130)];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"F";
        aux.oitava = @"4";
        aux.duracao = @"0";
        aux.tipoNota = nota.tipoNota;
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = posicaoX;
        posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux];
        return aux;

        
    }
    //////////////// 4E ////////////////
    else if(j==9){
        aux = [[Nota alloc]init];
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
        [[aux imagemNota]setFrame:CGRectMake(posicaoX,t.frame.origin.y-aux.imagemNota.frame.size.height-13,80,130)];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"E";
        aux.oitava = @"4";
        aux.duracao = @"0";
        aux.tipoNota = nota.tipoNota;
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = posicaoX;
        posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux];
        return aux;

        
    }
    //////////////// 4D ////////////////
    else if(j==9.5){
        aux = [[Nota alloc]init];
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
        float pos = (((t2.frame.origin.y-t.frame.origin.y)/2)+t.frame.origin.y);
        [[aux imagemNota]setFrame:CGRectMake(posicaoX,(pos)-aux.imagemNota.frame.size.height-13,80,130)];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"D";
        aux.oitava = @"4";
        aux.duracao = @"0";
        aux.tipoNota = nota.tipoNota;
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = posicaoX;
        posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux];
        return aux;

        
    }
    //////////////// 4C ////////////////
    else if(j==10){
        aux = [[Nota alloc]init];
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
        [[aux imagemNota]setFrame:CGRectMake(posicaoX,(ultimoTraco.frame.origin.y-aux.imagemNota.frame.size.height-13),80,130)];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"C";
        aux.oitava = @"4";
        aux.duracao = @"0";
        aux.tipoNota = nota.tipoNota;
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = posicaoX;
        posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux];
        return aux;

        
    }
    //////////////// 3B ////////////////
    else if(j==10.5){
        aux = [[Nota alloc]init];
        aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
        [[aux imagemNota]setFrame:CGRectMake(posicaoX,(ultimoTraco.frame.origin.y-aux.imagemNota.frame.size.height-13)+15,80,130)];
        aux.imagemAcidente = NULL;
        aux.imagePontoNota = NULL;
        aux.nomeNota = @"B";
        aux.oitava = @"3";
        aux.duracao = @"0";
        aux.tipoNota = nota.tipoNota;
        aux.tom = @"";
        aux.pertencePartitura = @"";
        aux.numeroCompasso = @"0";
        aux.posicaoRadiano = @"";
        aux.concatenaNota = @"";
        aux.pontoNota = @"";
        aux.posNota = 0.0;
        aux.posicaoNotaEdicao = posicaoX;
        posicaoX += espacamentoEntreNotas;
        [self addGestureSegurarNotasTela:aux];
        return aux;
        
    }
    
    return NULL;
    
}

-(Nota*)retornaPosicaoNotaEdicao:(float)posx :(float)posy{
    
    Nota *aux;
   
    int precisaoTouchLinha = 5;
    UIImageView *linhaPausa = [[[DesenhaPartitura sharedManager]listaImagensTracoPentagrama]objectAtIndex:5];
    
    if([[nota nomeNota] rangeOfString:@"Pausa"].location != NSNotFound){
        
        if([[nota nomeNota] isEqualToString:@"semibrevePausa"]){
            aux = [[Nota alloc]init];
            aux.tipoNota = nota.tipoNota;
            aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
            [[aux imagemNota]setFrame:CGRectMake(posicaoX,linhaPausa.frame.origin.y+35,60,20)];
            aux.nomeNota = @"";
            aux.oitava = @"";
            aux.tom = @"";
            aux.posicaoNotaEdicao = posicaoX;
            posicaoX += espacamentoEntreNotas;
            [self addGestureSegurarNotasTela:aux];
            return aux;
            
        }else if([[nota nomeNota] isEqualToString:@"minimaPausa"]){
            aux = [[Nota alloc]init];
            aux.tipoNota = nota.tipoNota;
            aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
            [[aux imagemNota]setFrame:CGRectMake(posicaoX,linhaPausa.frame.origin.y+53,60,18)];
            aux.nomeNota = @"";
            aux.oitava = @"";
            aux.tom = @"";
            aux.posicaoNotaEdicao = posicaoX;
            posicaoX += espacamentoEntreNotas;
            [self addGestureSegurarNotasTela:aux];
            return aux;
            
        }else if([[nota nomeNota] isEqualToString:@"seminimaPausa"]){
            aux = [[Nota alloc]init];
            aux.tipoNota = nota.tipoNota;
            aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
            [[aux imagemNota]setFrame:CGRectMake(posicaoX,linhaPausa.frame.origin.y+30,60,80)];
            aux.nomeNota = @"";
            aux.oitava = @"";
            aux.tom = @"";
            aux.posicaoNotaEdicao = posicaoX;
            posicaoX += espacamentoEntreNotas;
            [self addGestureSegurarNotasTela:aux];
            return aux;
            
        }else if([[nota nomeNota] isEqualToString:@"colcheiaPausa"]){
            aux = [[Nota alloc]init];
            aux.tipoNota = nota.tipoNota;
            aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
            [[aux imagemNota]setFrame:CGRectMake(posicaoX,linhaPausa.frame.origin.y+30,60,80)];
            aux.nomeNota = @"";
            aux.oitava = @"";
            aux.tom = @"";
            aux.posicaoNotaEdicao = posicaoX;
            posicaoX += espacamentoEntreNotas;
            [self addGestureSegurarNotasTela:aux];
            return aux;
            
        }else if([[nota nomeNota] isEqualToString:@"semicolcheiaPausa"]){
            aux = [[Nota alloc]init];
            aux.tipoNota = nota.tipoNota;
            aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
            [[aux imagemNota]setFrame:CGRectMake(posicaoX,linhaPausa.frame.origin.y+30,60,80)];
            aux.nomeNota = @"";
            aux.oitava = @"";
            aux.tom = @"";
            aux.posicaoNotaEdicao = posicaoX;
            posicaoX += espacamentoEntreNotas;
            [self addGestureSegurarNotasTela:aux];
            return aux;
            
        }else if([[nota nomeNota] isEqualToString:@"fusaPausa"]){
            aux = [[Nota alloc]init];
            aux.tipoNota = nota.tipoNota;
            aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
            [[aux imagemNota]setFrame:CGRectMake(posicaoX,linhaPausa.frame.origin.y+30,60,80)];
            aux.nomeNota = @"";
            aux.oitava = @"";
            aux.tom = @"";
            aux.posicaoNotaEdicao = posicaoX;
            posicaoX += espacamentoEntreNotas;
            [self addGestureSegurarNotasTela:aux];
            return aux;
            
        }else if([[nota nomeNota] isEqualToString:@"semifusaPausa"]){
            aux = [[Nota alloc]init];
            aux.tipoNota = nota.tipoNota;
            aux.imagemNota = [[UIImageView alloc]initWithImage:[[nota imagemNota]image]];
            [[aux imagemNota]setFrame:CGRectMake(posicaoX,linhaPausa.frame.origin.y+30,60,80)];
            aux.nomeNota = @"";
            aux.oitava = @"";
            aux.tom = @"";
            aux.posicaoNotaEdicao = posicaoX;
            posicaoX += espacamentoEntreNotas;
            [self addGestureSegurarNotasTela:aux];
            return aux;
            
        }
        
        
        
    }else{
        for (int j=0;j<[DesenhaPartitura sharedManager].listaImagensTracoPentagrama.count-1;j++) {
            
            UIImageView *t = [[[DesenhaPartitura sharedManager]listaImagensTracoPentagrama]objectAtIndex:j];
            UIImageView *t2 = [[[DesenhaPartitura sharedManager]listaImagensTracoPentagrama]objectAtIndex:j+1];
            UIImageView *ultimoTraco = [[[DesenhaPartitura sharedManager]listaImagensTracoPentagrama]lastObject];
            
            if(posy <= t.frame.origin.y-precisaoTouchLinha){
                aux =  [self retornaNotaCriadaPeloUsuario:j-0.5:t:t2:ultimoTraco];
                return aux;
                
            }else if((posy <= t.frame.origin.y+precisaoTouchLinha)&&(posy >= t.frame.origin.y-precisaoTouchLinha)){
                aux =  [self retornaNotaCriadaPeloUsuario:j:t:t2:ultimoTraco];
                return aux;
                
            }else if((posy >= t.frame.origin.y+precisaoTouchLinha)&&(posy <= t2.frame.origin.y-precisaoTouchLinha)){
                aux =  [self retornaNotaCriadaPeloUsuario:j+0.5:t:t2:ultimoTraco];
                return aux;
                
            }else if((posy <= ultimoTraco.frame.origin.y+precisaoTouchLinha)&&(posy >= ultimoTraco.frame.origin.y-precisaoTouchLinha)){
                aux =  [self retornaNotaCriadaPeloUsuario:10:t:t2:ultimoTraco];
                return aux;
                
            }else if(posy > ultimoTraco.frame.origin.y+precisaoTouchLinha){
                aux =  [self retornaNotaCriadaPeloUsuario:10+0.5:t:t2:ultimoTraco];
                return aux;
            }
            
        }

    }
    return NULL;
}

-(void)aumentarLinhasPentagrama{
    for (UIImageView *t in [DesenhaPartitura sharedManager].listaImagensTracoPentagrama) {
         [t setFrame:CGRectMake(t.frame.origin.x, t.frame.origin.y, posicaoX + 500.0f, 2.0f)];
        
    }
}

-(void)addNotaNaTela:(id)sender{
    UITapGestureRecognizer *touch = (UITapGestureRecognizer*)sender;
    CGPoint touchPoint = [touch locationInView:self.scrollEdicao];
    
    float posx = touchPoint.x;
    float posy = touchPoint.y;
    Nota *not = [self retornaPosicaoNotaEdicao:posx:posy];
    
    if((not != NULL)&&(listaNotasEdicao.count <= limiteDeNotas)){
        [[self scrollEdicao]addSubview:[not imagemNota]];
        [listaNotasEdicao addObject:not];
        listaSons = [[NSMutableArray alloc]init];
        [listaSons addObject:not];
        [[Sinfonia sharedManager]tocarUmaNota:listaSons:@"Piano"];
        [[self scrollEdicao] setContentSize:CGSizeMake((self.scrollEdicao.bounds.size.width+posicaoX)-700, self.scrollEdicao.bounds.size.height)];
        
        if(listaNotasEdicao.count > 5){
            [self aumentarLinhasPentagrama];
            CGPoint bottomOffset = CGPointMake((posicaoX-650),0);
            [[self scrollEdicao] setContentOffset:bottomOffset animated:YES];
        }
    }else{
        NSLog(@"Passou do limite de notas");
    }

}



- (IBAction)tocarTodasNoras:(id)sender {
    if([listaNotasEdicao lastObject] != NULL)[[Sinfonia sharedManager]tocarTodasNotasEdicao:listaNotasEdicao:@"Piano"];
}

- (IBAction)limparNotasPartituraEdicao:(id)sender {

    if(listaNotasEdicao.count != 0){
        for (UIView *subView in self.scrollEdicao.subviews)
        {
            for(int i=0;i<listaNotasEdicao.count;i++){
                Nota *coord = [listaNotasEdicao  objectAtIndex:i];
                
                if ([subView isEqual:coord.imagemNota])
                {
                    [subView removeFromSuperview];
                }
                
            }
        }
        [[Sinfonia sharedManager]pararPlayerPartitura];
        listaNotasEdicao = [[NSMutableArray alloc]init];
        CGPoint bottomOffset = CGPointMake(0,0);
        [[self scrollEdicao] setContentOffset:bottomOffset animated:YES];
        posicaoX = 150;
    }
}


-(void)addGesturePrintarNotasTela{

    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addNotaNaTela:)];
    singleTap.numberOfTouchesRequired = 1;
    self.view.userInteractionEnabled = YES;
    [self.scrollEdicao addGestureRecognizer:singleTap];
    
    
}

-(void)rearranjaPosicoesNotas:(int)posicaoNotaDeletada{
    Nota *pegaPosicaoDaUltimaNota = [listaNotasEdicao lastObject];
    posicaoX = pegaPosicaoDaUltimaNota.posicaoNotaEdicao;
    NSMutableArray *aux = [[NSMutableArray alloc] init];
    
    for(Nota *auxs in listaNotasEdicao){
        Nota *t = [[Nota alloc]init];
        t.posicaoNotaEdicao = auxs.posicaoNotaEdicao;
        [aux addObject:t];
    }
    
    int k=0;
    
    for(int i=0;i<listaNotasEdicao.count;i++){
        Nota *notaPosicao = [listaNotasEdicao objectAtIndex:i];
        if(notaPosicao.posicaoNotaEdicao == posicaoNotaDeletada){
            for(int j=i;j<listaNotasEdicao.count-1;j++){
                k=j+1;
                Nota *notaPosicaoProx = [listaNotasEdicao objectAtIndex:k];
                Nota *notaPosicaoAtual = [aux objectAtIndex:j];
                notaPosicaoProx.posicaoNotaEdicao = notaPosicaoAtual.posicaoNotaEdicao;
                
                [UIView animateWithDuration:0.5
                                 animations:^(void){
                                     CGRect moveNotaParaBaixo = CGRectMake(notaPosicaoProx.posicaoNotaEdicao,
                                                                           notaPosicaoProx.imagemNota.frame.origin.y,
                                                                           notaPosicaoProx.imagemNota.frame.size.width,
                                                                           notaPosicaoProx.imagemNota.frame.size.height);
                                     notaPosicaoProx.imagemNota.frame = moveNotaParaBaixo;
                                 } completion:^(BOOL finished){
                                     
                                 }];
            }

            
            break;
        }
        
    }
    
}



-(void)deletarNota:(id)sender{
    
    NotaEdicaoGesture *touch = (NotaEdicaoGesture*)sender;
    notaParaEdicao = touch.notaEdicaoGesture;
    
    [UIView animateWithDuration:1.0
                     animations:^(void){
                         CGRect moveNotaParaBaixo = CGRectMake(notaParaEdicao.posicaoNotaEdicao,600,notaParaEdicao.imagemNota.frame.size.width,notaParaEdicao.imagemNota.frame.size.height);
                         notaParaEdicao.imagemNota.frame = moveNotaParaBaixo;
                     } completion:^(BOOL finished){
                         [self rearranjaPosicoesNotas:notaParaEdicao.posicaoNotaEdicao];
                         
                         for (UIView *subView in self.scrollEdicao.subviews){
                             if ([subView isEqual:notaParaEdicao.imagemNota]){
                                 [subView removeFromSuperview];
                             }
                         }
                         
                         [listaNotasEdicao removeObject:notaParaEdicao];
                     }];

}

-(void)addGestureSegurarNotasTela:(Nota*)notaSegura{

    
    NotaEdicaoGesture *swipeGesture2 = [[NotaEdicaoGesture alloc] initWithTarget:self action:@selector(deletarNota:)];
    swipeGesture2.direction = UISwipeGestureRecognizerDirectionDown;
    [swipeGesture2 setNumberOfTouchesRequired:1];
    notaSegura.imagemNota.userInteractionEnabled = YES;
    swipeGesture2.notaEdicaoGesture = notaSegura;
    
    
    [notaSegura.imagemNota addGestureRecognizer:swipeGesture2];
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    listaNotasEdicao = [[NSMutableArray alloc]init];
    
    [[DesenhaPartitura sharedManager]desenhaContornoPartituraParaEdicao];
    self.scrollEdicao.delegate = self;
    
    nota = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"seminima"];
    
    for (UIImageView *t in [DesenhaPartitura sharedManager].listaImagensTracoPentagrama) {
        [[self scrollEdicao]addSubview:t];
    }
    
    posicaoX = 150;
    espacamentoEntreNotas = 110;
    limiteDeNotas = 100;
    [self addGesturePrintarNotasTela];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

///////////////////////// NOTA /////////////////////////

- (IBAction)semibreveBotao:(id)sender {
    nota = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"semibreve"];
}

- (IBAction)minimaBotao:(id)sender {
    nota = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"minima"];
}

- (IBAction)seminimaBotao:(id)sender {
    nota = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"seminima"];
}

- (IBAction)colcheiaBotao:(id)sender {
    nota = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"colcheia"];
}

- (IBAction)semicolcheiaBotao:(id)sender {
    nota = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"semicolcheia"];
}

- (IBAction)fusaBotao:(id)sender {
    nota = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"fusa"];
}

- (IBAction)semifusaBotao:(id)sender {
    nota = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"semifusa"];
}


///////////////////////// PAUSA /////////////////////////

- (IBAction)pausaSemibreveBotao:(id)sender {
    nota = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"semibrevePausa"];
}

- (IBAction)pausaMinimaBotao:(id)sender {
    nota = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"minimaPausa"];
}

- (IBAction)pausaSeminimaBotao:(id)sender {
    nota = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"seminimaPausa"];
}

- (IBAction)pausaColcheiaBotao:(id)sender {
    nota = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"colcheiaPausa"];
}

- (IBAction)pausaSemicolcheiaBotao:(id)sender {
    nota = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"semicolcheiaPausa"];
}

- (IBAction)pausaFusaBotao:(id)sender {
    nota = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"fusaPausa"];
}

- (IBAction)pausaSemifusaBotao:(id)sender {
    nota = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"semifusaPausa"];
}

@end


