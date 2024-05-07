    jmp B                                   0xEB 0x02
A:
    jmp C                                   0xEB 0x02
B:
    call A                                  0xE8 -2
C:
    pop di                                  0x5F
    add                 di, 0x1C            0x83 ___ 0x1C
    push                di                  0x57
    push                si                  0x56
here:
    mov al, byte ptr    [di]                ___
    sub                 al, 41h             0x2C 0x41
    shl                 al, 4               0xC0 ____ 0x04
    inc                 di                  0xFE 0x07
    add                 al, byte ptr [di]   
    sub                 al, 41h             0x2C 0x41
    mov                 byte ptr [si], al   
    inc                 si                  0xFE 0x06
    inc                 di                  0xFE 0x07
    cmp byte ptr [di],  0x51
    jb                  here                0xEB -___


