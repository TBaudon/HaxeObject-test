package testjni;

import java.lang.String;
import android.util.Log;

import org.haxe.extension.Extension;
import org.haxe.lime.HaxeObject;

public class TestJNI extends Extension
{
	
	static HaxeObject mObject;
	
	public TestJNI(){
		super();
	}
	
	public static void init(HaxeObject obj){
		mObject = obj;
	}
	
	public static String testWithNoCall() {

		Log.i("trace", "JNI test with no call");
		
		return "Hello JNI";
	}
	
	public static void testWithCall() {

		mObject.call0("testHaxeCallFromJava");
		
		Log.i("trace", "JNI test with call");

	}
}