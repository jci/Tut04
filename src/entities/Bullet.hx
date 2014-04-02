package entities;
 
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.Sfx;
import com.haxepunk.HXP; 
import com.haxepunk.Scene;
import scenes.GameScene;
import resources.Score;

class Bullet extends Entity
{
    public function new(x:Float, y:Float)
    {
        super(x, y);
 
        graphic = Image.createRect(16, 4);
        setHitbox(16, 4);
        type = "bullet";

	var sfx = new Sfx("sfx/pewpew.wav");
	sfx.play(0.8);

	
	
    }
 
    public override function moveCollideX(e:Entity)
    {
	HXP.world.recycle(e);
	HXP.world.recycle(this);
	if (e.toString()=="entities.Enemy")
	{
//		HXP.console.log(["hooray vato"]);
		resources.Score.addKill();
	} 
        return true;
    }

    public override function update()
    {
        moveBy(20, 0, "enemy");
	if (x > HXP.width)
	{
		// 
		HXP.console.log(["out of screen"]);
		HXP.world.recycle(this);
	} 
        super.update();
    }

    
    private var _gameScene:GameScene;
}
