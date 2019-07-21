import temp.IGreet_annotation_예제;

public class Test044_ {
	public static void main( String[] args ) throws Exception {
		Class<?> cls = Class.forName("temp."+ args[0] +"Greet");
		IGreet_annotation_예제 ig = (IGreet_annotation_예제)cls.newInstance();
		System.out.println( ig.greet() );
	}
}
/*

*/