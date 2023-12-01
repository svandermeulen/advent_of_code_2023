from typing import Iterable

from src.utils.io import read_lines
from src.utils.paths import Paths


def extract_number(txt: str) -> int:
    numeric_chars = [char for char in txt if char.isnumeric()]
    if len(numeric_chars) == 1:
        numeric_chars = numeric_chars * 2
    return int("".join(numeric_chars[:: len(numeric_chars) - 1]))


def run(puzzle_input: Iterable[str]) -> int:
    return sum(extract_number(txt=item) for item in puzzle_input)


if __name__ == "__main__":
    print(run(puzzle_input=read_lines(path=Paths().path_data / "day_1" / "puzzle_input.txt")))
