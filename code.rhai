if "tick" in memory == false {
        info("NOT SET");
        memory.tick = 0;
        
        memory.bajandoH0 = 1;
        memory.bajandoH2 = 0;
        memory.bajandoH3 = 1;
        memory.bajandoH5 = 1;
        
        memory.last7 = 0;
	memory.last6 = 3;
	memory.last5 = 0;
	memory.last4 = 0;
	memory.last3 = 0;
	memory.last2 = 4;
	memory.last1 = 3;
	memory.last0 = 4;
	memory.onVullAnarX = [0, 0, 0, 0, 0, 0, 0, 0];
	memory.onVullAnarY = [0, 0, 0, 0, 0, 0, 0, 0];
	
	memory.pos6x = worker(6).x;
	memory.pos6y = worker(6).y;
	memory.pos1x = worker(1).x;
	memory.pos1y = worker(1).x;

} else {
        memory.tick += 1;
}

      
let numberOfMyColor = 0;
let mycolor = worker(1).color;
if worker(1).color == Tile::RED {info("red")};
if worker(1).color == Tile::GREEN {info("green")};
if worker(1).color == Tile::YELLOW {info("yellow")};
if worker(1).color == Tile::BLUE {info("blue")};



for w in map.workers {
    
}
for x in 0..40 {
    for y in 0..40 {
        if map[x][y] == mycolor{
            numberOfMyColor = numberOfMyColor + 1;
        }
        // other logic
    }
}

fn pucAnar(x,myX,myY){
	let result = 0;
	for w in 0..x{
		if (myX == worker(w).x && myY == worker(w).y){
			result = 1;
		}
	}
	x = result;
	return x;
	info(`resultat info ${x}`);	
}


for w in 0..8 {
    
    let x = w;
    switch w {
    	0 => {
    		if (memory.bajandoH0 == 1){
	    		if (worker(w).x == 0){
	    			if (memory.last0 == 4){
	    				//acabo de llegar borde izq
	    				
	    				let z = pucAnar(x, worker(w).x, worker(w).y+1);
	    				if (z == 0){
	    					if (worker(w).y < 19){
	    						memory.bajandoH0 = 0;
	    					}
	    					else{
	    						worker(w).move_down();
	    						info("down");
	    						memory.last0 = 3;
	    						memory.onVullAnarX[w] = worker(w).x;
	    						memory.onVullAnarY[w] = worker(w).y+1;
	    					}
	    				}
	    			}
	    			else{
	    				//he bajado el borde izq
	    				let z = pucAnar(x, worker(w).x+1, worker(w).y);
	    				if (z == 0){
		    				worker(w).move_right();
		    				info("right");
			    			memory.last0 = 2;
			    			memory.onVullAnarX[w] = worker(w).x+1;
	    					memory.onVullAnarY[w] = worker(w).y;
			    		}
	    			}
	    		}
	    		else { 
	    			if (memory.last0 == 4){
					let z = pucAnar(x, worker(w).x-1, worker(w).y);
	    				if (z == 0){
	    					worker(w).move_left();
	    					info("left");
	    					memory.last0 = 4;
	    					memory.onVullAnarX[w] = worker(w).x-1;
	    					memory.onVullAnarY[w] = worker(w).y;
	    				}
	    			}
	    			else{
	    				if (worker(w).x <39){
						let z = pucAnar(x, worker(w).x+1, worker(w).y);
	    					if (z == 0){
	    						worker(w).move_right();
	    						info("right");
	    						memory.last0 = 2;
	    						memory.onVullAnarX[w] = worker(w).x+1;
	    						memory.onVullAnarY[w] = worker(w).y;
	    					}
	    				}
	    				else{
	    					if (memory.last0 == 2){
							let z = pucAnar(x, worker(w).x, worker(w).y+1);
	    						if (z == 0){
	    							if (worker(w).y < 19){
	    								memory.bajandoH0 = 0;
	    							}
	    							else{
		    							worker(w).move_down();
			    						info("down");
			    						memory.last0 = 3;
			    						memory.onVullAnarX[w] = worker(w).x;
		    							memory.onVullAnarY[w] = worker(w).y+1;
		    						}
		    					}
		    						
	    					}
	    					else {
	    						let z = pucAnar(x, worker(w).x-1, worker(w).y);
	    						if (z == 0){
		    						worker(w).move_left();
		    						info("left");
		    						memory.last0 = 4;
		    						memory.onVullAnarX[w] = worker(w).x-1;
	    							memory.onVullAnarY[w] = worker(w).y;
		    					}
		    					else{
		    					info("ERROOOOOOOOOOOOOOOOOOOR");
		    					}
	    					}
	    				}
	    			}
    			}
    		}
    		else{
    			//DE SUBIDA
    			if (worker(w).x == 0){
	    			if (memory.last0 == 4){
	    				//acabo de llegar borde izq
	    				
	    				let z = pucAnar(x, worker(w).x, worker(w).y+1);
	    				if (z == 0){
	    					if (worker(w).y >= 39){
	    						memory.bajandoH0 = 1;
	    					}
	    					else{
	    						worker(w).move_up();
	    						info("up");
	    						memory.last0 = 1;
	    						memory.onVullAnarX[w] = worker(w).x;
	    						memory.onVullAnarY[w] = worker(w).y-1;
	    					}
	    				}
	    			}
	    			else{
	    				//he bajado el borde izq
	    				let z = pucAnar(x, worker(w).x+1, worker(w).y);
	    				if (z == 0){
		    				worker(w).move_right();
		    				info("right");
			    			memory.last0 = 2;
			    			memory.onVullAnarX[w] = worker(w).x+1;
	    					memory.onVullAnarY[w] = worker(w).y;
			    		}
	    			}
	    		}
	    		else { 
	    			if (memory.last0 == 4){
					let z = pucAnar(x, worker(w).x-1, worker(w).y);
	    				if (z == 0){
	    					worker(w).move_left();
	    					info("left");
	    					memory.last0 = 4;
	    					memory.onVullAnarX[w] = worker(w).x-1;
	    					memory.onVullAnarY[w] = worker(w).y;
	    				}
	    			}
	    			else{
	    				if (worker(w).x <39){
						let z = pucAnar(x, worker(w).x+1, worker(w).y);
	    					if (z == 0){
	    						worker(w).move_right();
	    						info("right");
	    						memory.last0 = 2;
	    						memory.onVullAnarX[w] = worker(w).x+1;
	    						memory.onVullAnarY[w] = worker(w).y;
	    					}
	    				}
	    				else{
	    					if (memory.last0 == 2){
							let z = pucAnar(x, worker(w).x, worker(w).y-1);
	    						if (z == 0){
	    							if (worker(w).y >= 39){
	    								memory.bajandoH0 = 1;
	    							}
	    							else{
		    							worker(w).move_up();
			    						info("up");
			    						memory.last0 = 1;
			    						memory.onVullAnarX[w] = worker(w).x;
		    							memory.onVullAnarY[w] = worker(w).y-1;
		    						}
		    					}
		    						
	    					}
	    					else {
	    						let z = pucAnar(x, worker(w).x-1, worker(w).y);
	    						if (z == 0){
		    						worker(w).move_left();
		    						info("left");
		    						memory.last0 = 4;
		    						memory.onVullAnarX[w] = worker(w).x-1;
	    							memory.onVullAnarY[w] = worker(w).y;
		    					}
		    					else{
		    					info("ERROOOOOOOOOOOOOOOOOOOR");
		    					}
	    					}
	    				}
	    			}
    			}
    		}
    	
    	}
    	1 => {
		    	if memory.last1 == 1 { //he ido pa arriba
		if worker(1).x + 1 < 40 { //voy derecha
		    worker(1).move_right();
		   // info("de arriba a derecha");
		    if worker(1).x != memory.pos1x { 
		        memory.pos1x = worker(1).x;
		        memory.last1 = 2;
		    }
		}

		else { // voy arriba
		    worker(1).move_up();
		   // info("de arriba a arriba"); 
		    if worker(1).y != memory.pos1y { 
		        memory.pos1y = worker(1).y;
		        memory.last1 = 1;
		    }
		}
	    }

	    if memory.last1 == 2 { //he ido pa derecha
		if worker(1).y + 1 <= 39 { // voy arriba
		    worker(1).move_up();
		  //  info("de derecha a arriba");
		    if worker(1).y != memory.pos1y { 
		        memory.pos1y = worker(1).y;
		        memory.last1 = 1;
		    }
		}
		else { // voy izquierda
		    worker(1).move_left(); 
		  //  info("de derecha a izquierda");
		    if worker(1).x != memory.pos1x { 
		        memory.pos1x = worker(1).x;
		        memory.last1 = 4;
		    }
		}
	    }

	    if memory.last1 == 3 { //he ido abajo
		if worker(1).x - 1 >= 0 { //voy izquierda  
		    worker(1).move_left();
		 //   info("de abajo a izq");
		    if worker(1).x != memory.pos1x { 
		        memory.pos1x = worker(1).x;
		        memory.last1 = 4;
		    }
		}
		else { //voy arriba
		    worker(1).move_up();
		//    info("de abajo a arriba");
		    if worker(1).y != memory.pos1y { 
		        memory.pos1y = worker(1).y;
		        memory.last1 = 1;
		    }
		}
	    }
	    if memory.last1 == 4 { //he ido izquierda
		if worker(1).y - 1 >= 0 { //voy abajo
		    worker(1).move_down(); 
		//    info("de izquieda a abajo");
		    if worker(1).y != memory.pos1y { 
		        memory.pos1y = worker(1).y;
		        memory.last1 = 3;
		    }
		}
		else { //voy izquierda
		    worker(1).move_left();
		 //   info("de izq a izq");
		    if worker(1).x != memory.pos1x { 
		        memory.pos1x = worker(1).x;
		        memory.last1 = 4;
		    }
		}
	    }
    	}
    	2 => {
    		if (memory.bajandoH2 == 1){
	    		if (worker(w).x == 0){
	    			if (memory.last2 == 4){
	    				//acabo de llegar borde izq
	    				
	    				let z = pucAnar(x, worker(w).x, worker(w).y+1);
	    				if (z == 0){
	    					if (worker(w).y < 19){
	    						memory.bajandoH2 = 0;
	    					}
	    					else{
	    						worker(w).move_down();
	    						info("down");
	    						memory.last2 = 3;
	    						memory.onVullAnarX[w] = worker(w).x;
	    						memory.onVullAnarY[w] = worker(w).y+1;
	    					}
	    				}
	    			}
	    			else{
	    				//he bajado el borde izq
	    				let z = pucAnar(x, worker(w).x+1, worker(w).y);
	    				if (z == 0){
		    				worker(w).move_right();
		    				info("right");
			    			memory.last2 = 2;
			    			memory.onVullAnarX[w] = worker(w).x+1;
	    					memory.onVullAnarY[w] = worker(w).y;
			    		}
	    			}
	    		}
	    		else { 
	    			if (memory.last2 == 4){
					let z = pucAnar(x, worker(w).x-1, worker(w).y);
	    				if (z == 0){
	    					worker(w).move_left();
	    					info("left");
	    					memory.last2 = 4;
	    					memory.onVullAnarX[w] = worker(w).x-1;
	    					memory.onVullAnarY[w] = worker(w).y;
	    				}
	    			}
	    			else{
	    				if (worker(w).x <39){
						let z = pucAnar(x, worker(w).x+1, worker(w).y);
	    					if (z == 0){
	    						worker(w).move_right();
	    						info("right");
	    						memory.last2 = 2;
	    						memory.onVullAnarX[w] = worker(w).x+1;
	    						memory.onVullAnarY[w] = worker(w).y;
	    					}
	    				}
	    				else{
	    					if (memory.last2 == 2){
							let z = pucAnar(x, worker(w).x, worker(w).y+1);
	    						if (z == 0){
	    							if (worker(w).y < 19){
	    								memory.bajandoH2 = 0;
	    							}
	    							else{
		    							worker(w).move_down();
			    						info("down");
			    						memory.last2 = 3;
			    						memory.onVullAnarX[w] = worker(w).x;
		    							memory.onVullAnarY[w] = worker(w).y+1;
		    						}
		    					}
		    						
	    					}
	    					else {
	    						let z = pucAnar(x, worker(w).x-1, worker(w).y);
	    						if (z == 0){
		    						worker(w).move_left();
		    						info("left");
		    						memory.last2 = 4;
		    						memory.onVullAnarX[w] = worker(w).x-1;
	    							memory.onVullAnarY[w] = worker(w).y;
		    					}
		    					else{
		    					info("ERROOOOOOOOOOOOOOOOOOOR");
		    					}
	    					}
	    				}
	    			}
    			}
    		}
    		else{
    			//DE SUBIDA
    			if (worker(w).x == 0){
	    			if (memory.last2 == 4){
	    				//acabo de llegar borde izq
	    				
	    				let z = pucAnar(x, worker(w).x, worker(w).y+1);
	    				if (z == 0){
	    					if (worker(w).y >= 39){
	    						memory.bajandoH2 = 1;
	    					}
	    					else{
	    						worker(w).move_up();
	    						info("up");
	    						memory.last2 = 1;
	    						memory.onVullAnarX[w] = worker(w).x;
	    						memory.onVullAnarY[w] = worker(w).y-1;
	    					}
	    				}
	    			}
	    			else{
	    				//he bajado el borde izq
	    				let z = pucAnar(x, worker(w).x+1, worker(w).y);
	    				if (z == 0){
		    				worker(w).move_right();
		    				info("right");
			    			memory.last2 = 2;
			    			memory.onVullAnarX[w] = worker(w).x+1;
	    					memory.onVullAnarY[w] = worker(w).y;
			    		}
	    			}
	    		}
	    		else { 
	    			if (memory.last2 == 4){
					let z = pucAnar(x, worker(w).x-1, worker(w).y);
	    				if (z == 0){
	    					worker(w).move_left();
	    					info("left");
	    					memory.last2 = 4;
	    					memory.onVullAnarX[w] = worker(w).x-1;
	    					memory.onVullAnarY[w] = worker(w).y;
	    				}
	    			}
	    			else{
	    				if (worker(w).x <39){
						let z = pucAnar(x, worker(w).x+1, worker(w).y);
	    					if (z == 0){
	    						worker(w).move_right();
	    						info("right");
	    						memory.last2 = 2;
	    						memory.onVullAnarX[w] = worker(w).x+1;
	    						memory.onVullAnarY[w] = worker(w).y;
	    					}
	    				}
	    				else{
	    					if (memory.last2 == 2){
							let z = pucAnar(x, worker(w).x, worker(w).y-1);
	    						if (z == 0){
	    							if (worker(w).y >= 39){
	    								memory.bajandoH2 = 1;
	    							}
	    							else{
		    							worker(w).move_up();
			    						info("up");
			    						memory.last2 = 1;
			    						memory.onVullAnarX[w] = worker(w).x;
		    							memory.onVullAnarY[w] = worker(w).y-1;
		    						}
		    					}
		    						
	    					}
	    					else {
	    						let z = pucAnar(x, worker(w).x-1, worker(w).y);
	    						if (z == 0){
		    						worker(w).move_left();
		    						info("left");
		    						memory.last2 = 4;
		    						memory.onVullAnarX[w] = worker(w).x-1;
	    							memory.onVullAnarY[w] = worker(w).y;
		    					}
		    					else{
		    					info("ERROOOOOOOOOOOOOOOOOOOR");
		    					}
	    					}
	    				}
	    			}
    			}
    		}
    	}
    	3 => {
    		if worker(w).y > 19 {
    			worker(w).move_down();
    		}
    		else{
    			if (memory.bajandoH3 == 1){
	    		if (worker(w).x == 0){
	    			if (memory.last3 == 4){
	    				//acabo de llegar borde izq
	    				
	    				let z = pucAnar(x, worker(w).x, worker(w).y+1);
	    				if (z == 0){
	    					if (worker(w).y <= 10){
	    						memory.bajandoH3 = 0;
	    					}
	    					else{
	    						worker(w).move_down();
	    						info("down");
	    						memory.last3 = 3;
	    						memory.onVullAnarX[w] = worker(w).x;
	    						memory.onVullAnarY[w] = worker(w).y+1;
	    					}
	    				}
	    			}
	    			else{
	    				//he bajado el borde izq
	    				let z = pucAnar(x, worker(w).x+1, worker(w).y);
	    				if (z == 0){
		    				worker(w).move_right();
		    				info("right");
			    			memory.last3 = 2;
			    			memory.onVullAnarX[w] = worker(w).x+1;
	    					memory.onVullAnarY[w] = worker(w).y;
			    		}
	    			}
	    		}
	    		else { 
	    			if (memory.last3 == 4){
					let z = pucAnar(x, worker(w).x-1, worker(w).y);
	    				if (z == 0){
	    					worker(w).move_left();
	    					info("left");
	    					memory.last3 = 4;
	    					memory.onVullAnarX[w] = worker(w).x-1;
	    					memory.onVullAnarY[w] = worker(w).y;
	    				}
	    			}
	    			else{
	    				if (worker(w).x <39){
						let z = pucAnar(x, worker(w).x+1, worker(w).y);
	    					if (z == 0){
	    						worker(w).move_right();
	    						info("right");
	    						memory.last3 = 2;
	    						memory.onVullAnarX[w] = worker(w).x+1;
	    						memory.onVullAnarY[w] = worker(w).y;
	    					}
	    				}
	    				else{
	    					if (memory.last3 == 2){
							let z = pucAnar(x, worker(w).x, worker(w).y+1);
	    						if (z == 0){
	    							if (worker(w).y <= 10){
	    								memory.bajandoH3 = 0;
	    							}
	    							else{
		    							worker(w).move_down();
			    						info("down");
			    						memory.last3 = 3;
			    						memory.onVullAnarX[w] = worker(w).x;
		    							memory.onVullAnarY[w] = worker(w).y+1;
		    						}
		    					}
		    						
	    					}
	    					else {
	    						let z = pucAnar(x, worker(w).x-1, worker(w).y);
	    						if (z == 0){
		    						worker(w).move_left();
		    						info("left");
		    						memory.last3 = 4;
		    						memory.onVullAnarX[w] = worker(w).x-1;
	    							memory.onVullAnarY[w] = worker(w).y;
		    					}
		    					else{
		    					info("ERROOOOOOOOOOOOOOOOOOOR");
		    					}
	    					}
	    				}
	    			}
    			}
    		}
    		else{
    			//DE SUBIDA
    			if (worker(w).x == 0){
	    			if (memory.last3 == 4){
	    				//acabo de llegar borde izq
	    				
	    				let z = pucAnar(x, worker(w).x, worker(w).y+1);
	    				if (z == 0){
	    					if (worker(w).y >= 19){
	    						memory.bajandoH3 = 1;
	    					}
	    					else{
	    						worker(w).move_up();
	    						info("up");
	    						memory.last3 = 1;
	    						memory.onVullAnarX[w] = worker(w).x;
	    						memory.onVullAnarY[w] = worker(w).y-1;
	    					}
	    				}
	    			}
	    			else{
	    				//he bajado el borde izq
	    				let z = pucAnar(x, worker(w).x+1, worker(w).y);
	    				if (z == 0){
		    				worker(w).move_right();
		    				info("right");
			    			memory.last3 = 2;
			    			memory.onVullAnarX[w] = worker(w).x+1;
	    					memory.onVullAnarY[w] = worker(w).y;
			    		}
	    			}
	    		}
	    		else { 
	    			if (memory.last3 == 4){
					let z = pucAnar(x, worker(w).x-1, worker(w).y);
	    				if (z == 0){
	    					worker(w).move_left();
	    					info("left");
	    					memory.last3 = 4;
	    					memory.onVullAnarX[w] = worker(w).x-1;
	    					memory.onVullAnarY[w] = worker(w).y;
	    				}
	    			}
	    			else{
	    				if (worker(w).x <39){
						let z = pucAnar(x, worker(w).x+1, worker(w).y);
	    					if (z == 0){
	    						worker(w).move_right();
	    						info("right");
	    						memory.last3 = 2;
	    						memory.onVullAnarX[w] = worker(w).x+1;
	    						memory.onVullAnarY[w] = worker(w).y;
	    					}
	    				}
	    				else{
	    					if (memory.last3 == 2){
							let z = pucAnar(x, worker(w).x, worker(w).y-1);
	    						if (z == 0){
	    							if (worker(w).y >= 19){
	    								memory.bajandoH3 = 1;
	    							}
	    							else{
		    							worker(w).move_up();
			    						info("up");
			    						memory.last3 = 1;
			    						memory.onVullAnarX[w] = worker(w).x;
		    							memory.onVullAnarY[w] = worker(w).y-1;
		    						}
		    					}
		    						
	    					}
	    					else {
	    						let z = pucAnar(x, worker(w).x-1, worker(w).y);
	    						if (z == 0){
		    						worker(w).move_left();
		    						info("left");
		    						memory.last3 = 4;
		    						memory.onVullAnarX[w] = worker(w).x-1;
	    							memory.onVullAnarY[w] = worker(w).y;
		    					}
		    					else{
		    					info("ERROOOOOOOOOOOOOOOOOOOR");
		    					}
	    					}
	    				}
	    			}
    			}
    		}
    		}
    			
    	}
    	4 => {
    		  let r = (rand() % 4).abs();
		    switch r {
			0 => worker(w).move_up(),
			1 => worker(w).move_down(),
			2 => worker(w).move_right(),
			3 => worker(w).move_left(),
		    }
    	}
    	5 => {
    		if worker(w).y > 11 {
    			worker(w).move_down();
    			
    		}
    		else{
    			if (memory.bajandoH5 == 1){
	    		if (worker(w).x == 0){
	    			if (memory.last5 == 4){
	    				//acabo de llegar borde izq
	    				
	    				let z = pucAnar(x, worker(w).x, worker(w).y+1);
	    				if (z == 0){
	    					if (worker(w).y <= 0){
	    						memory.bajandoH5 = 0;
	    					}
	    					else{
	    						worker(w).move_down();
	    						info("down");
	    						memory.last5 = 3;
	    						memory.onVullAnarX[w] = worker(w).x;
	    						memory.onVullAnarY[w] = worker(w).y+1;
	    					}
	    				}
	    			}
	    			else{
	    				//he bajado el borde izq
	    				let z = pucAnar(x, worker(w).x+1, worker(w).y);
	    				if (z == 0){
		    				worker(w).move_right();
		    				info("right");
			    			memory.last5 = 2;
			    			memory.onVullAnarX[w] = worker(w).x+1;
	    					memory.onVullAnarY[w] = worker(w).y;
			    		}
	    			}
	    		}
	    		else { 
	    			if (memory.last5 == 4){
					let z = pucAnar(x, worker(w).x-1, worker(w).y);
	    				if (z == 0){
	    					worker(w).move_left();
	    					info("left");
	    					memory.last5 = 4;
	    					memory.onVullAnarX[w] = worker(w).x-1;
	    					memory.onVullAnarY[w] = worker(w).y;
	    				}
	    			}
	    			else{
	    				if (worker(w).x <39){
						let z = pucAnar(x, worker(w).x+1, worker(w).y);
	    					if (z == 0){
	    						worker(w).move_right();
	    						info("right");
	    						memory.last5 = 2;
	    						memory.onVullAnarX[w] = worker(w).x+1;
	    						memory.onVullAnarY[w] = worker(w).y;
	    					}
	    				}
	    				else{
	    					if (memory.last5 == 2){
							let z = pucAnar(x, worker(w).x, worker(w).y+1);
	    						if (z == 0){
	    							if (worker(w).y <= 0){
	    								memory.bajandoH3 = 0;
	    							}
	    							else{
		    							worker(w).move_down();
			    						info("down");
			    						memory.last5 = 3;
			    						memory.onVullAnarX[w] = worker(w).x;
		    							memory.onVullAnarY[w] = worker(w).y+1;
		    						}
		    					}
		    						
	    					}
	    					else {
	    						let z = pucAnar(x, worker(w).x-1, worker(w).y);
	    						if (z == 0){
		    						worker(w).move_left();
		    						info("left");
		    						memory.last5 = 4;
		    						memory.onVullAnarX[w] = worker(w).x-1;
	    							memory.onVullAnarY[w] = worker(w).y;
		    					}
		    					else{
		    					info("ERROOOOOOOOOOOOOOOOOOOR");
		    					}
	    					}
	    				}
	    			}
    			}
    		}
    		else{
    			//DE SUBIDA
    			if (worker(w).x == 0){
	    			if (memory.last5 == 4){
	    				//acabo de llegar borde izq
	    				
	    				let z = pucAnar(x, worker(w).x, worker(w).y+1);
	    				if (z == 0){
	    					if (worker(w).y >= 9){
	    						memory.bajandoH5 = 1;
	    					}
	    					else{
	    						worker(w).move_up();
	    						info("up");
	    						memory.last5 = 1;
	    						memory.onVullAnarX[w] = worker(w).x;
	    						memory.onVullAnarY[w] = worker(w).y-1;
	    					}
	    				}
	    			}
	    			else{
	    				//he bajado el borde izq
	    				let z = pucAnar(x, worker(w).x+1, worker(w).y);
	    				if (z == 0){
		    				worker(w).move_right();
		    				info("right");
			    			memory.last5 = 2;
			    			memory.onVullAnarX[w] = worker(w).x+1;
	    					memory.onVullAnarY[w] = worker(w).y;
			    		}
	    			}
	    		}
	    		else { 
	    			if (memory.last5 == 4){
					let z = pucAnar(x, worker(w).x-1, worker(w).y);
	    				if (z == 0){
	    					worker(w).move_left();
	    					info("left");
	    					memory.last5 = 4;
	    					memory.onVullAnarX[w] = worker(w).x-1;
	    					memory.onVullAnarY[w] = worker(w).y;
	    				}
	    			}
	    			else{
	    				if (worker(w).x <39){
						let z = pucAnar(x, worker(w).x+1, worker(w).y);
	    					if (z == 0){
	    						worker(w).move_right();
	    						info("right");
	    						memory.last5 = 2;
	    						memory.onVullAnarX[w] = worker(w).x+1;
	    						memory.onVullAnarY[w] = worker(w).y;
	    					}
	    				}
	    				else{
	    					if (memory.last5 == 2){
							let z = pucAnar(x, worker(w).x, worker(w).y-1);
	    						if (z == 0){
	    							if (worker(w).y >= 9){
	    								memory.bajandoH5 = 1;
	    							}
	    							else{
		    							worker(w).move_up();
			    						info("up");
			    						memory.last5 = 1;
			    						memory.onVullAnarX[w] = worker(w).x;
		    							memory.onVullAnarY[w] = worker(w).y-1;
		    						}
		    					}
		    						
	    					}
	    					else {
	    						let z = pucAnar(x, worker(w).x-1, worker(w).y);
	    						if (z == 0){
		    						worker(w).move_left();
		    						info("left");
		    						memory.last5 = 4;
		    						memory.onVullAnarX[w] = worker(w).x-1;
	    							memory.onVullAnarY[w] = worker(w).y;
		    					}
		    					else{
		    					info("ERROOOOOOOOOOOOOOOOOOOR");
		    					}
	    					}
	    				}
	    			}
    			}
    		}
    		}
    	}
    	6 => {
    		if memory.last6 == 1 { //he ido pa arriba
		if worker(6).x + 1 < 40 { //voy derecha
		    worker(6).move_right();
		    info("de arriba a derecha");
		    if worker(6).x != memory.pos6x { 
		        memory.pos6x = worker(6).x;
		        memory.last6 = 2;
		    }
		}

		else { // voy abajo
		    worker(6).move_down();
		    info("de arriba a abajo"); 
		    if worker(6).y != memory.pos6y { 
		        memory.pos6y = worker(6).y;
		        memory.last6 = 3;
		    }
		}
	    }

	    if memory.last6 == 2 { //he ido pa derecha
		if worker(6).y + 1 <= 39 { // voy arriba
		    worker(6).move_up();
		    info("de derecha a arriba");
		    if worker(6).y != memory.pos6y { 
		        memory.pos6y = worker(6).y;
		        memory.last6 = 1;
		    }
		}
		else { // voy izquierda
		    worker(6).move_left(); 
		    info("de derecha a izquierda");
		    if worker(6).x != memory.pos6x { 
		        memory.pos6x = worker(6).x;
		        memory.last6 = 4;
		    }
		}
	    }

	    if memory.last6 == 3 { //he ido abajo
		if worker(6).x - 1 >= 0 { //voy izquierda  
		    worker(6).move_left();
		    info("de abajo a izq");
		    if worker(6).x != memory.pos6x { 
		        memory.pos6x = worker(6).x;
		        memory.last6 = 4;
		    }
		}
		else { //voy arriba
		    worker(6).move_up();
		    info("de abajo a arriba");
		    if worker(6).y != memory.pos6y { 
		        memory.pos6y = worker(6).y;
		        memory.last6 = 1;
		    }
		}
	    }
	    if memory.last6 == 4 { //he ido izquierda
		if worker(6).y - 1 >= 0 { //voy abajo
		    worker(6).move_down(); 
		    info("de izquieda a abajo");
		    if worker(6).y != memory.pos6y { 
		        memory.pos6y = worker(6).y;
		        memory.last6 = 3;
		    }
		}
		else { //voy derecha
		    worker(6).move_right();
		    info("de izq a derecha");
		    if worker(6).x != memory.pos6x { 
		        memory.pos6x = worker(6).x;
		        memory.last6 = 2;
		    }
		}
	    }
    	}
    	7 => {
    		  let r = (rand() % 4).abs();
		    switch r {
			0 => worker(w).move_up(),
			1 => worker(w).move_down(),
			2 => worker(w).move_right(),
			3 => worker(w).move_left(),
		    }
    	}
    }
   
  }
