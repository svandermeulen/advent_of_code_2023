from typing import Iterable

from utils.io import readlines


def extract_number(txt: str) -> int:
    numeric_chars = [char for char in txt if char.isnumeric()]
    if len(numeric_chars) == 1:
        numeric_chars = numeric_chars * 2
    return int("".join(numeric_chars[::len(numeric_chars) - 1]))

 
def run(puzzle_input: Iterable[str]):
    return sum(extract_number(txt=item) for item in puzzle_input)

 
if __name__ == "__main__":
    print(run(puzzle_input=readlines(path="data/puzzle_input.txt")))
