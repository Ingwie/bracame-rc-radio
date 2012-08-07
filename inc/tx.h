#ifndef __TX__H
#define __TX__H


//modele
#define NUM_MODEL 4
#define NUM_PHASE 2

#define NUM_INPUT 6
#define NUM_INPUT_SWITCH 2
#define NUM_OUTPUT 8
#define NUM_MIXER 16

#define LONGUEUR_TRAME 44100  //40000 = 20MS 44100 = 22.5 MS
#define LONGUEUR_PULSE 600 // 0.3MS
#define MIN_COURSE 2000 // Servo min course
#define NEUTRE_COURSE 3000 // Servo neutre course
#define MAX_COURSE 4000 // Servo max course
#define BASE_EEPROM 0x4000
#define SECUMOTEUR_LENGTH 2 //Canal + ratiobat
#define MODEL_ACTUEL_LENGTH 1
#define PHASE_LENGTH ((2 * NUM_INPUT) + (4 * NUM_MIXER) + (4 * NUM_OUTPUT) + SECUMOTEUR_LENGTH)
#define INPUT_LENGTH (6 * NUM_INPUT)


typedef struct
{
	u16 usValue;
	u16 usMinValue;
	u16 usNeutralValue;
	u16 usMaxValue;
	u32 pente[2];
	s8 expo[2];
} struct_input_channel;

typedef struct
{
	struct_input_channel channel[NUM_INPUT];
} struct_input;


typedef struct
{
	u8 secumoteur;
	u8 dr[NUM_OUTPUT];
	s32 sValue[NUM_OUTPUT];
	u16 usMinValue[NUM_OUTPUT];
	u16 usNeutralValue[NUM_OUTPUT];
	u16 usMaxValue[NUM_OUTPUT];
	u16 usValueOut[NUM_OUTPUT + 1]; 
} struct_output;


typedef struct
{	u8  in;
	u8  out;
	s8  pente[2];
} struct_mixer_settings; 



extern u8  modele_actuel;
extern u8  phase_actuelle;
extern struct_input NEAR input;
extern struct_mixer_settings NEAR mixer[NUM_MIXER];
extern struct_output NEAR output;



#endif
