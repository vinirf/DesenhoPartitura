//
//  Sinfonia.m
//  DesenhoPartitura
//
//  Created by Vinicius Resende Fialho on 07/06/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import "Sinfonia.h"

#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#define CASE(str)                       if ([__s__ isEqualToString:(str)])
#define SWITCH(s)                       for (NSString *__s__ = (s); ; )
#define DEFAULT

//#define n64th 0.0625
//#define n32th 0.125
//#define n16th 0.25
//#define eighth 0.5
//#define quarter 1.0
//#define half 2.0
//#define whole 4.0

#define n64th 0.0314
#define n32th 0.0625
#define n16th 0.125
#define eighth 0.25
#define quarter 0.5
#define half 1.0
#define whole 2.0

@implementation Sinfonia

+(Sinfonia*)sharedManager{
    static Sinfonia *unicoInstrumento = nil;
    if(!unicoInstrumento){
        unicoInstrumento = [[super allocWithZone:nil]init];
    }
    return unicoInstrumento;
}

-(id)init{
    self = [super init];
    if(self){
        self.listaPartiturasSinfonia = [[NSMutableArray alloc]init];
    }
    return self;
}


+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

-(void)mostraEfeito:(Nota*)notes{
    
    Nota *notaBrilha = notes;
    notaBrilha.imagemNota.alpha = 0.5;
    
}

-(void)desapareceEfeito:(Nota*)notes{
    
    Nota *notaBrilha = notes;
    notaBrilha.imagemNota.alpha = 1.0;
    
}

-(void)metodoIniciaSinfonia:(NSString*)nomePartituras :(NSString*)nomeInstrumentoPlist {
    

   //////////////////////////////// SoundBankPlayer ////////////////////////////////////////
    
    [[DataBaseInstrumento sharedManager] addInstrumentosPadroesDoApplicativo];
    self.instrumento = [[DataBaseInstrumento sharedManager]retornaInstrumento:nomeInstrumentoPlist];
    
    _soundBankPlayer = [[SoundBankPlayer alloc] init];
    [_soundBankPlayer setSoundBank:self.instrumento.nomeInstrumento];
    _soundBankPlayer2 = [[SoundBankPlayer alloc] init];
    [_soundBankPlayer2 setSoundBank:self.instrumento.nomeInstrumento];
    
    
    //////////////////////////////// XML ////////////////////////////////////////
    
    auxCodeValue2 = true;
    estadoStaff = false;
    
    descricaoGeralPartitura = [[NSMutableArray alloc] init];
    pentagramaPartitura = [[NSMutableArray alloc] init];
    notasPartitura = [[NSMutableArray alloc] init];
    notasPartitura2 = [[NSMutableArray alloc] init];
    
    NSString *thePath=[[NSBundle mainBundle] pathForResource:nomePartituras ofType:@"xml"];
    NSURL *url=[NSURL fileURLWithPath:thePath];
    
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
    

    //[[LeitorPartituraXML sharedManager]iniciaLeiuturaXML:nomePartituras];
    
    ////////////////////////////// Tocar Musica  /////////////////////////////
    
    controleVelocidaTranNota = 0.0;
    auxIndiceNotas = 0;
    auxIndiceNotas2 = 0;
    
    recebeOrdemNotasDoInstrumento = self.instrumento.ordemNotasInstrumento;

    NSString *nomePrimeiroMetodo = self.instrumento.metodoPrimeiroTocar;
    NSString *nomeSegundoMetodo = self.instrumento.metodoSegundoTocar;
    
    SEL selectors1 = NSSelectorFromString(nomePrimeiroMetodo);
    SEL selectors2 = NSSelectorFromString(nomeSegundoMetodo);
    
    [self performSelector:selectors1];
    
    if([codeValue isEqualToString:@"P2"] || (estadoStaff)){
        [self performSelector:selectors2];
        
    }
}



/////////////////////////////////////// Metodos do XML //////////////////////////////////////////


-(NSString*)retiraEspacoLinhaString:(NSString*)string{
    
    NSString *aux2NotaFinal = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    string = [aux2NotaFinal stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    return string;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    element = elementName;
    
    if ([element isEqualToString:@"part"]){
        codeValue = [attributeDict objectForKey:@"id"];
        
    }
    
    if ([element isEqualToString:@"score-partwise"]) {
        item    = [[NSMutableDictionary alloc] init];
        titulo   = [[NSMutableString alloc] init];
        data   = [[NSMutableString alloc] init];
        nomeInstrumento   = [[NSMutableString alloc] init];
    }
    
    if ([element isEqualToString:@"part"]) {
        partitura = [[NSMutableDictionary alloc] init];
        n1 = [[NSMutableString alloc] init];
        armaduraClave = [[NSMutableString alloc] init];
        numeroDeTempo = [[NSMutableString alloc] init];
        unidadeDeTempo = [[NSMutableString alloc] init];
        tipoClave = [[NSMutableString alloc] init];
        linhaClave = [[NSMutableString alloc] init];
    }
    
    if ([element isEqualToString:@"note"]) {
        notas = [[NSMutableDictionary alloc] init];
        n2 = [[NSMutableString alloc] init];
        n3 = [[NSMutableString alloc] init];
        n4 = [[NSMutableString alloc] init];
        n5 = [[NSMutableString alloc] init];
        tom = [[NSMutableString alloc] init];
        continuaNota = [[NSMutableString alloc]init];
        posNotaCimaBaixo = [[NSMutableString alloc] init];
        nivelPentagrama = [[NSMutableString alloc] init];
        numeroCompasso = [[NSMutableString alloc]init];
        
    }
    
    if ([element isEqualToString:@"measure"]){
        codeValue2 = [attributeDict objectForKey:@"number"];
        self.numeroCompassos = codeValue2;
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    
    if ([codeValue isEqualToString:@"P1"]){
    }
    
    //Descricao geral credit-words
    if (([element isEqualToString:@"work-title"] )||([element isEqualToString:@"credit-words"])){
        [titulo appendString:string];
    }
    if ([element isEqualToString:@"encoding-date"]) {
        [data appendString:string];
    }
    if ([element isEqualToString:@"instrument-name"]) {
        [nomeInstrumento appendString:string];
    }
    
    //DescricaoPartitura
    if ([element isEqualToString:@"divisions"]) {
        [n1 appendString:string];
    }
    if ([element isEqualToString:@"fifths"]) {
        [armaduraClave appendString:string];
    }
    if ([element isEqualToString:@"beats"]) {
        [numeroDeTempo appendString:string];
    }
    if ([element isEqualToString:@"beat-type"]) {
        [unidadeDeTempo appendString:string];
    }
    if ([element isEqualToString:@"sign"]) {
        [tipoClave appendString:string];
    }
    if ([element isEqualToString:@"line"]) {
        [linhaClave appendString:string];
    }
    
    //Notas
    if ([element isEqualToString:@"step"]) {
        string = [self retiraEspacoLinhaString:string];
        [n2 appendString:string];
    }
    if ([element isEqualToString:@"octave"]) {
        string = [self retiraEspacoLinhaString:string];
        [n3 appendString:string];
    }
    if ([element isEqualToString:@"duration"]) {
        [n4 appendString:string];
        //Pega o compasso da nota
        if(auxCodeValue2){
            [numeroCompasso appendString:codeValue2];
            auxCodeValue2 = false;
        }
        
    }
    if ([element isEqualToString:@"type"]) {
        string = [self retiraEspacoLinhaString:string];
        [n5 appendString:string];
    }
    if ([element isEqualToString:@"alter"]) {
        string = [self retiraEspacoLinhaString:string];
        [tom appendString:string];
    }
    if ([element isEqualToString:@"staff"]) {
        [nivelPentagrama appendString:string];
    }
    if ([element isEqualToString:@"stem"]) {
        string = [self retiraEspacoLinhaString:string];
        [posNotaCimaBaixo appendString:string];
    }
    if ([element isEqualToString:@"beam"]) {
        string = [self retiraEspacoLinhaString:string];
        [continuaNota appendString:string];
    }
    
    
    
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    
    if ([elementName isEqualToString:@"score-partwise"]) {
        NSArray *a = [titulo componentsSeparatedByString:@"\n"];
        titulo = [a objectAtIndex:0];
        [item setObject:titulo forKey:@"movement-title"];
        [item setObject:data forKey:@"encoding-date"];
        [item setObject:nomeInstrumento forKey:@"instrument-name"];
        
        [descricaoGeralPartitura addObject:[item copy]];
    }
    
    
    if ([elementName isEqualToString:@"part"]) {
        
        [partitura setObject:n1 forKey:@"divisions"];
        [partitura setObject:armaduraClave forKey:@"fifths"];
        [partitura setObject:numeroDeTempo forKey:@"beats"];
        [partitura setObject:unidadeDeTempo forKey:@"beat-type"];
        [partitura setObject:tipoClave forKey:@"sign"];
        [partitura setObject:linhaClave forKey:@"line"];
        
        [pentagramaPartitura addObject:[partitura copy]];
    }
    
    
    if ([codeValue isEqualToString:@"P1"]){
        if ([elementName isEqualToString:@"note"]) {
            auxCodeValue2 = true;
            if (([nivelPentagrama rangeOfString:@"1"].location != NSNotFound)) {
                
                [notas setObject:n2 forKey:@"step"];
                [notas setObject:n3 forKey:@"octave"];
                [notas setObject:n4 forKey:@"duration"];
                [notas setObject:n5 forKey:@"type"];
                [notas setObject:tom forKey:@"alter"];
                [notas setObject:posNotaCimaBaixo forKey:@"stem"];
                [notas setObject:nivelPentagrama forKey:@"staff"];
                [notas setObject:numeroCompasso forKey:@"numCom"];
                [notas setObject:continuaNota forKey:@"beam"];
                
                [notasPartitura addObject:[notas copy]];
                
            }else if (([nivelPentagrama rangeOfString:@"2"].location != NSNotFound)){
                
                estadoStaff = true;
                
                [notas setObject:n2 forKey:@"step"];
                [notas setObject:n3 forKey:@"octave"];
                [notas setObject:n4 forKey:@"duration"];
                [notas setObject:n5 forKey:@"type"];
                [notas setObject:tom forKey:@"alter"];
                [notas setObject:posNotaCimaBaixo forKey:@"stem"];
                [notas setObject:nivelPentagrama forKey:@"staff"];
                [notas setObject:numeroCompasso forKey:@"numCom"];
                [notas setObject:continuaNota forKey:@"beam"];
                
                [notasPartitura2 addObject:[notas copy]];
                
            }else{
                [notas setObject:n2 forKey:@"step"];
                [notas setObject:n3 forKey:@"octave"];
                [notas setObject:n4 forKey:@"duration"];
                [notas setObject:n5 forKey:@"type"];
                [notas setObject:tom forKey:@"alter"];
                [notas setObject:posNotaCimaBaixo forKey:@"stem"];
                [notas setObject:nivelPentagrama forKey:@"staff"];
                [notas setObject:numeroCompasso forKey:@"numCom"];
                [notas setObject:continuaNota forKey:@"beam"];
                
                [notasPartitura addObject:[notas copy]];
            }
            
        }
    }
    
    if  ([codeValue isEqualToString:@"P2"]){
         NSLog(@"stringsEGUNDA %@",nivelPentagrama);
        if ([elementName isEqualToString:@"note"]) {
            [notas setObject:n2 forKey:@"step"];
            [notas setObject:n3 forKey:@"octave"];
            [notas setObject:n4 forKey:@"duration"];
            [notas setObject:n5 forKey:@"type"];
            [notas setObject:tom forKey:@"alter"];
            [notas setObject:posNotaCimaBaixo forKey:@"stem"];
            [notas setObject:nivelPentagrama forKey:@"staff"];
            [notas setObject:continuaNota forKey:@"beam"];
            
            [notasPartitura2 addObject:[notas copy]];
            
        }
    }
    
    
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
    
    self.nomeInstrumentoSinfonia = [[descricaoGeralPartitura objectAtIndex:0] objectForKey: @"instrument-name"];
    self.dataSinfonia = [[descricaoGeralPartitura objectAtIndex:0] objectForKey: @"encoding-date"];
    self.nomeSinfonia = [[descricaoGeralPartitura objectAtIndex:0] objectForKey: @"movement-title"];
    
    
    NSLog(@"=================PARTITURA=====================");
    for(int i=0;i<pentagramaPartitura.count;i++){

        Partitura *part = [[Partitura alloc]init];
        part.divisaoPartitura = [[pentagramaPartitura objectAtIndex:i] objectForKey: @"divisions"];
        part.armaduraClave = [[pentagramaPartitura objectAtIndex:i] objectForKey: @"fifths"];
        part.numeroTempo = [[pentagramaPartitura objectAtIndex:i] objectForKey: @"beats"];
        part.unidadeTempo = [[pentagramaPartitura objectAtIndex:i] objectForKey: @"beat-type"];
        part.tipoClave = [[pentagramaPartitura objectAtIndex:i] objectForKey: @"sign"];
        part.linhaClave = [[pentagramaPartitura objectAtIndex:i] objectForKey: @"line"];
        [[self listaPartiturasSinfonia] addObject:part];
        
    }

    if((estadoStaff) && (pentagramaPartitura.count != 2)){
        Partitura *part = [[Partitura alloc]init];
        part.divisaoPartitura = [[pentagramaPartitura objectAtIndex:0] objectForKey: @"divisions"];
        part.armaduraClave = [[pentagramaPartitura objectAtIndex:0] objectForKey: @"fifths"];
        part.numeroTempo = [[pentagramaPartitura objectAtIndex:0] objectForKey: @"beats"];
        part.unidadeTempo = [[pentagramaPartitura objectAtIndex:0] objectForKey: @"beat-type"];
        part.tipoClave = [[pentagramaPartitura objectAtIndex:0] objectForKey: @"sign"];
        part.linhaClave = [[pentagramaPartitura objectAtIndex:0] objectForKey: @"line"];
        [[self listaPartiturasSinfonia] addObject:part];
    }
    
    NSLog(@"=================NOTAS=====================");
    for(int i=0;i<notasPartitura.count;i++){
        
        Nota *nota = [[Nota alloc]init];
        nota.nomeNota = [[notasPartitura objectAtIndex:i] objectForKey: @"step"];
        nota.oitava = [[notasPartitura objectAtIndex:i] objectForKey: @"octave"];
        nota.duracao = [[notasPartitura objectAtIndex:i] objectForKey: @"duration"];
        nota.tipoNota = [[notasPartitura objectAtIndex:i] objectForKey: @"type"];
        nota.tom = [[notasPartitura objectAtIndex:i] objectForKey: @"alter"];
        nota.pertencePartitura = [[notasPartitura objectAtIndex:i] objectForKey: @"staff"];
        nota.numeroCompasso = [[notasPartitura objectAtIndex:i] objectForKey: @"numCom"];
        nota.posicaoRadiano = [[notasPartitura objectAtIndex:i] objectForKey: @"stem"];
        nota.concatenaNota = [[notasPartitura objectAtIndex:i] objectForKey: @"beam"];
        
        [[[[self listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]addObject:nota];
        
    }
    
    NSLog(@"=================NOTAS 2=====================");
    for(int i=0;i<notasPartitura2.count;i++){
        
        Nota *nota = [[Nota alloc]init];
        nota.nomeNota = [[notasPartitura2 objectAtIndex:i] objectForKey: @"step"];
        nota.oitava = [[notasPartitura2 objectAtIndex:i] objectForKey: @"octave"];
        nota.duracao = [[notasPartitura2 objectAtIndex:i] objectForKey: @"duration"];
        nota.tipoNota = [[notasPartitura2 objectAtIndex:i] objectForKey: @"type"];
        nota.tom = [[notasPartitura2 objectAtIndex:i] objectForKey: @"alter"];
        nota.pertencePartitura = [[notasPartitura2 objectAtIndex:i] objectForKey: @"staff"];
        nota.numeroCompasso = [[notasPartitura2 objectAtIndex:i] objectForKey: @"numCom"];
        nota.posicaoRadiano = [[notasPartitura2 objectAtIndex:i] objectForKey: @"stem"];
        nota.concatenaNota = [[notasPartitura2 objectAtIndex:i] objectForKey: @"beam"];
        
        [[[[self listaPartiturasSinfonia]objectAtIndex:1]listaNotasPartitura]addObject:nota];
        
    }
    
}



///////////////////////////////  Piano  ///////////////////////////////////////////////

-(void)tocarpentagrama2{
    
    Nota *nota = [[[[self listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:auxIndiceNotas2];
    NSString *nomeNota = [nota nomeNota];
    NSString *nivelNota = [nota oitava];
    NSString *tomEncurtado = [nota tom];
    NSString *notaFinal = [NSString stringWithFormat:@"%@%@",nivelNota,nomeNota];
    NSString *tempoNota = [nota tipoNota];
    
    float tempo = 0.0;
    float volume = 0.4;
  
    if([tempoNota isEqualToString:@"64th"]){
        tempo = n64th;
    }else if([tempoNota isEqualToString:@"32th"]){
        tempo = n32th;
    }else if([tempoNota isEqualToString:@"16th"]){
        tempo = n16th;
    }else if([tempoNota isEqualToString:@"eighth"]){
        tempo = eighth;
    }else if([tempoNota isEqualToString:@"quarter"]){
        tempo = quarter;
    }else if([tempoNota isEqualToString:@"half"]){
        tempo = half;
    }else if([tempoNota isEqualToString:@"whole"]){
        tempo = whole;
        volume = 10.0;
    }else{
        NSLog(@"deu errado temopo");
    }
    
    
    if ([tomEncurtado rangeOfString:@"-1"].location != NSNotFound){
        int indiceDescerEscala = -1;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [self.instrumento retornaIndiceListaMusicas:notaFinal:indiceDescerEscala];
        NSLog(@"depois- %@",notaFinal);
        
    }else if ([tomEncurtado rangeOfString:@"1"].location != NSNotFound){
        int indiceSubirEscala = 1;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [self.instrumento retornaIndiceListaMusicas:notaFinal:indiceSubirEscala];
        NSLog(@"depois+ %@",notaFinal);
        
    }else if ([tomEncurtado rangeOfString:@"-2"].location != NSNotFound){
        int indiceSubirEscala = -2;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [self.instrumento retornaIndiceListaMusicas:notaFinal:indiceSubirEscala];
        NSLog(@"depois-- %@",notaFinal);
        
    }else if ([tomEncurtado rangeOfString:@"2"].location != NSNotFound){
        int indiceSubirEscala = 2;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [self.instrumento retornaIndiceListaMusicas:notaFinal:indiceSubirEscala];
        NSLog(@"depois++ %@",notaFinal);
        
    }else if([notaFinal isEqualToString:@""]){
        
        volume = 0.0;
        
    }else{
        
        
    }
    

    
    int retornaNotadoXML = [[self instrumento]retornarNumeroNotaInstrumento:recebeOrdemNotasDoInstrumento:notaFinal];
    [_soundBankPlayer2 queueNote:retornaNotadoXML gain:volume];
	[_soundBankPlayer2 playQueuedNotes];
    
    NSLog(@"notaP2 %d %@ %d",auxIndiceNotas,notaFinal,retornaNotadoXML);
    
    auxIndiceNotas2++;
    
    
    if(auxIndiceNotas2 < notasPartitura2.count){
        [NSTimer scheduledTimerWithTimeInterval:tempo-controleVelocidaTranNota target:self selector:@selector(tocarpentagrama2) userInfo:nil repeats:NO];
    }
    
    
}

-(void)tocarpentagrama1{
    
    Nota *nota = [[[[self listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:auxIndiceNotas];
    NSString *nomeNota = [nota nomeNota];
    NSString *nivelNota = [nota oitava];
    NSString *tomEncurtado = [nota tom];
    NSString *notaFinal = [NSString stringWithFormat:@"%@%@",nivelNota,nomeNota];
    NSString *tempoNota = [nota tipoNota];
    
    
    float tempo = 0.0;
    float volume = 0.4;
    
    
    if([tempoNota isEqualToString:@"64th"]){
        tempo = n64th;
    }else if([tempoNota isEqualToString:@"32th"]){
        tempo = n32th;
    }else if([tempoNota isEqualToString:@"16th"]){
        tempo = n16th;
    }else if([tempoNota isEqualToString:@"eighth"]){
        tempo = eighth;
    }else if([tempoNota isEqualToString:@"quarter"]){
        tempo = quarter;
    }else if([tempoNota isEqualToString:@"half"]){
        tempo = half;
    }else if([tempoNota isEqualToString:@"whole"]){
        tempo = whole;
        volume = 10.0;
    }else{
        NSLog(@"deu errado temopo");
    }
    
    
    if ([tomEncurtado rangeOfString:@"-1"].location != NSNotFound){
        int indiceDescerEscala = -1;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [self.instrumento retornaIndiceListaMusicas:notaFinal:indiceDescerEscala];
        NSLog(@"depois- %@",notaFinal);
        
    }else if ([tomEncurtado rangeOfString:@"1"].location != NSNotFound){
        int indiceSubirEscala = 1;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [self.instrumento retornaIndiceListaMusicas:notaFinal:indiceSubirEscala];
        NSLog(@"depois+ %@",notaFinal);
        
    }else if ([tomEncurtado rangeOfString:@"-2"].location != NSNotFound){
        int indiceDescerEscala = -2;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [self.instrumento retornaIndiceListaMusicas:notaFinal:indiceDescerEscala];
        NSLog(@"depois-- %@",notaFinal);
        
    }else if ([tomEncurtado rangeOfString:@"2"].location != NSNotFound){
        int indiceSubirEscala = 2;
        
        NSLog(@"antes %@",notaFinal);
        [self.instrumento retornaIndiceListaMusicas:notaFinal:indiceSubirEscala];
        NSLog(@"depois++ %@",notaFinal);
        
    }else if([notaFinal isEqualToString:@""]){
        
        volume = 0.0;
        
    }else{
        
    }
    
    if(auxIndiceNotas >0){
        Nota *nota = [[[[self listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:auxIndiceNotas-1];
       [self desapareceEfeito:nota];
    }
    
    [self mostraEfeito:nota];
    
    
    int retornaNotadoXML = [[self instrumento]retornarNumeroNotaInstrumento:recebeOrdemNotasDoInstrumento:notaFinal];
    [_soundBankPlayer queueNote:retornaNotadoXML gain:volume];
	[_soundBankPlayer playQueuedNotes];
    
    
    NSLog(@"nota %d %@ %d",auxIndiceNotas,notaFinal,retornaNotadoXML);
    
    auxIndiceNotas++;
    
    if(auxIndiceNotas < notasPartitura.count){
        [NSTimer scheduledTimerWithTimeInterval:tempo-controleVelocidaTranNota target:self selector:@selector(tocarpentagrama1) userInfo:nil repeats:NO];
    }
    
}

/////////////////////////////// Violao ///////////////////////////////////////////////

-(void)tocarSegundoPentagramaViolao{
    
    Nota *nota = [[[[self listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:auxIndiceNotas2];
    NSString *nomeNota = [nota nomeNota];
    NSString *nivelNota = [nota oitava];
    NSString *tomEncurtado = [nota tom];
    NSString *notaFinal = [NSString stringWithFormat:@"%@%@",nivelNota,nomeNota];
    NSString *tempoNota = [nota tipoNota];
    
    float tempo = 0.0;
    float volume = 0.4;
   
    
    if([tempoNota isEqualToString:@"64th"]){
        tempo = n64th;
    }else if([tempoNota isEqualToString:@"32th"]){
        tempo = n32th;
    }else if([tempoNota isEqualToString:@"16th"]){
        tempo = n16th;
    }else if([tempoNota isEqualToString:@"eighth"]){
        tempo = eighth;
    }else if([tempoNota isEqualToString:@"quarter"]){
        tempo = quarter;
    }else if([tempoNota isEqualToString:@"half"]){
        tempo = half;
    }else if([tempoNota isEqualToString:@"whole"]){
        tempo = whole;
        volume = 10.0;
    }else{
        NSLog(@"deu errado temopo");
    }
    
    
    if ([tomEncurtado rangeOfString:@"-1"].location != NSNotFound){
        int indiceDescerEscala = -1;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [self.instrumento retornaIndiceListaMusicas:notaFinal:indiceDescerEscala];
        NSLog(@"depois- %@",notaFinal);
        
    }else if ([tomEncurtado rangeOfString:@"1"].location != NSNotFound){
        int indiceSubirEscala = 1;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [self.instrumento retornaIndiceListaMusicas:notaFinal:indiceSubirEscala];
        NSLog(@"depois+ %@",notaFinal);
        
    }else if ([tomEncurtado rangeOfString:@"-2"].location != NSNotFound){
        int indiceSubirEscala = -2;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [self.instrumento retornaIndiceListaMusicas:notaFinal:indiceSubirEscala];
        NSLog(@"depois-- %@",notaFinal);
        
    }else if ([tomEncurtado rangeOfString:@"2"].location != NSNotFound){
        int indiceSubirEscala = 2;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [self.instrumento retornaIndiceListaMusicas:notaFinal:indiceSubirEscala];
        NSLog(@"depois++ %@",notaFinal);
        
    }else if([notaFinal isEqualToString:@""]){
        
        volume = 0.0;
        
    }else{
        
    }
    
    
    int retornaNotadoXML = [[self instrumento]retornarNumeroNotaInstrumento:recebeOrdemNotasDoInstrumento:notaFinal];
    [_soundBankPlayer2 queueNote:retornaNotadoXML gain:volume];
	[_soundBankPlayer2 playQueuedNotes];
    
    NSLog(@"notaP2 %d %@ %d",auxIndiceNotas,notaFinal,retornaNotadoXML);
    
    auxIndiceNotas2++;
    
    if(auxIndiceNotas2 < notasPartitura2.count){
        [NSTimer scheduledTimerWithTimeInterval:tempo-controleVelocidaTranNota target:self selector:@selector(tocarSegundoPentagramaViolao) userInfo:nil repeats:NO];
    }
    
    
}

-(void)tocarPrimeiroPentagramaViolao{
    
    
    Nota *nota = [[[[self listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]objectAtIndex:auxIndiceNotas];
    NSString *nomeNota = [nota nomeNota];
    NSString *nivelNota = [nota oitava];
    NSString *tomEncurtado = [nota tom];
    NSString *notaFinal = [NSString stringWithFormat:@"%@%@",nivelNota,nomeNota];
    NSString *tempoNota = [nota tipoNota];
    
    
    float tempo = 0.0;
    float volume = 0.4;
    
    
    
    if([tempoNota isEqualToString:@"64th"]){
        tempo = n64th;
    }else if([tempoNota isEqualToString:@"32th"]){
        tempo = n32th;
    }else if([tempoNota isEqualToString:@"16th"]){
        tempo = n16th;
    }else if([tempoNota isEqualToString:@"eighth"]){
        tempo = eighth;
    }else if([tempoNota isEqualToString:@"quarter"]){
        tempo = quarter;
    }else if([tempoNota isEqualToString:@"half"]){
        tempo = half;
    }else if([tempoNota isEqualToString:@"whole"]){
        tempo = whole;
        volume = 10.0;
    }else{
        NSLog(@"deu errado temopo");
    }
    
    
    if ([tomEncurtado rangeOfString:@"-1"].location != NSNotFound){
        int indiceDescerEscala = -1;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [self.instrumento retornaIndiceListaMusicas:notaFinal:indiceDescerEscala];
        NSLog(@"depois- %@",notaFinal);
        
    }else if ([tomEncurtado rangeOfString:@"1"].location != NSNotFound){
        int indiceSubirEscala = 1;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [self.instrumento retornaIndiceListaMusicas:notaFinal:indiceSubirEscala];
        NSLog(@"depois+ %@",notaFinal);
        
    }else if ([tomEncurtado rangeOfString:@"-2"].location != NSNotFound){
        int indiceSubirEscala = -2;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [self.instrumento retornaIndiceListaMusicas:notaFinal:indiceSubirEscala];
        NSLog(@"depois-- %@",notaFinal);
        
    }else if ([tomEncurtado rangeOfString:@"2"].location != NSNotFound){
        int indiceSubirEscala = 2;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [self.instrumento retornaIndiceListaMusicas:notaFinal:indiceSubirEscala];
        NSLog(@"depois++ %@",notaFinal);
        
    }else if([notaFinal isEqualToString:@""]){
        
        volume = 0.0;
        
    }else{
        
    }
  
    int retornaNotadoXML = [[self instrumento]retornarNumeroNotaInstrumento:recebeOrdemNotasDoInstrumento:notaFinal];
    [_soundBankPlayer queueNote:retornaNotadoXML gain:volume];
	[_soundBankPlayer playQueuedNotes];
    
    NSLog(@"nota %d %@ %d",auxIndiceNotas,notaFinal,retornaNotadoXML);
    
    auxIndiceNotas++;
    
    if(auxIndiceNotas < notasPartitura.count){
        [NSTimer scheduledTimerWithTimeInterval:tempo-controleVelocidaTranNota target:self selector:@selector(tocarPrimeiroPentagramaViolao) userInfo:nil repeats:NO];
    }
    
    
    
}


@end





