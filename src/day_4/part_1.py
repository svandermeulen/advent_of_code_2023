import re
from typing import Iterable

from src.utils.io import read_lines
from src.utils.paths import Paths


def parse_line(line: str) -> int:
    card_id, numbers = re.split(pattern=":\s+", string=line)
    winning_numbers, my_numbers = numbers.split(" | ")
    winning_numbers = re.split(string=winning_numbers, pattern=r"\s+")
    my_numbers = re.split(string=my_numbers, pattern=r"\s+")
    overlap = list(map(int, set(winning_numbers).intersection(set(my_numbers))))
    if overlap:
        return 2 ** (len(overlap) - 1)
    return 0


def run(puzzle_input: Iterable[str]):
    total = 0
    for line in puzzle_input:
        total += parse_line(line=line)
    return total


if __name__ == "__main__":
    print(run(puzzle_input=read_lines(path=Paths().path_data / "day_4" / "puzzle_input.txt")))
