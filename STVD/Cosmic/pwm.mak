# ST Visual Debugger Generated MAKE File, based on pwm.stp

ifeq ($(CFG), )
CFG=Debug
$(warning ***No configuration specified. Defaulting to $(CFG)***)
endif

ToolsetRoot=C:\PROGRA~1\COSMIC\CXSTM8_32K
ToolsetBin=C:\Program Files\COSMIC\CXSTM8_32K
ToolsetInc=C:\Program Files\COSMIC\CXSTM8_32K\Hstm8
ToolsetLib=C:\Program Files\COSMIC\CXSTM8_32K\Lib
ToolsetIncOpts=-i"C:\Program Files\COSMIC\CXSTM8_32K\Hstm8" 
ToolsetLibOpts=-l"C:\Program Files\COSMIC\CXSTM8_32K\Lib" 
ObjectExt=o
OutputExt=elf
InputName=$(basename $(notdir $<))


# 
# Debug
# 
ifeq "$(CFG)" "Debug"


OutputPath=Debug
ProjectSFile=pwm
TargetSName=$(ProjectSFile)
TargetFName=$(ProjectSFile).elf
IntermPath=$(dir $@)
CFLAGS_PRJ=$(ToolsetBin)\cxstm8  +mods0 +debug -pxp -pp -l -i..\..\..\..\libraries\stm8s_stdperiph_driver\inc -i..\..\inc -i..\..\..\includes -i..\..\..\..\stm8sfwlib\fwlib\library\inc $(ToolsetIncOpts) -cl$(IntermPath:%\=%) -co$(IntermPath:%\=%) $<
ASMFLAGS_PRJ=$(ToolsetBin)\castm8  -xx -l $(ToolsetIncOpts) -o$(IntermPath)$(InputName).$(ObjectExt) $<

all : $(OutputPath) $(ProjectSFile).elf

$(OutputPath) : 
	if not exist $(OutputPath)/ mkdir $(OutputPath)

Debug\delay.$(ObjectExt) : ..\..\src\delay.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\hd44780.$(ObjectExt) : ..\..\src\hd44780.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\inc\hd44780.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\inc\delay.h ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\stdarg.h ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\stdio.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\main.$(ObjectExt) : ..\..\src\main.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\inc\tx.h ..\..\inc\delay.h ..\..\inc\hd44780.h ..\..\inc\menu.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\menu.$(ObjectExt) : ..\..\src\menu.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\inc\hd44780.h ..\..\inc\menu.h ..\..\inc\main.h ..\..\inc\tx.h ..\..\inc\delay.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8_interrupt_vector.$(ObjectExt) : ..\..\src\stm8_interrupt_vector.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\inc\stm8s_it.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_it.$(ObjectExt) : ..\..\src\stm8s_it.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\inc\stm8s_it.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\inc\tx.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_adc1.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_adc1.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_awu.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_awu.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_beep.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_beep.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_clk.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_clk.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_flash.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_flash.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_gpio.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_gpio.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim1.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim1.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim2.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim2.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim3.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim3.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

$(ProjectSFile).elf :  $(OutputPath)\delay.o $(OutputPath)\hd44780.o $(OutputPath)\main.o $(OutputPath)\menu.o $(OutputPath)\stm8_interrupt_vector.o $(OutputPath)\stm8s_it.o $(OutputPath)\stm8s_adc1.o $(OutputPath)\stm8s_awu.o $(OutputPath)\stm8s_beep.o $(OutputPath)\stm8s_clk.o $(OutputPath)\stm8s_flash.o $(OutputPath)\stm8s_gpio.o $(OutputPath)\stm8s_tim1.o $(OutputPath)\stm8s_tim2.o $(OutputPath)\stm8s_tim3.o $(OutputPath)\pwm.lkf
	$(ToolsetBin)\clnk  $(ToolsetLibOpts) -o $(OutputPath)\$(TargetSName).sm8 -l"c:\program files\cosmic\cxstm8_32k\lib" -m$(OutputPath)\$(TargetSName).map $(OutputPath)\$(TargetSName).lkf 
	$(ToolsetBin)\cvdwarf  $(OutputPath)\$(TargetSName).sm8

	$(ToolsetBin)\chex  -o $(OutputPath)\$(TargetSName).s19 $(OutputPath)\$(TargetSName).sm8
clean : 
	-@erase $(OutputPath)\delay.o
	-@erase $(OutputPath)\hd44780.o
	-@erase $(OutputPath)\main.o
	-@erase $(OutputPath)\menu.o
	-@erase $(OutputPath)\stm8_interrupt_vector.o
	-@erase $(OutputPath)\stm8s_it.o
	-@erase $(OutputPath)\stm8s_adc1.o
	-@erase $(OutputPath)\stm8s_awu.o
	-@erase $(OutputPath)\stm8s_beep.o
	-@erase $(OutputPath)\stm8s_clk.o
	-@erase $(OutputPath)\stm8s_flash.o
	-@erase $(OutputPath)\stm8s_gpio.o
	-@erase $(OutputPath)\stm8s_tim1.o
	-@erase $(OutputPath)\stm8s_tim2.o
	-@erase $(OutputPath)\stm8s_tim3.o
	-@erase $(OutputPath)\pwm.elf
	-@erase $(OutputPath)\pwm.elf
	-@erase $(OutputPath)\pwm.map
	-@erase $(OutputPath)\delay.ls
	-@erase $(OutputPath)\hd44780.ls
	-@erase $(OutputPath)\main.ls
	-@erase $(OutputPath)\menu.ls
	-@erase $(OutputPath)\stm8_interrupt_vector.ls
	-@erase $(OutputPath)\stm8s_it.ls
	-@erase $(OutputPath)\stm8s_adc1.ls
	-@erase $(OutputPath)\stm8s_awu.ls
	-@erase $(OutputPath)\stm8s_beep.ls
	-@erase $(OutputPath)\stm8s_clk.ls
	-@erase $(OutputPath)\stm8s_flash.ls
	-@erase $(OutputPath)\stm8s_gpio.ls
	-@erase $(OutputPath)\stm8s_tim1.ls
	-@erase $(OutputPath)\stm8s_tim2.ls
	-@erase $(OutputPath)\stm8s_tim3.ls
endif

# 
# Release
# 
ifeq "$(CFG)" "Release"


OutputPath=Release
ProjectSFile=pwm
TargetSName=pwm
TargetFName=pwm.elf
IntermPath=$(dir $@)
CFLAGS_PRJ=$(ToolsetBin)\cxstm8  -i..\..\..\..\libraries\stm8s_stdperiph_driver\inc -i..\..\inc -i..\..\..\includes -i..\..\..\..\stm8sfwlib\fwlib\library\inc +mods0 -pp $(ToolsetIncOpts) -cl$(IntermPath:%\=%) -co$(IntermPath:%\=%) $< 
ASMFLAGS_PRJ=$(ToolsetBin)\castm8  $(ToolsetIncOpts) -o$(IntermPath)$(InputName).$(ObjectExt) $<

all : $(OutputPath) pwm.elf

$(OutputPath) : 
	if not exist $(OutputPath)/ mkdir $(OutputPath)

Release\delay.$(ObjectExt) : ..\..\src\delay.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\hd44780.$(ObjectExt) : ..\..\src\hd44780.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\inc\hd44780.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\inc\delay.h ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\stdarg.h ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\stdio.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\main.$(ObjectExt) : ..\..\src\main.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\inc\tx.h ..\..\inc\delay.h ..\..\inc\hd44780.h ..\..\inc\menu.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\menu.$(ObjectExt) : ..\..\src\menu.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\inc\hd44780.h ..\..\inc\menu.h ..\..\inc\main.h ..\..\inc\tx.h ..\..\inc\delay.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8_interrupt_vector.$(ObjectExt) : ..\..\src\stm8_interrupt_vector.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\inc\stm8s_it.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_it.$(ObjectExt) : ..\..\src\stm8s_it.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\inc\stm8s_it.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\inc\tx.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_adc1.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_adc1.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_awu.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_awu.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_beep.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_beep.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_clk.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_clk.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_flash.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_flash.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_gpio.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_gpio.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim1.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim1.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim2.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim2.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim3.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim3.c ..\..\..\..\..\..\..\..\PROGRA~1\cosmic\cxstm8_32k\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

pwm.elf :  $(OutputPath)\delay.o $(OutputPath)\hd44780.o $(OutputPath)\main.o $(OutputPath)\menu.o $(OutputPath)\stm8_interrupt_vector.o $(OutputPath)\stm8s_it.o $(OutputPath)\stm8s_adc1.o $(OutputPath)\stm8s_awu.o $(OutputPath)\stm8s_beep.o $(OutputPath)\stm8s_clk.o $(OutputPath)\stm8s_flash.o $(OutputPath)\stm8s_gpio.o $(OutputPath)\stm8s_tim1.o $(OutputPath)\stm8s_tim2.o $(OutputPath)\stm8s_tim3.o $(OutputPath)\pwm.lkf
	$(ToolsetBin)\clnk  $(ToolsetLibOpts) -o $(OutputPath)\$(TargetSName).sm8 $(OutputPath)\$(TargetSName).lkf 
	$(ToolsetBin)\cvdwarf  $(OutputPath)\$(TargetSName).sm8 

	$(ToolsetBin)\chex  -o $(OutputPath)\$(TargetSName).s19 $(OutputPath)\$(TargetSName).sm8
clean : 
	-@erase $(OutputPath)\delay.o
	-@erase $(OutputPath)\hd44780.o
	-@erase $(OutputPath)\main.o
	-@erase $(OutputPath)\menu.o
	-@erase $(OutputPath)\stm8_interrupt_vector.o
	-@erase $(OutputPath)\stm8s_it.o
	-@erase $(OutputPath)\stm8s_adc1.o
	-@erase $(OutputPath)\stm8s_awu.o
	-@erase $(OutputPath)\stm8s_beep.o
	-@erase $(OutputPath)\stm8s_clk.o
	-@erase $(OutputPath)\stm8s_flash.o
	-@erase $(OutputPath)\stm8s_gpio.o
	-@erase $(OutputPath)\stm8s_tim1.o
	-@erase $(OutputPath)\stm8s_tim2.o
	-@erase $(OutputPath)\stm8s_tim3.o
	-@erase $(OutputPath)\pwm.elf
	-@erase $(OutputPath)\pwm.map
	-@erase $(OutputPath)\pwm.st7
	-@erase $(OutputPath)\pwm.s19
	-@erase $(OutputPath)\delay.ls
	-@erase $(OutputPath)\hd44780.ls
	-@erase $(OutputPath)\main.ls
	-@erase $(OutputPath)\menu.ls
	-@erase $(OutputPath)\stm8_interrupt_vector.ls
	-@erase $(OutputPath)\stm8s_it.ls
	-@erase $(OutputPath)\stm8s_adc1.ls
	-@erase $(OutputPath)\stm8s_awu.ls
	-@erase $(OutputPath)\stm8s_beep.ls
	-@erase $(OutputPath)\stm8s_clk.ls
	-@erase $(OutputPath)\stm8s_flash.ls
	-@erase $(OutputPath)\stm8s_gpio.ls
	-@erase $(OutputPath)\stm8s_tim1.ls
	-@erase $(OutputPath)\stm8s_tim2.ls
	-@erase $(OutputPath)\stm8s_tim3.ls
endif
