public class FutureMethodDemo {
    public static void getReady(){
        system.debug('Get ready');
    }
    public static void breakfast(){
        system.debug('Breakfast');
     
    }
    public static void movie(){
        system.Debug('Movie');
    }
    @future
    public static void carservicing(){
        system.Debug('Carservicing');
	}
}