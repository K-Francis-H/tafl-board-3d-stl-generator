module tafl(size, baseSize, railSize, numSquares){//size in mm
    echo("generating board of size: ", size, " units with ", numSquares, " squares");
    
    //generate base
    cube(size=[size, size, baseSize], center=true);
    
    //generate the cross hatches
    for(i = [0:numSquares]){
        //figure out translation
        crossHatch(size, baseSize, railSize, numSquares, i);
        rotate([0,0,90]){
            crossHatch(size, baseSize, railSize, numSquares, i);
        }
    }
}

module crossHatch(size, baseSize, railSize, numSquares, i){
    remainingSize = size -  baseSize;
    translate([
            -size/2,
            //size / numSquares * i - size/2 + 0.1, //have to add the line thickness (0.1)
            remainingSize / numSquares * i - size/2,
            0
        ]){
            cube(size=[size, baseSize, railSize], center=false);
        }
}

//generators for special colored squares
module squareFill(size, numSquares, borderThickness, railSize){
    echo("square fill x/y: ", size / numSquares - borderThickness -0.25)
    echo("square fill z: ", railSize - borderThickness/2);
    cube([
        size / numSquares - borderThickness -1,
        size / numSquares - borderThickness -1,
        railSize - borderThickness/2
    ], center=true);
}

//generators
module brandubh(size, baseSize, railSize){
    echo("8 attackers");
    echo("4 defenders, 1 king");
    tafl(size, baseSize, railSize, 7);
}

module gwddbwyll(size, baseSize, railSize){
    echo("8 attackers");
    echo("4 defenders, 1 king");
    tafl(size, baseSize, railSize, 7);
}

module fidchell(size, baseSize, railSize){
    echo("16 attackers");
    echo("8 defenders, 1 king");
    tafl(size, baseSize, railSize, 7);
}

module ardRi(size, baseSize, railSize){
    echo("16 attackers");
    echo("8 defenders, 1 king");
    tafl(size, baseSize, railSize, 7);
}

module tablut(size, baseSize, railSize){
    echo("16 attackers");
    echo("8 defenders, 1 king");
    tafl(size, baseSize, railSize, 9);
}

module tawlbwrdd(size, baseSize, railSize){
    echo("24 attackers");
    echo("12 defenders, 1 king");
    tafl(size, baseSize, railSize, 11);
}

module hnefatafl(size, baseSize, railSize){
    echo("24 attackers");
    echo("12 defenders, 1 king");
    tafl(size, baseSize, railSize, 11);
}

module largeHnefatafl(size, baseSize, railSize){
    echo("24 attackers");
    echo("12 defenders, 1 king");
    tafl(size, baseSize, railSize, 13);
}

module aleaEvangelii(size, baseSize, railSize){
    echo("48 attackers");
    echo("24 defenders, 1 king");
    tafl(size, baseSize, railSize, 19);
}


translate([0,0,2.5]){
    squareFill(177.8,7,2.5,3.5);
}
//brandubh(177.8, 2.5, 3.5);

