import sys
from pathlib import Path
from ffmpeg import FFmpeg


# ffmpeg -i input.mp3 -ac 1 -ar 48000 output.dfpwm
def convert_file(file_path: Path, output_name: str = ""):    
    file_location = file_path.parent
    output_name = output_name.strip().removesuffix(".dfpwm")
    if len(output_name) == 0:
        output_name = file_path.stem
    print(f"Exporting to '{file_location}' as '{output_name}.dfpwm'")
    query = (
        FFmpeg()
        .option("y")
        .input(file_path)
        .output(
            Path(file_location, f"{output_name}.dfpwm"),
            { "ac": 1, "ar": 48000 }
        )
    )

    query.execute()

def ask_for_name(file):
    input_file = Path(file)
    print(f"\nConverting '{input_file.stem}'...")
    output_name = input("Enter the desired output name or leave empty to use the same name: ")    
    convert_file(input_file, output_name)

def _run():
    argc = len(sys.argv)
    
    if argc < 2:
        print("Launch this script either by dragging an audio file to it or by passing it as the first argument.")
        exit(1)
    elif argc == 2:
        ask_for_name(file)
    else:
        if input("Do you want to use the input file names as the output file names? [Y/n] ").strip().lower().startswith("n"):
            for file in sys.argv[1:]:
                ask_for_name(file)
        else:
            for file in sys.argv[1:]:
                convert_file(Path(file))

    
if __name__ == "__main__":
    _run()