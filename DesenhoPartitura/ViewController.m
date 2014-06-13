
// The sounds in this demo project were taken from Fluid R3 by Frank Wen,
// a freely distributable SoundFont.


#import "ViewController.h"



#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#define CASE(str)                       if ([__s__ isEqualToString:(str)])
#define SWITCH(s)                       for (NSString *__s__ = (s); ; )
#define DEFAULT

#define n64th 0.0314
#define n32th 0.0625
#define n16th 0.125
#define eighth 0.25
#define quarter 0.5
#define half 1.0
#define whole 2.0

@implementation ViewController



////////////////////////////// Desenha Imagens ///////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////

-(void)brilhandoNotas{
    
    Nota *notaBrilha;
    notaBrilha = [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:auxBrilhaNota];
    
    notaBrilha.imagemNota.alpha = 0.5;
    //notaBrilha.imagemNota.hidden = YES;
    
    
    auxBrilhaNota++;
    float tempo = 0.0;
    
    if([notaBrilha.tipoNota isEqualToString:@"64th"]){
        tempo = n64th;
    }else if([notaBrilha.tipoNota isEqualToString:@"32th"]){
        tempo = n32th;
    }else if([notaBrilha.tipoNota isEqualToString:@"16th"]){
        tempo = n16th;
    }else if([notaBrilha.tipoNota isEqualToString:@"eighth"]){
        tempo = eighth;
    }else if([notaBrilha.tipoNota isEqualToString:@"quarter"]){
        tempo = quarter;
    }else if([notaBrilha.tipoNota isEqualToString:@"half"]){
        tempo = half;
    }else if([notaBrilha.tipoNota isEqualToString:@"whole"]){
        tempo = whole;
    }else{
        NSLog(@"deu errado temopo");
    }
    
    [notaBrilha.imagemNota setNeedsDisplay];
    [notaBrilha.imagemNota setNeedsLayout];
    [notaBrilha.imagemNota reloadInputViews];
    
    if(auxBrilhaNota < [[[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]count]) {
        [NSTimer scheduledTimerWithTimeInterval:tempo target:self selector:@selector(brilhandoNotas) userInfo:nil repeats:NO];
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

}

-(void)tocarPartitura {
    

}

- (IBAction)tocar:(id)sender {
    
    [[Sinfonia sharedManager] metodoIniciaSinfonia:@"asa":@"Piano"];

    [self addItensDesenhoPartituraAoScroll];
    
   // [self brilhandoNotas];
}


- (IBAction)tocarFlauta:(id)sender {
    
    [[Sinfonia sharedManager] metodoIniciaSinfonia:@"asa":@"natural"];
    
    [self addItensDesenhoPartituraAoScroll];

}


- (void) viewDidLoad{
    
    auxBrilhaNota = 0;
}



@end
