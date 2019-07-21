import java.lang.reflect.Method;
import temp.PrintStars_annotation_예제;
import java.lang.annotation.Annotation;

public class Test067_2_annotation_예제 {
    public static void main( String[] args ) throws Exception {
		Class<?> cls = Class.forName("temp.Test067");
		Object obj = cls.newInstance();

		Method mtd = cls.getMethod( "print" );
		System.out.println( mtd );

		Annotation anot = mtd.getAnnotation( PrintStars_annotation_예제.class );
		Object r = mtd.invoke( obj );
		if( anot != null ){
			System.out.print("**");
		}
		System.out.println( ((Integer)r).intValue() );
    }
}
//	javac Test067_2.java
//	java -classpath C:\A\;. Test067_2