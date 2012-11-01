#ifndef MAIN_H
#define MAIN_H

void etalonnage(void); // taille : 6 x NUM_INPUT
void save_input(u8 model); // taille : (6 x NUM_INPUT)
void save_phase(u8 phase); // taille : (2 x NUM_INPUT) + (6 x NUM_MIXER) + (6 x NUM_OUTPUT) + SECUMOTEUR_LENGTH
void reset_model(void);
void load_phase(u8 phase);
void load_input(u8 model);
void calcultrame(void);
void settrimdyn(void);
void bip(u8 temps1,u8 temps2,u8 temps3,u8 temps4,u8 temps5); // temps x 0.2 sec


s8 sortiepourcent(u16 sortie);
u16 pourcentsortie(s8 pourcent);


#endif