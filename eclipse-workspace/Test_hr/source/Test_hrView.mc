using Toybox.Graphics;
using Toybox.WatchUi;
using Toybox.Math;

class Test_hrView extends WatchUi.View {
	// Coin Names
    var BTC_name = "BTC = ";
    var ETH_name = "ETH = ";
    var LTC_name = "LTC = ";
    // Coin PNG 
    var BTC_png;
    var ETH_png;
    var LTC_png;
    // Coin values
    var BTC_value;
    var ETH_value;
    var LTC_value;

    var _message;

    function initialize(message) {
        View.initialize();
        _message = message;        
        System.println(message);
       
        
    }
        // Load your resources here
   /* function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
        View.findDrawableById("message").setText(_message);        
    }*/
    
        // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout

        BTC_name.draw(dc);
        ETH_name.draw(dc);
        LTC_name.draw(dc);
        
        ETH_png.draw(dc);
        BTC_png.draw(dc);
        LTC_png.draw(dc);
        
        BTC_value.draw(dc);
        ETH_value.draw(dc);
		LTC_value.draw(dc);
        //View.onUpdate(dc);
    }

    /*
    function initialize() { 
        View.initialize();
        //View.setBackgroundColor(Graphics.COLOR_BLACK);
    }*/
    
    function onShow() {
    	
    	// Bitcoin Watch layout
    	
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
        
        BTC_value = new WatchUi.Text({
            :text=>BTC_v,
            :color=>Graphics.COLOR_BLACK,
            :font=>Graphics.FONT_SMALL,
            :locX=>72,
            :locY=>5
        });
        
        // Ethereum Watch layout
        
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
        
        ETH_value = new WatchUi.Text({
            :text=>ETH_v,
            :color=>Graphics.COLOR_BLACK,
            :font=>Graphics.FONT_SMALL,
            :locX=>72,
            :locY=>37
        });
        
        
        // Litecoin Watch layout
        
        LTC_name = new WatchUi.Text({
            :text=>LTC_name,
            :color=>Graphics.COLOR_BLACK,
            :backgroundColor=>Graphics.COLOR_WHITE,
            :font=>Graphics.FONT_SMALL,
            :justification=>Graphics.TEXT_JUSTIFY_LEFT,
            :locX=>30,
            :locY=>69
        });
        
        LTC_png = new WatchUi.Bitmap({
            :rezId=>Rez.Drawables.LTC_png,
            :locY=>69 
            
        });
        
        LTC_value = new WatchUi.Text({
            :text=>LTC_v,
            :color=>Graphics.COLOR_BLACK,
            :font=>Graphics.FONT_SMALL,
            :locX=>72,
            :locY=>69
        });
        
        
    }


}

