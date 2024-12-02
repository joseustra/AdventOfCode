import day_1
import filepath
import gleeunit
import helpers

import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn first_part_test() {
  let input_path = filepath.join("inputs", "day_1.txt")

  input_path
  |> helpers.read_file()
  |> day_1.first_part()
  |> should.equal(1_882_714)
}

pub fn second_part_test() {
  let input_path = filepath.join("inputs", "day_1.txt")

  input_path
  |> helpers.read_file()
  |> day_1.second_part()
  |> should.equal(19_437_052)
}
