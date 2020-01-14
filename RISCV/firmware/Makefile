all: firmware.elf firmware.bin disasm.S firmware.hex firmware.coe

firmware.elf: firmware.S firmware.c firmware.lds
	riscv64-unknown-elf-gcc -ffreestanding -nostdlib -o firmware.elf firmware.S firmware.c \
        -march=rv32i -mabi=ilp32 --std=gnu99 -Wl,-Bstatic,-T,firmware.lds,-Map,firmware.map,--strip-debug -lgcc

firmware.bin: firmware.elf
	riscv64-unknown-elf-objcopy -O binary firmware.elf firmware.bin

lo.mif: firmware.bin
	rom2mif firmware.bin hi.mif mh.mif ml.mif lo.mif
	cp *.mif ../hardware/Picorv32/al_ip

disasm.S: firmware.elf
	riscv64-unknown-elf-objdump -d firmware.elf > disasm.S

firmware.hex: firmware.elf
	riscv64-unknown-elf-objcopy -O verilog firmware.elf firmware.hex

firmware.coe: firmware.bin
	python bin2coe.py

clean:
	rm -f firmware.elf firmware.hex firmware.bin  firmware.map *.mif




