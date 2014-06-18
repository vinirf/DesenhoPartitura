
#import "ViewController.h"


@implementation ViewController

-(void)atualizaBarraScroll{
    if([Sinfonia sharedManager].compassoAtual < [Sinfonia sharedManager].numeroTotalCompassos){
        if (([Sinfonia sharedManager].compassoAtual % 8 == 0)&&([Sinfonia sharedManager].compassoAtual != self.auxContadorScroll)){
            self.auxContadorScroll = [Sinfonia sharedManager].compassoAtual;
            CGPoint bottomOffset = CGPointMake(0,[[Sinfonia sharedManager]contadorScrollDesloca]);
            [[self scroll] setContentOffset:bottomOffset animated:YES];
            [Sinfonia sharedManager].contadorScrollDesloca += 350;
        }
    }
}

-(void)addItensDesenhoPartituraAoScroll{
    
    [[DesenhaPartitura sharedManager]metodosDesenhaPartitura];
    
    self.scroll.delegate = self;
    
    [[self scroll] setContentSize:CGSizeMake(self.scroll.bounds.size.width, self.scroll.bounds.size.height* ([[[Sinfonia sharedManager]numeroCompassos] floatValue]/11))];
    
    for (UIImageView *t in [DesenhaPartitura sharedManager].listaImagensColunaPentagrama) {
        [[self scroll]addSubview:t];
    }
    for (UIImageView *t in [DesenhaPartitura sharedManager].listaImagensTracoPentagrama) {
        [[self scroll]addSubview:t];
    }
    for (UIImageView *t in [DesenhaPartitura sharedManager].listaArmadurasClave) {
        [[self scroll]addSubview:t];
    }
    
    [[self scroll]addSubview:[DesenhaPartitura sharedManager].textoNomePartitura];
    [[self scroll]addSubview:[DesenhaPartitura sharedManager].textoNomeInstrumento];
    [[self scroll]addSubview:[DesenhaPartitura sharedManager].tipoClave];
    [[self scroll]addSubview:[DesenhaPartitura sharedManager].textoNumeroTempo];
    [[self scroll]addSubview:[DesenhaPartitura sharedManager].textoUnidadeTempo];
    
    for (Nota *t in [[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]) {
        [[self scroll]addSubview:t.imagemNota];
    }
    for (Nota *t in [[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]) {
        [[self scroll]addSubview:t.imagemAcidente];
    }
    
    for (UIImageView *t in [DesenhaPartitura sharedManager].listaTracoNotas) {
        [[self scroll]addSubview:t];
    }
    
    [Sinfonia sharedManager].contadorScrollDesloca = 400;
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(atualizaBarraScroll) userInfo:nil repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(atualizaTextoDescricaoNota) userInfo:nil repeats:YES];

    
}


- (IBAction)tocar:(id)sender {
    
    [[Sinfonia sharedManager] metodoIniciaSinfonia:@"asa":@"Piano"];
    [self addItensDesenhoPartituraAoScroll];
    
}


- (IBAction)tocarViolao:(id)sender {
    
    [[Sinfonia sharedManager] metodoIniciaSinfonia:@"asa":@"natural"];
    [self addItensDesenhoPartituraAoScroll];

}


- (IBAction)tocarFlauta:(id)sender {
    [[Sinfonia sharedManager] metodoIniciaSinfonia:@"asa":@"lute"];
    [self addItensDesenhoPartituraAoScroll];
}



- (void) viewDidLoad{
    

}



- (IBAction)botaoPause:(id)sender {
    [[Sinfonia sharedManager]pausePlayerPartitura];
}

- (IBAction)botaoStop:(id)sender {
    [[Sinfonia sharedManager]stopPlayerPartitura];
    [[self scroll] setContentOffset:CGPointMake(0,0) animated:YES];
    
}

- (IBAction)botaoPlay:(id)sender {
    [[Sinfonia sharedManager]tocarPlayerPartitura];
}

-(void)atualizaTextoDescricaoNota{
    self.textoDescricaoNota.text = [[Sinfonia sharedManager]textoDescricaoNota];
}

@end




