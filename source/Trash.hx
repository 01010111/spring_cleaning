package ;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import zerolib.ZMath;

/**
 * ...
 * @author ...
 */
class Trash extends FlxSprite
{
	
	var timer:Int;
	
	public function new(_p:FlxPoint, _s:Int) 
	{
		super();
		setPosition(_p.x + ZMath.randomRange(0, 4), _p.y + ZMath.randomRange(0, 4));
		loadGraphic("assets/images/trash.png", true, 12, 12);
		make_and_center_hitbox(2, 2);
		animation.frameIndex = Math.floor(ZMath.clamp(_s, 0, 8));
		drag.set(200, 200);
	}
	
	function make_and_center_hitbox(_width:Float, _height:Float):Void
	{
		offset.set(width * 0.5 - _width * 0.5, height * 0.5 - _height * 0.5);
		setSize(_width, _height);
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (Math.abs(velocity.x) > 5 && Math.abs(velocity.y) > 5)
		{
			if (timer == 0)
			{
				PlayState.i.poofs.fire(getMidpoint(), ZMath.randomRangeInt(1, 5), Palettes.dirt_poofs[ZMath.randomRangeInt(0, 5)]);
				timer = ZMath.randomRangeInt(10, 20);
			}
			else
				timer--;
		}
		
		angle += velocity.x * 0.2;
		
		var d = ZMath.distance(getMidpoint(), PlayState.i.roomba.getMidpoint());
		if (d < PlayState.i.roomba.suck_power && PlayState.i.roomba.exists)
		{
			var _a = ZMath.velocityFromAngle(ZMath.angleBetween(getMidpoint(), PlayState.i.roomba.getMidpoint()), Math.pow(PlayState.i.roomba.suck_power - d, 2));
			acceleration.copyFrom(_a);
		}
		else acceleration.set();
		super.update(elapsed);
	}
	
}