package;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;
import openfl.utils.JNI;

/**
 * ...
 * @author Thomas B
 */

class Main extends Sprite {
	
	var init = JNI.createStaticMethod("testjni.TestJNI", "init", "(Lorg/haxe/lime/HaxeObject;)V");
	var noCall = JNI.createStaticMethod("testjni.TestJNI", "testWithNoCall", "()Ljava/lang/String;");
	var call = JNI.createStaticMethod("testjni.TestJNI", "testWithCall", "()V");

	public function new() {
		super();
		
		init(this);
		
		trace(noCall());
		
		var crashButton = new Sprite();
		crashButton.graphics.beginFill(0xff0000);
		crashButton.graphics.drawCircle(0, 0, 200);
		crashButton.x = Lib.current.stage.stageWidth / 2;
		crashButton.y = Lib.current.stage.stageHeight / 2;
		addChild(crashButton);
		crashButton.addEventListener(MouseEvent.CLICK, onClick);
	}
	
	private function onClick(e:MouseEvent):Void {
		call();
	}
	
	public function testHaxeCallFromJava() {
		trace("It works!");
	}
}
