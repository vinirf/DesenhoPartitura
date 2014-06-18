
#import "Sinfonia.h"
#import "DataBaseInstrumento.h"
#import "DesenhaPartitura.h"


@interface ViewController : UIViewController <UIScrollViewDelegate> {

}

//Atributos do Scroll da Imagem Partitura
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@property int auxContadorScroll;


- (IBAction)botaoPause:(id)sender;
- (IBAction)botaoStop:(id)sender;
- (IBAction)botaoPlay:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *textoDescricaoNota;

@end
