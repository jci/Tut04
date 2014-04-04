package entities;
 
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.Sfx;
import com.haxepunk.HXP; 
import com.haxepunk.Scene;
import scenes.GameScene;
import entities.Enemy;
import resources.Score;

class Bullet extends Entity
{
    public function new(x:Float, y:Float)
    {
        super(x, y);
 
        image = new Image("graphics/bullet.png");
		graphic = image;
        setHitbox(8, 4);
        type = "bullet";
		var sfx = new Sfx("sfx/pewpew.wav");
		sfx.play(0.8);

    }
 


    public override function update()
    {
        moveBy(20, 0, "enemy");
		
		if (x > HXP.width+10)
			{
				HXP.world.recycle(this);
			}
		
        super.update();
    }

    private var _gameScene:GameScene;
	private var image:Image;
}
