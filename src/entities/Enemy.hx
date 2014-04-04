package entities;
 
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import scenes.GameScene;
import haxe.Timer; 
import entities.Bullet;
import entities.Ship;
import entities.Particles;

class Enemy extends Entity
{
    public function new(x:Float, y:Float)
    {
        super(x, y);

 		image = new Image("graphics/ramio_jump.png");
		image.scale = 2;
		graphic = image;
        setHitbox(32, 32);
        type = "enemy";
    }
 
    public override function moveCollideX(e:Entity)
    {
		var count = 0;
		var whatcrashed = "";

		
		whatcrashed = e.toString();

		if (whatcrashed=="entities.Ship")
			{

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
				HXP.world.recycle(e);
				var emitter = new ParticleController();
				scene.add(emitter);
				emitter.explosion(x,y);
				return true;
				
			}
		if (whatcrashed=="entities.Bullet")
			{
				var emitter = new ParticleController();
				HXP.console.log(["emiter in ",x,"-" , y]);
				scene.add(emitter);
				emitter.explosion(x,y);
				HXP.world.recycle(e);
				HXP.world.recycle(this);
				resources.Score.addKill();
				return true;	
			}

		
		return true;
    }
 
    public override function update()
    {
				
        moveBy(-2.5, 0, "player");
		moveBy(-2.5, 0, "bullet");
			
		if (x == -30)
			{
				HXP.world.recycle(this);
			}

		super.update();
    }

	
    var mytimer:haxe.Timer;
    private var image:Image;

	public function vanish()
	{
		HXP.console.log(["bye bye"]);
	}
	
		
}
