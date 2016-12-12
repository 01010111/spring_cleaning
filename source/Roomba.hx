package ;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxPoint;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
//import states.PlayState;
//import util.GSprite;
//import util.Palettes;
import zerolib.ZMath;

/**
 * ...
 * @author ...
 */
class Roomba extends FlxSprite
{
	
	var angol:Float = 90;
	public var suck_power:Float = 32;
	var start:FlxPoint;
	public var trash:Int = 0;
	var can_move:Bool = true;
	
	public function new() 
	{
		super(34,50);
		loadGraphic("assets/images/roomba.png", true, 15, 14);
		make_anchored_hitbox(13, 10);
		drag.set(400, 400);
		maxVelocity.set(15, 15);
		elasticity = 0.8;
		//PlayState.i.objects.add(this);
	}
	
	function make_anchored_hitbox(_width:Float, _height:Float):Void
	{
		offset.set(width * 0.5 - _width * 0.5, height - _height);
		setSize(_width, _height);
	}
	
	var angle_change:Int = 0;
	var angle_delta:Float = 0;
	var timer:Int;
	
	override public function update(elapsed:Float):Void 
	{
		if (can_move)
		{
			if (trash >= 32 && ZMath.distance(getMidpoint(), FlxPoint.get(40, 56)) < 4)
			{
				//velocity.set();
				acceleration.set();
				can_move = false;
				exit_stage();
			}
			else
				move();
		}
		super.update(elapsed);
	}
	
	function move():Void
	{
		angol = ZMath.toRelativeAngle(angol);
		
		angle_change = 0;
		if (FlxG.keys.pressed.LEFT)
			angle_change--;
		if (FlxG.keys.pressed.RIGHT)
			angle_change++;
		
		if (angle_change == 0)
			angle_delta = 0;
		else 
			angle_delta = ZMath.clamp(angle_delta += angle_change, -6, 6);
		
		angol += angle_delta;
		
		animation.frameIndex = Math.floor(ZMath.clamp(angol / (360 / 14), 0, 13));
		
		var _a = FlxPoint.get();
		if (FlxG.keys.pressed.UP)
			_a = ZMath.velocityFromAngle(angol, 800);
		if (FlxG.keys.pressed.DOWN)
			_a = ZMath.velocityFromAngle(angol + 180, 800);
		
		if (FlxG.keys.anyPressed([FlxKey.UP, FlxKey.DOWN]))
		{
			if (timer == 0)
			{
				FlxG.sound.play("squu" + ZMath.randomRangeInt(0, 4), ZMath.randomRange(0.05, 0.15));
				PlayState.i.poofs.fire(ZMath.placeOnCircle(getMidpoint(), angol + 180, 8), ZMath.randomRangeInt(3, 6), Palettes.elec_poofs[ZMath.randomRangeInt(0, 1)]);
				timer = ZMath.randomRangeInt(6, 16);
			}
			else
				timer--;
		}
		
		acceleration.set(_a.x, _a.y);
	}
	
	function exit_stage():Void
	{
		PlayState.i.go_to_next_day();
	}
	
}