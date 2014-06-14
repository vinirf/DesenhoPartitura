
#import "Sinfonia.h"
#import "DataBaseInstrumento.h"
#import "DesenhaPartitura.h"


@interface ViewController : UIViewController <UIScrollViewDelegate> {

}

//Atributos do Scroll da Imagem Partitura
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@property int contadorScrollDesloca;
@property int auxContadorScroll;


@end
