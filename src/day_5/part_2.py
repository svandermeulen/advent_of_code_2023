from itertools import pairwise
from typing import Iterable

from src.day_5.part_1 import apply_mappings, get_mappings
from src.utils.io import read_lines
from src.utils.paths import Paths


def run(puzzle_input: Iterable[str]):
    puzzle_input = list(puzzle_input)
    seeds = map(int, puzzle_input[0].split(": ")[1].split(" "))
    seeds = map(lambda x: list(range(x[0], x[0] + x[1])), list(pairwise(seeds))[::2])
    mappings = get_mappings(puzzle_input=puzzle_input)
    locations = []
    for seed in (val for subset in seeds for val in subset):
        location = apply_mappings(mappings=mappings, source_number=seed)
        locations.append(location)
    return min(locations)


if __name__ == "__main__":
    print(run(puzzle_input=read_lines(path=Paths().path_data / "day_5" / "puzzle_input.txt")))
