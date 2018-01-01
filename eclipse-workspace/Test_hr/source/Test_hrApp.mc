using Toybox.Application as App;

class Test_hrApp extends App.AppBase {

    function initialize() {
        AppBase.initialize();
    }
    
    // onStart() is called on application start up
    function onStart(state) {
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }
    
    function onShow() {      
    }
    
    function onMenu() {
    }
    
    // Return the initial view of your application here
    function getInitialView() {
        return [ new Test_hrView() ];
    }

}