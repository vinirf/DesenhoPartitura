//
//  LeitorPartituraXML.m
//  DesenhoPartitura
//
//  Created by Vinicius Resende Fialho on 08/06/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import "LeitorPartituraXML.h"

@implementation LeitorPartituraXML

+(LeitorPartituraXML*)sharedManager{
    static LeitorPartituraXML *unicoInstrumento = nil;
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
        
    }
    return self;
}

-(void)iniciaLeiuturaXML:(NSString *)nomeXML{
    
    auxCodeValue2 = true;
    estadoStaff = false;
    
    descricaoGeralPartitura = [[NSMutableArray alloc] init];
    pentagramaPartitura = [[NSMutableArray alloc] init];
    notasPartitura = [[NSMutableArray alloc] init];
    notasPartitura2 = [[NSMutableArray alloc] init];
    
    NSString *thePath=[[NSBundle mainBundle] pathForResource:nomeXML ofType:@"xml"];
    NSURL *url=[NSURL fileURLWithPath:thePath];
    
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];

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
    
    
    [Sinfonia sharedManager].nomeInstrumentoSinfonia = [[descricaoGeralPartitura objectAtIndex:0] objectForKey: @"instrument-name"];
    [Sinfonia sharedManager].nomeInstrumentoSinfonia = [[descricaoGeralPartitura objectAtIndex:0] objectForKey: @"encoding-date"];
    [Sinfonia sharedManager].nomeInstrumentoSinfonia = [[descricaoGeralPartitura objectAtIndex:0] objectForKey: @"movement-title"];
    
    
    NSLog(@"=================PARTITURA=====================");
    for(int i=0;i<pentagramaPartitura.count;i++){
        
        Partitura *part = [[Partitura alloc]init];
        part.divisaoPartitura = [[pentagramaPartitura objectAtIndex:i] objectForKey: @"divisions"];
        part.armaduraClave = [[pentagramaPartitura objectAtIndex:i] objectForKey: @"fifths"];
        part.numeroTempo = [[pentagramaPartitura objectAtIndex:i] objectForKey: @"beats"];
        part.unidadeTempo = [[pentagramaPartitura objectAtIndex:i] objectForKey: @"beat-type"];
        part.tipoClave = [[pentagramaPartitura objectAtIndex:i] objectForKey: @"sign"];
        part.linhaClave = [[pentagramaPartitura objectAtIndex:i] objectForKey: @"line"];
        [[[Sinfonia sharedManager] listaPartiturasSinfonia] addObject:part];
        
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
        
        [[[[[Sinfonia sharedManager] listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]addObject:nota];
        
        
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
        
        [[[[[Sinfonia sharedManager] listaPartiturasSinfonia]objectAtIndex:1]listaNotasPartitura]addObject:nota];
        
        
    }
    
    
}


@end
