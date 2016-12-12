package;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import zerolib.ZMath;

/**
 * ...
 * @author ...
 */
class Poofs extends FlxTypedGroup<Poof>
{

	public function new() 
	{
		super();
		for (i in 0...64)
			add(new Poof());
	}
	
	public function fire(_p:FlxPoint, _s:Int, _c:Int):Void
	{
		if (getFirstAvailable() != null)
			getFirstAvailable().fire(_p, _s, _c);
	}
	
}

class Poof extends FlxSprite
{
	
	public function new()
	{
		super();
		exists = false;
		loadGraphic("assets/images/poof.png", true, 16, 16);
		animation.add("play", [0, 1, 2, 3, 4, 5, 6, 7], 15, false);
		make_and_center_hitbox(0, 0);
		acceleration.y = -100;
	}
	
	function make_and_center_hitbox(_width:Float, _height:Float):Void
	{
		offset.set(width * 0.5 - _width * 0.5, height * 0.5 - _height * 0.5);
		setSize(_width, _height);
	}
	
	public function fire(_p:FlxPoint, _s:Int, _c:Int):Void
	{
		animation.play("play", true, false, 7 - _s);
		color = _c;
		setPosition(_p.x, _p.y);
		velocity.y = 0;
		exists = true;
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (animation.finished)
			kill();
		super.update(elapsed);
	}
	
}