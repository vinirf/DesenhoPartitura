
#import "Sinfonia.h"
#import "DataBaseInstrumento.h"
#import "DesenhaPartitura.h"


@interface ViewController : UIViewController <UIScrollViewDelegate> {
    int auxBrilhaNota;
}

@property Instrumento *inst;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

@end
