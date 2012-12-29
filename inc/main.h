#ifndef MAIN_H
#define MAIN_H

void etalonnage(void);
void save_input(); 
void save_phase(u8 phase); 
void reset_model(void);
void load_phase(u8 phase);
void load_input();
void calcultrame(void);
void settrimdyn(void);
void bip(u8 temps1,u8 temps2,u8 temps3,u8 temps4,u8 temps5); // temps x 0.2 sec
void reset_neutre(void);
void save_neutre(u8 phase);
void prepareflash(void);

s8 sortiepourcent(u16 sortie);
u16 pourcentsortie(s8 pourcent);


#endif