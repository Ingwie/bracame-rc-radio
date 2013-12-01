#ifndef MAIN_H
#define MAIN_H

void etalonnage(void);
void save_phase_ee(u8 modele,u8 phase); 
void reset_modele(void);
void load_input();
void calcultrame(void);
void bip(u8 temps1,u8 temps2,u8 temps3,u8 temps4,u8 temps5); // temps x 0.2 sec
void reset_neutre(void);
void save_neutre_ee(void);
void charge_param_phase(void);
void sauve_numero_modele_actuel_ee(u8 num);
void charge_nom_modele_ee(u8 modele);




s8 sortiepourcent(u16 sortie);
u16 pourcentsortie(s8 pourcent);


#endif