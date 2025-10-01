import sys
from pathlib import Path

sc = ["shortcut0_1", "shortcut0_2", "shortcut0_3","shortcut0_4","shortcut0_5","shortcut0_6","shortcut0_7","shortcut0_8","shortcut0_9","shortcut0_10","shortcut0_11","shortcut1_1","shortcut1_2","shortcut1_3","shortcut1_4"]
# sc = ["shortcut0_2"]

BASE_DIR = Path("002_resnet_eb18_image0")

for name in sc:
    src_path1 = BASE_DIR/name/"mem_hex.txt"
    src_path2 = BASE_DIR/name/"ofmap_64bit.txt"

    mem_lines = sum(1 for _ in src_path1.open()) if src_path1.exists() else 0
    ofm_lines = sum(1 for _ in src_path2.open()) if src_path2.exists() else 0

    print(f"{name:12}  mem_hex lines : {mem_lines:5}   "
          f"ofmap_64bit lines : {ofm_lines:5}")

# def add_commas(path: Path):
#     lines = path.read_text(encoding="utf-8").splitlines()

#     for i in range(len(lines) - 1):
#         lines[i] = lines[i].rstrip() + ','

#     path.write_text("\n".join(lines) + "\n", encoding="utf-8")

# def add_hex(path: Path):
#     lines = path.read_text(encoding="utf-8").splitlines()

#     for i in range(len(lines)):
#         lines[i] = '0x' + lines[i].rstrip()

#     for i in range(len(lines) - 1):
#         lines[i] = lines[i].rstrip() + ','

#     path.write_text("\n".join(lines) + "\n", encoding="utf-8")

# for name in sc:
#     src_path = BASE_DIR/name/"mem_hex.txt"
#     add_commas(src_path)

# for name in sc:
#     src_path = BASE_DIR/name/"ofmap_64bit.txt"
#     add_hex(src_path)

# def bin2hex_line(bits: str) -> str:
#     val = int(bits, 2)
#     nibbles = max(1, (len(bits) + 3) // 4)
#     if nibbles % 2:
#         nibbles += 1
#     return f"0x{val:0{nibbles}X}"

# for name in sc:
#     src_path = BASE_DIR/name/"mem.txt"
#     dst_path = BASE_DIR/name/"mem_hex.txt"

#     with src_path.open("r", encoding="utf-8") as fin, \
#          dst_path.open("w", encoding="utf-8") as fout:

#         for raw in fin:
#             bits = raw.strip()
#             fout.write(bin2hex_line(bits) + "\n")