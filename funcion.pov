#include "colors.inc" //Para incluir nombres de colores
#include "textures.inc"


//Radio de la esfera
#declare radio=.5;
#declare ang=10*clock;
//Valor de la altura
#declare valor=sin(ang);
//Avance del eje x     
#declare avance=cos(ang);

//--------------------------------------------------------------------------------
//Cámara
//Me permite colocar una cámara y aputarla a una localización específica.
camera{
    //Dónde se encuentra la cámara con coordenadas <x,y,z>
    location <pi/2,1,-8>
    //A donde apunta con coordenadas <x,y,z>
    look_at <pi/2,0,0>
    }

//Fuente de luz
  light_source {
    <2, 10, -8>
    color White
    area_light <5, 0, 0>, <0, 0, 5>, 5, 5
    adaptive 1
    jitter
  }
 //plano y    
  plane {
    y, -8
   	texture {
   	pigment{    image_map { jpeg "pasto.jpg"}  }
    finish { ambient 0.3 diffuse 0.6 }
    scale <.00001,1000,.01>
    }	
}	    

  //Plano z
  plane {
    z, 10
    pigment{  FBM_Clouds  }
 } 
  plane {
    z, 11
    pigment{  color SlateBlue  }
 }
  
  //Plano 
  plane {
    x, -10
    texture {
	    pigment{
		    color rgb<1,1,1>
	    }
      finish {
        diffuse 0.4
        ambient 0.2
        phong 1
        phong_size 100
        reflection 0.25
      }
    }
  }
 


//----------------------------------------------------------------------------------  
//Esfera
sphere{
    //Localización y radio
    <1-avance,valor,0>, radio
    //Textura de la esfera
    texture{
	//Solo se usa pigmento    
        pigment{
	    //Color en RGB y transparencia del color
            color rgb<0,clock,1>
        }
	//El acabado final y representa una propiedad de la reflexión de la luz
        finish{
            phong 1         
        }   
    }
}
