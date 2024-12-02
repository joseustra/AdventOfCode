import day_1
import filepath
import gleam/io
import helpers

pub fn main() {
  let input_path = filepath.join("inputs", "day_1.txt")

  input_path
  |> helpers.read_file()
  // |> day_1.first_part()
  |> day_1.second_part()
  |> io.debug()
}
