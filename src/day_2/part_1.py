from typing import Iterable

from src.utils.io import read_lines
from src.utils.paths import Paths


def run(puzzle_input: Iterable[str]):
    return -1


if __name__ == "__main__":
    print(run(puzzle_input=read_lines(path=Paths().path_data / "day_2" / "puzzle_input.txt")))
