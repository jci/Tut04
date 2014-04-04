package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Emitter;
import com.haxepunk.utils.Ease;
import com.haxepunk.HXP;
import flash.display.BitmapData;
import constants.GC;

class ParticleController extends Entity
{
	private var _emitter:Emitter;

	public function new()
	{
		super(x,y);
		_emitter = new Emitter(new BitmapData(3,3,false,0xFFFFFF),3,3);
		_emitter.newType("explosion",[0]);
		_emitter.setMotion("explosion",0,100,2,360,-40,2,Ease.quadOut);
		_emitter.setAlpha("explosion",1,0.1);
		_emitter.setGravity("explosion",5,1);
		graphic = _emitter;
		layer = GC.LAYER_PARTICLES;

		HXP.console.log(["new particle appears"]);
	}

	public function explosion(_x:Float, _y:Float)
	{
		var i:Int;
		var d:Int;
		for (i in 0...20)
			{
				_emitter.emit("explosion",_x,_y);
			}

	}
}