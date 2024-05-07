"""Encoding shellcode for 16 bit x86."""

from typer import Typer
from pathlib import Path
import struct


APP = Typer()
START = 0x41


def encode(instr: int) -> bytes:
    return struct.pack(
        ">bb",
        ((instr >> 4) & 0xF) + START + (instr & 0xF) + START)


@APP.command()
def main(binary_file: Path):
    with binary_file.open("rb") as f:
        binary_data = f.read()

    encoded_data = b""
    for instr in binary_data:
        encoded_data += encode(instr)

    encoded_binary_file = binary_file.with_name(binary_file.name + ".encoded")
    with encoded_binary_file.open("rb") as f:
        f.write(encoded_data)


if __name__ == "__main__":
    main()
