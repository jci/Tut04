package scenes;
 
import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Text;
import com.haxepunk.Entity;
import resources.Score;
import com.haxepunk.graphics.Tilemap;
import com.haxepunk.graphics.Backdrop;

class GameScene extends Scene
{
    public function new()
    {
	
        super();

//	backdrop = new Backdrop("graphics/tile.png");
//	addGraphic(backdrop,20);

	overlayText = new Text("SCORE : 0",0,0);
	overlayText.resizable = true;
	overlayText.scrollX = overlayText.scrollY = 1;
	var overlay:Entity = new Entity(0,HXP.screen.height-60,overlayText);
	overlay.layer = 0;
	add(overlay);

	resources.Score.resetScore();

    }
 
    public override function begin()
    {
        add(new entities.Ship(180, HXP.halfHeight));
        spawn(); 
    }
 
    public override function update()
    {

	overlayText.text = "SCORE : " + resources.Score.POINTS ;

//	backdrop.x -= 0.5;

        spawnTimer -= HXP.elapsed;
        if (spawnTimer < 0)
        {
            spawn();
        }
        super.update();
    }
 
    private function spawn()
    {
        var y = Math.random() * HXP.height;
	if (!resources.Score.death)
	{
		add(new entities.Enemy(HXP.width, y));
        	spawnTimer = 0.2; 
	}
    }



    private var spawnTimer:Float; 
    private var overlayText:Text;
    private var theScore:Int;
    private var backdrop:Backdrop;

}
