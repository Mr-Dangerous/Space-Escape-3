///@param card_type
var level = player_level

var level_array = array_create(5, 0)

//returns the breakpoint numbers

if (argument0 = card_type.frame){
	switch(level){
		case 1:
			level_array[0] = 0 //800%
			level_array[1] = 80 //20%
			level_array[2] = 101 //0%

		break;
		case 2:
			level_array[0] = 0 //75%
			level_array[1] = 75 // 25%
			level_array[2] = 101 //0%

		break;
		case 3:
			level_array[0] = 0 //69%
			level_array[1] = 69 // 30%
			level_array[2] = 99 //1%

		break;
		case 4:
			level_array[0] = 0 //64%
			level_array[1] = 64 // 33%
			level_array[2] = 97 //3%

		break;
	
		case 5:
			level_array[0] = 0 //57%
			level_array[1] = 57 // 38%
			level_array[2] = 95 //5%

		break;
	
		case 6:
			level_array[0] = 0 //50%
			level_array[1] = 50 // 40%
			level_array[2] = 90 //10%

		break;
	
		case 7:
			level_array[0] = 0 //44%
			level_array[1] = 44 // 41%
			level_array[2] = 85 //15%

		break;
	
		case 8:
			level_array[0] = 0//41%
			level_array[1] = 41 // 41%
			level_array[2] = 82 //18%

		break;
	
		case 9:
			level_array[0] = 0//36%
			level_array[1] = 36 // 37%
			level_array[2] = 75 //25%

		break;
		
	}
}

if (argument0 = card_type.module){
	switch(level){
		case 1:
			level_array[0] = 0 //70%
			level_array[1] = 70 //25%
			level_array[2] = 95 //5%
			level_array[3] = 101 //fuctionally impossible
			level_array[4] = 101 //functinoally impossible

		break;
		case 2:
			level_array[0] = 0 //55%
			level_array[1] = 55 // 32%
			level_array[2] = 87 //10%
			level_array[3] =  97//3%
			level_array[4] = 101 //functinoally impossible

		break;
		case 3:
			level_array[0] = 0 //48%
			level_array[1] = 48 // 35%
			level_array[2] = 83 //12%
			level_array[3] =  95//5%
			level_array[4] = 101 //0%

		break;
		case 4:
			level_array[0] = 0 //41%
			level_array[1] = 41 // 35%
			level_array[2] = 76 //15%
			level_array[3] =  91//8%
			level_array[4] = 99 //1%

		break;
	
		case 5:
			level_array[0] = 0 //32%
			level_array[1] = 32 // 36%
			level_array[2] = 68 //18%
			level_array[3] =  86//11%
			level_array[4] = 97 //3%

		break;
	
		case 6:
			level_array[0] = 0 //28%
			level_array[1] = 28 // 32%
			level_array[2] = 60 //21%
			level_array[3] = 81//14%%
			level_array[4] = 95 //5%

		break;
	
		case 7:
			level_array[0] = 0 //24%
			level_array[1] = 24 // 27%
			level_array[2] = 52 //24%
			level_array[3] = 76//17%
			level_array[4] = 92 //8%
		break;
	
		case 8:
			level_array[0] = 0//18%
			level_array[1] = 18 // 22%
			level_array[2] = 40 //29%
			level_array[3] = 69//20%
			level_array[4] = 89 //11%
		break;
	
		case 9:
			level_array[0] = 0//10%
			level_array[1] = 10 // 18%
			level_array[2] = 38 //33%
			level_array[3] = 71//25%
			level_array[4] = 86 //14%
		break;
		
	}
}

var random_seed = irandom(99)
var card_level
for (var i = 0; i < 5; i++){
	if (level_array[i] < random_seed) card_level = i + 1
}
return card_level//card_level