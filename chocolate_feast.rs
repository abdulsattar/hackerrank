use std::io::buffered::BufferedReader;
use std::io;
fn exchange(w: int, n: int) -> int {
  if w < n { return 0; }
  w - n + 1 + exchange(w - n + 1, n)
}

fn main() {
  let mut br = BufferedReader::new(io::stdin());

  let n = from_str::<int>(br.read_line().unwrap_or(~"N")).unwrap_or(0);

  println!("{:d}", n);
}
