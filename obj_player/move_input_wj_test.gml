// Player's input

key_right = keyboard_check(vk_right); // définis la var key_right qui correspond à "pression -> flèche de droite"
key_left = -keyboard_check(vk_left); // Définis la var key_left qui correspond à "pression -> flèche de gauche" (-keyboard pour avoir -1 et 0, à la place de 1 et 0)
key_jump = keyboard_check_pressed(vk_space); // Définis la var key_jump qui correspond à "si touche espace appuyé -> espace"


// Input's reaction

move = key_right + key_left; // Définis les variables de déplacements que le joueur utilisera
hsp =   move * movespeed; // Formule permettant le déplacement du joueur (si key_right (flèche de droite) est appuyé, alors sa valeur vaut 1. Donc : 1 * movespeed (ex: 13) = 13, cela va permettre au joueur de se déplacer
if (vsp < 10) vsp += grav; // Permet de déterminer une acceleration de la chute sans la rendre infinie. Un check va être effectué à chaque frame pour savoir si la vitesse de chute n'est pas supérieur à 10 pxl par seconde, si elle est inferieur elle peut augmenter

if (place_meeting(x,y+1,obj_wall1)) // Si obj_player detecte obj_wall1 à sa position x (horizontale) et un pixel en dessous de lui (y+1 = 1 pixel vers le bas)
{
  vsp = key_jump * -jumpspeed // Alors le joueur est bien sur le sol et peut utiliser la fonction "Saut"
}


// Horizontal Collision

if (place_meeting(x+hsp,y,obj_wall1)) // Si obj_player rencontre horizontalement obj_wall1 si la fonction hsp (mouvement horizontale) est utilisé
{
  while(!place_meeting(x+sign(hsp),y,obj_wall1)) // Loop ; tant que obj_player ne rencontre pas de collison calculé 1 px par 1 px à gauche ou à droite (dépend du signe de hsp) d'ou x+sign (définis si obj_player va à gauche ou a droite)
  {
    x+= sign(hsp); // Récupère le status de hsp (1 ou -1, pour gauche ou droite)
  }
  hsp = 0; // Horizontal speed passe à 0 si obj_player rencontre obj_wall1, le joueur s'arrête et la collision est simulée
}
x += hsp; // définis la valeur de x (donc la posiiton de obj_player) par rapport à hsp


// Vertical Collision

if (place_meeting(x,y+vsp,obj_wall1)) // Si obj_player rencontre veritcalement obj_wall1 si la fonction vsp (mouvement verticale) est utilisé
{
  while(!place_meeting(x,y+sign(vsp),obj_wall1)) // Loop ; tant que obj_player ne rencontre pas de collison calculé 1 px par 1 px vers le haut ou le bas (dépend du signe de vsp) d'ou y+sign (définis si obj_player va vers le haut ou vers le bas)
  {
    y+= sign(vsp); // Récupère le status de vsp (1 ou -1, pour haut ou bas)
  }
  vsp = 0; // Vertical speed passe à 0 si obj_player rencontre obj_wall1, le joueur s'arrête et la collision est simulée
}
y += vsp;


// Left Wall Jump

if (place_meeting(x+1,y,obj_wall1)) && keyboard_check_pressed = key_jump) // Si obj_player détecte un mur à sa gauche et qu'il appuie sur ESPACE
{
  while (!place_meeting(x,y+1,obj_wall1)) // Check si il n'est pas sur le sol
  {
    vsp = -jumpspeed * 2; // Alors obj_player, une fois la touche espace appuyé, va subir une poussée verticale définis par la formule
    hsp = movespeed * 2; // Alors obj_player, une fois la touche espace appuyé, va subir une poussée horizontale définis par la formule
  } // Résultat : Si le joueur touchait un mur à sa gauche et qu'il a appuyé sur espace, celui-ci aura une poussée en diagonale dans la direction opposée
}


// Right Wall Jump

if (place_meeting(x-1,y,obj_wall1)) && keyboard_check_pressed = key_jump) // Si obj_player détecte un mur à sa droite et qu'il appuie sur ESPACE
{
  while (!place_meeting(x+1,y+1,obj_wall1)) // Check si il n'est pas sur le sol
  {
    vsp = -jumpspeed * 2; // Alors obj_player, une fois la touche espace appuyé, va subir une poussée verticale définis par la formule
    hsp = -movespeed * 2; // Alors obj_player, une fois la touche espace appuyé, va subir une poussée horizontale définis par la formule
  } // Résultat : Si le joueur touchait un mur à sa droite et qu'il a appuyé sur espace, celui-ci aura une poussée en diagonale dans la direction opposée
}
  

// Sticky wall slide left - Permet au joueur, si il reste appuyé sur la flèche gauche, de glisser doucement le long du mur au lieu de chuter

if (place_meeting(x+1,y,obj_wall1)) && keyboard_check = key_left) // Si obj_player détecte un mur à sa gauche et qu'il appuie sur flèche de gauche
{
  while (!place_meeting(x,y+1,obj_wall1)) // Check si obj_player n'est pas sur le sol
  {
    vsp = -jumpspeed * 1.2;
}


// Sticky wall slide right - Permet au joueur, si il reste appuyé sur la flèche droite, de glisser doucement le long du mur au lieu de chuter

if (place_meeting(x-1,y,obj_wall1)) && keyboard_check = key_right) // Si obj_player détecte un mur à sa droite et qu'il appuie sur flèche de droite
{
  while (!place_meeting(x,y+1,obj_wall1)) // Check si obj_player n'est pas sur le sol
  {
    vsp = -jumpspeed * 1.2;
}