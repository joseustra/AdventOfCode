import gleam/result
import gleam/string
import simplifile

import gleam/erlang/charlist.{type Charlist}

type Direction {
  Both
}

pub fn read_file(input_path) {
  let input = simplifile.read(from: input_path)
  let content = result.map(input, string_trim(_, Both, "\n"))

  case content {
    Ok(value) -> value |> string.split("\n")
    Error(_error) -> panic
  }
}

fn string_trim(s: String, dir: Direction, sub: String) -> String {
  do_trim(s, dir, charlist.from_string(sub))
}

@external(erlang, "string", "trim")
fn do_trim(a: String, b: Direction, c: Charlist) -> String

pub type RunErr {
  FailedToReadInput(String)
}
