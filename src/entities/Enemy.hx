package entities;
 
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import scenes.GameScene;
import haxe.Timer; 

class Enemy extends Entity
{
    public function new(x:Float, y:Float)
    {
        super(x, y);

        //graphic = Image.createRect(32, 32);
	image = new Image("graphics/ramio_jump.png");
	image.scale = 2;
	graphic = image;
	//graphic.scale = 32;
        setHitbox(32, 32);
        type = "enemy";
    }
 
    public override function moveCollideX(e:Entity)
    {
	var count = 0;
        scene.remove(e);
        scene.remove(this);
	mytimer = new haxe.Timer(100);
	resources.Score.death = true;
	mytimer.run = function():Void
	{
		count++;

		if (count==30)
		{
	
			mytimer.stop();
			resources.Score.death = false;
			HXP.scene = new scenes.GameScene();
			
		}
			
	};

	
	return true;
    }
 
    public override function update()
    {
        moveBy(-5, 0, "player");
        super.update();
	if (x == -30)
	{
		scene.remove(this);
	}
    }
    var mytimer:haxe.Timer;
    private var image:Image;
}