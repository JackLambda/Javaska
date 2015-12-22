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

//
