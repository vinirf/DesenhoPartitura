//
//  Nota.h
//  DesenhoPartitura
//
//  Created by Vinicius Resende Fialho on 07/06/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface Nota : UIView {
  
    
}

@property UIImageView *imagemNota;
@property UIImageView *imagemAcidente;
@property UIImageView *imagePontoNota;
@property NSString *nomeNota;
@property NSString *oitava;
@property NSString *duracao;
@property NSString *tipoNota;
@property NSString *tom;
@property NSString *pertencePartitura;
@property NSString *numeroCompasso;
@property NSString *posicaoRadiano;
@property NSString *concatenaNota;
@property NSString *pontoNota;
@property float posNota;
@property int posicaoNotaEdicao;


@end
