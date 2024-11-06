shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}
uniform vec4 flash_color : source_color = vec4(1.0);
uniform float degree :  hint_range(0,100) = 100;

void fragment() {
	float pct = degree / 100.0;
  vec4 color = texture(TEXTURE, UV);
  color.rgb = mix(color.rgb, flash_color.rgb, pct);
  COLOR = color;
}
//void fragment() {
	//// Called for every pixel the material is visible on.
	////vec4 color = vec4(UV,0,1);
	////COLOR = color;
	//
  ////COLOR = texture(TEXTURE, UV);
  ////COLOR.b = 1.0; // On met la composante bleue à 1.0
//
 //vec4 color = texture(TEXTURE, UV); // Récupère la texture du pixel à la position UV
  //color.rgb = mix(color.rgb, vec3(1, 1, 1).rgb, 1); // On met la couleur à blanc
  //COLOR = color;
//}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
