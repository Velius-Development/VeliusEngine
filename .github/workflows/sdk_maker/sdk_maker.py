from os import write, path
from typing import Optional

BASE_PATH = path.dirname(__file__)
FILE_PATH = path.abspath(path.join(BASE_PATH, "..", "..", "..", "src", "velius", "velius.gd"))
DEST_PATH = "velius.gd"

def run() -> None:
    file_content = get_file_content()
    sdk_content = make_SDK(file_content)
    write_SDK(sdk_content)

def get_file_content() -> str:
    with open(FILE_PATH, 'r') as f:
        return f.readlines()

def make_SDK(lines: Optional[str]) -> str:
    for i in range(len(lines)):
        if lines[i].startswith("#"):
            continue
        if lines[i].startswith("\t"):
            lines[i] = ""
        
        if lines[i].endswith(":\n"):
            if lines[i].endswith("String:\n"):
                lines[i] += "\treturn \"\""
            elif lines[i].endswith("int:\n"):
                lines[i] += "\treturn -1"
            elif lines[i].endswith("bool:\n"):
                lines[i] += "\treturn false"
            elif lines[i].endswith("ImageTexture:\n"):
                lines[i] += "\treturn ImageTexture.new()"
            elif lines[i].endswith("Dictionary:\n"):
                lines[i] += "\treturn {}"
            else:
                lines[i] += "\tpass"
            lines[i] += "\n"
    text = "".join(lines)
    text = text.replace("\n\n\n", "\n\n")
    return text

def write_SDK(sdk_content: str) -> None:
    with open(DEST_PATH, 'w') as f:
        f.write(sdk_content)

if __name__ == "__main__": 
    run()
    print("SDK was successfully generated!")
