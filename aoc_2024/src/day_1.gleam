import gleam/int
import gleam/list
import gleam/string

pub fn first_part(input) {
  let #(left, right) =
    input
    |> list.filter(fn(x) { x |> string.replace(" ", "") != "" })
    |> list.map(fn(x) { clean_values(x) })
    |> list.unzip()

  list.zip(list.sort(left, by: int.compare), list.sort(right, by: int.compare))
  |> list.map(fn(item) {
    let #(first, second) = item
    first
    |> int.subtract(second)
    |> int.absolute_value()
  })
  |> list.fold(0, int.add)
}

fn clean_values(item) {
  let assert [sleft, sright] =
    item |> string.split(" ") |> list.filter(fn(x) { x != "" })

  let left = case int.parse(sleft) {
    Ok(left) -> left
    Error(_) -> 0
  }

  let right = case int.parse(sright) {
    Ok(right) -> right
    Error(_) -> 0
  }

  #(left, right)
}

pub fn second_part(input) {
  let #(left, right) =
    input
    |> list.filter(fn(x) { x |> string.replace(" ", "") != "" })
    |> list.map(fn(x) { clean_values(x) })
    |> list.unzip()

  left
  |> list.map(fn(item) {
    let count = list.count(right, fn(x) { x == item })
    item * count
  })
  |> list.fold(0, int.add)
}
