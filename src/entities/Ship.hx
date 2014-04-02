package entities;
 
import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;


 
class Ship extends Entity
{
    public function new(x:Float, y:Float)
    {
        super(x, y);
 
        //graphic = Image.createRect(32, 32, 0xDDEEFF);
	graphic = new Image("graphics/PlayerShipImage.png");
        setHitbox(32, 32);
 
        Input.define("up", [Key.UP, Key.W]);
        Input.define("down", [Key.DOWN, Key.S]);
        Input.define("shoot", [Key.RIGHT, Key.X]);


	//
 
        velocity = 0;
        type = "player";
    }
 
    private function handleInput()
    {
        acceleration = 0;
	
	// keyboard events

 
        if (Input.check("up"))
        {
            acceleration = -1;
        }
 
        if (Input.check("down"))
        {
            acceleration = 1;
        }
	
	if (Input.pressed("shoot"))
	{
    	    scene.add(new Bullet(x + width, y + height / 2));
	}

	if (Input.mouseDown)
	{
		//HXP.console.log([Input.mouseX , " " , Input.mouseY]);
		//trace("mouseX" + Input.mouseX);
		//trace("mouseY" + Input.mouseY);

		// let's see where it is

		var _mouseX = Input.mouseX;
		var _mouseY = Input.mouseY;

		var _middle = HXP.screen.height/2;
		var _ending = HXP.screen.width*0.75;

		if ((_mouseY >0) && (_mouseY<_middle) && (_mouseX>0) && (_mouseX<200))
		{
			acceleration = -1;
		}

		if ((_mouseY > _middle) && (_mouseX>0) && (_mouseX<200))
		{
			acceleration = 1;
		}

//		return;
	}

	if (Input.mousePressed)
	{
		var _mouseX = Input.mouseX;
		var _ending = HXP.screen.width*0.75;

		if ((_mouseX>_ending))
		{
			scene.add(new Bullet(x+width,y+height/2));
		}

	}
	
    }
 
    private function move()
    {
        velocity += acceleration * speed;
        if (Math.abs(velocity) > maxVelocity)
        {
            velocity = maxVelocity * HXP.sign(velocity);
        }
 
        if (velocity < 0)
        {
            velocity = Math.min(velocity + drag, 0);
        }
        else if (velocity > 0)
        {
            velocity = Math.max(velocity - drag, 0);
        }

	if (y<5)
	{
		y=0;
		return;
	}

	if (y+64>HXP.screen.height)
	{
		y=HXP.screen.height-64;  
		return;
	}

//	HXP.console.log([y]);
    }
 
    public override function update()
    {
        handleInput();
        move();
        moveBy(0, velocity);
        super.update();
    }
 
    private var velocity:Float;
    private var acceleration:Float;
 
    private static inline var maxVelocity:Float = 8;
    private static inline var speed:Float = 3;
    private static inline var drag:Float = 0.4;

    private var _enemy:Enemy;
}
