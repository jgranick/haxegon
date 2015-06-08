import terrylib.*;

class Main {
	var leftdresseffect:Int;  // Current effect we're using for the left dress
	var rightdresseffect:Int; // Current effect we're using for the right dress
	var totaleffects:Int;     // Total number of effects
	
	var leftdressx:Float;     // X position of the left dress
	var leftdressy:Float;     // Y position of the left dress
	
	var rightdressx:Float;    // X position of the right dress
	var rightdressy:Float;    // Y position of the right dress
	
	var pulse:Int;            // A variable that counts from 0 to 20 and back.
	var pulsedir:String;      // Controls the direction of the pulse.
	
	// new() is a special function that is called on startup.
	function new() {
		Gfx.loadimage("leftdress");
		Gfx.loadimage("rightdress");
		
		leftdresseffect = 1;
		rightdresseffect = 1;
		totaleffects = 5;
		
		leftdressx = (Gfx.screenwidthmid / 2) - (Gfx.imagewidth("leftdress") / 2);
		leftdressy = Gfx.screenheightmid - (Gfx.imageheight("leftdress") / 2);
		rightdressx = Gfx.screenwidthmid + (Gfx.screenwidthmid / 2) - (Gfx.imagewidth("rightdress") / 2);
		rightdressy = Gfx.screenheightmid - (Gfx.imageheight("rightdress") / 2);
		
		pulse = 0;
		pulsedir = "up";
	}
	
  function update() {
		//If we click on the left side of the screen, change the left dress: 
		//Otherwise, change the right dress.
		if (Mouse.leftclick()) {
			if (Mouse.x < Gfx.screenwidthmid) {
				leftdresseffect = leftdresseffect + 1;
				if (leftdresseffect > totaleffects) leftdresseffect = 1;
			}else{
				rightdresseffect = rightdresseffect + 1;
				if (rightdresseffect > totaleffects) rightdresseffect = 1;
			}
		}
		
		//Change the value of "pulse" every frame.
		if (pulsedir == "up") {
			pulse++;
			if (pulse >= 20) pulsedir = "down";
		}else if (pulsedir == "down") {
			pulse--;
			if (pulse <= 0)	pulsedir = "up";
		}
		
		//Clear the screen
		Gfx.fillbox(0, 0, Gfx.screenwidthmid, Gfx.screenheight, Gfx.RGB(32, 64, 64));
		Gfx.fillbox(Gfx.screenwidthmid, 0, Gfx.screenwidthmid, Gfx.screenheight, Gfx.RGB(64, 32, 64));
		
		Text.changesize(24);
		//Draw the left dress
		if (leftdresseffect == 1) {
			Text.display(Gfx.screenwidthmid / 2, 40, "[SCALE x3]", 0xFFFFFF, { centeralign: true } );
			
			//Since the dress is drawn quite small, we scale it up x3 in each example.
			//xpivot and ypivot tell the code to center the dress when scaling.
			//If we left those values out, the dress would scale from the top left hand corner.
			Gfx.drawimage(leftdressx, leftdressy, "leftdress", { scale: 3, xpivot: Gfx.CENTER, ypivot: Gfx.CENTER });
		}else if (leftdresseffect == 2) {
		  Text.display(Gfx.screenwidthmid / 2, 40, "[SCALE x3, WITH ROTATION]", 0xFFFFFF, { centeralign: true } );
			
			Gfx.drawimage(leftdressx, leftdressy, "leftdress", { scale: 3, rotation: (pulse-10) * 4, xpivot: Gfx.CENTER, ypivot: Gfx.CENTER } );
		}else if (leftdresseffect == 3) {
		  Text.display(Gfx.screenwidthmid / 2, 40, "[DIFFERENT X AND Y SCALES]", 0xFFFFFF, { centeralign: true } );
			
			Gfx.drawimage(leftdressx, leftdressy, "leftdress", { xscale: 2 + (pulse/10), yscale: 4 - (pulse/10), xpivot: Gfx.CENTER, ypivot: Gfx.CENTER });
		}else if (leftdresseffect == 4) {
		  Text.display(Gfx.screenwidthmid / 2, 40, "[ALPHA TRANSPARANCY]", 0xFFFFFF, { centeralign: true } );
			
			Gfx.drawimage(leftdressx, leftdressy, "leftdress", { scale: 3, alpha: 1.0 - (pulse / 20), xpivot: Gfx.CENTER, ypivot: Gfx.CENTER } );
		}else if (leftdresseffect == 5) {
		  Text.display(Gfx.screenwidthmid / 2, 40, "[CHANGING GREEN MULTIPLER]", 0xFFFFFF, { centeralign: true } );
			
			Gfx.drawimage(leftdressx, leftdressy, "leftdress", { scale: 3, green: 1 + ((pulse - 10)/20), xpivot: Gfx.CENTER, ypivot: Gfx.CENTER});
		}
		
		//Draw the right dress, same as above
		if (rightdresseffect == 1) {
			Text.display(Gfx.screenwidthmid + (Gfx.screenwidthmid / 2), 40, "[SCALE x3]", 0xFFFFFF, { centeralign: true } );
			
			Gfx.drawimage(rightdressx, rightdressy, "rightdress", { scale: 3, xpivot: Gfx.CENTER, ypivot: Gfx.CENTER });
		}else if (rightdresseffect == 2) {
		  Text.display(Gfx.screenwidthmid + (Gfx.screenwidthmid / 2), 40, "[SCALE x3, WITH ROTATION]", 0xFFFFFF, { centeralign: true } );
			
			Gfx.drawimage(rightdressx, rightdressy, "rightdress", { scale: 3, rotation: (pulse-10) * 4, xpivot: Gfx.CENTER, ypivot: Gfx.CENTER } );
		}else if (rightdresseffect == 3) {
		  Text.display(Gfx.screenwidthmid + (Gfx.screenwidthmid / 2), 40, "[DIFFERENT X AND Y SCALES]", 0xFFFFFF, { centeralign: true } );
			
			Gfx.drawimage(rightdressx, rightdressy, "rightdress", { xscale: 2 + (pulse/10), yscale: 4 - (pulse/10), xpivot: Gfx.CENTER, ypivot: Gfx.CENTER });
		}else if (rightdresseffect == 4) {
		  Text.display(Gfx.screenwidthmid + (Gfx.screenwidthmid / 2), 40, "[ALPHA TRANSPARANCY]", 0xFFFFFF, { centeralign: true } );
			
			Gfx.drawimage(rightdressx, rightdressy, "rightdress", { scale: 3, alpha: 1.0 - (pulse / 20), xpivot: Gfx.CENTER, ypivot: Gfx.CENTER } );
		}else if (rightdresseffect == 5) {
		  Text.display(Gfx.screenwidthmid + (Gfx.screenwidthmid / 2), 40, "[CHANGING BLUE MULTIPLER]", 0xFFFFFF, { centeralign: true } );
			
			Gfx.drawimage(rightdressx, rightdressy, "rightdress", { scale: 3, blue: 1 + ((pulse - 10)/20), xpivot: Gfx.CENTER, ypivot: Gfx.CENTER});
		}
		
		Gfx.fillbox(0, Gfx.screenheight - 30, Gfx.screenwidth, 30, Gfx.RGB(64, 64, 64));
		
		Text.changesize(16);
		Text.display(Gfx.CENTER, Gfx.screenheight - Text.height() - 5, "CLICK ON A DRESS TO CHANGE EFFECTS", Col.WHITE);
  }
}