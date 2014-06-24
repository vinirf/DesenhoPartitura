
#import "Sinfonia.h"
#import "DataBaseInstrumento.h"
#import "DesenhaPartitura.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController <UIScrollViewDelegate> {

}

//Atributos do Scroll da Imagem Partitura
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@property int auxContadorScroll;


- (IBAction)botaoPause:(id)sender;
- (IBAction)botaoStop:(id)sender;
- (IBAction)botaoPlay:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *textoDescricaoNota;

@property (weak, nonatomic) IBOutlet UILabel *textoDescricaoVelocidade;

- (IBAction)botaoAlteraVelocidade:(id)sender;


@end
