from pathlib import Path


class Paths:
    def __init__(self) -> None:
        self.path_home = Path.cwd().parent.parent
        self.path_data = self.path_home / "data"
        self.path_data_tests = self.path_data / "tests"
