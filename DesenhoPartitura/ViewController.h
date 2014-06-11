
#import "Sinfonia.h"
#import "DataBaseInstrumento.h"



@interface ViewController : UIViewController <NSXMLParserDelegate, UIScrollViewDelegate> {
   
    NSMutableArray *listaImagensTracoPentagrama;
    NSMutableArray *listaImagensColunaPentagrama;
    
    float tamanhoHorizontal;
    float tamanhoVertical;
    
    NSString *codeValue2;
    
    int auxBrilhaNota;
   
}

@property Instrumento *inst;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

@end
