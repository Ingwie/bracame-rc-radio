


#ifndef __TX__H
#define __TX__H


//modele
#define NUM_MODEL 15
#define NUM_PHASE 3
#define NUM_COURBES 5
#define NUM_POINTS_COURBE 6
#define NUM_PAGE_PHASE 4 // monbre de pages memoire par phase


#define NUM_INPUT 6
#define NUM_INPUT_SWITCH 2
#define NUM_OUTPUT 8
#define NUM_MIXER 18

#define LONGUEUR_TRAME (45000 - 1)  //40000 = 20mS 45000 = 22.5 mS 2000 = 1mS
#define LONGUEUR_PULSE 600 // 0.3MS
#define MIN_COURSE 2000 // Servo min course
#define NEUTRE_COURSE 3000 // Servo neutre course
#define MAX_COURSE 4000 // Servo max course
#define PLACE_1 7 // Reserve de memoire eeprom 1
#define PLACE_2 16 // Reserve de memoire eeprom 2
#define PLACE_3 16 // Reserve de memoire eeprom 3


typedef struct
{
	s16 usValue;
	u16 usMinValue;
	u16 usNeutralValue;
	u16 usMaxValue;
	u16 pente[2];
} struct_input_channel;

typedef struct
{
	struct_input_channel channel[NUM_INPUT];
} struct_input;


typedef struct
{
	s32 sValue[NUM_OUTPUT];
	u16 usValueOut[NUM_OUTPUT + 1]; 
} struct_output;


typedef struct
{	
	u8  in;
	u8  out;
	s8  pente[2];
} struct_mixer_settings; 


typedef struct
{
	u8 secumoteur;
	u8 ratiobat;
	s8 expo[NUM_INPUT][2];
	u8 dr[NUM_INPUT + NUM_INPUT_SWITCH];
	s8 courbe[NUM_COURBES][NUM_POINTS_COURBE];
	struct_mixer_settings mixer[NUM_MIXER];
	s16 usMinValue[NUM_OUTPUT];
	s16 usNeutralValue[NUM_OUTPUT];
	s16 usMaxValue[NUM_OUTPUT]; 
} struct_param_phase;


extern u8  modele_actuel;
extern u8  phase_actuelle;
extern struct_input NEAR input;
extern struct_output NEAR output;
extern struct_param_phase NEAR param_phase[NUM_PHASE];



#endif
