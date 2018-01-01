using Toybox.Graphics;
using Toybox.WatchUi;

class Test_hrView extends WatchUi.View {

	var BTC_name = "BTC = $";
	var ETH_name = "ETH = $";
	var BTC_png;
	var ETH_png;
	

    function initialize() {
        View.initialize();
        //View.setBackgroundColor(Graphics.COLOR_BLACK);
	}
	
    function onShow() {
    	
		BTC_name = new WatchUi.Text({
		    :text=>BTC_name,
		    :color=>Graphics.COLOR_BLACK,
		    :backgroundColor=>Graphics.COLOR_WHITE,
		    :font=>Graphics.FONT_SMALL,
		    :justification=>Graphics.TEXT_JUSTIFY_LEFT,
		    :locX=>30,
		    :locY=>5
		    
		});
		
		BTC_png = new WatchUi.Bitmap({
            :rezId=>Rez.Drawables.BTC_png,
            :locY=>5
            
        });
		
		ETH_name = new WatchUi.Text({
		    :text=>ETH_name,
		    :color=>Graphics.COLOR_BLACK,
		    :backgroundColor=>Graphics.COLOR_WHITE,
		    :font=>Graphics.FONT_SMALL,
		    :justification=>Graphics.TEXT_JUSTIFY_LEFT,
		    :locX=>30,
		    :locY=>37
		});
		
		ETH_png = new WatchUi.Bitmap({
            :rezId=>Rez.Drawables.ETH_png,
            :locY=>37 
            
        });
        

        
    }

    function onUpdate(dc) {
        BTC_name.draw(dc);
        ETH_name.draw(dc);
        ETH_png.draw(dc);
        BTC_png.draw(dc);
    } 
   


}

