use std::fs::File;
use std::io::{self, BufReader, BufWriter, Read, Write};
use std::path::Path;

fn copy(input: &Path, output: &Path) -> io::Result<()> {
    let (mut reader, mut writer) = (
        BufReader::new(File::open(input)?),
        BufWriter::new(File::create(output)?),
    );

    let mut contents = Vec::new();
    reader.read_to_end(&mut contents)?;
    writer.write_all(&contents)?;
    Ok(())
}

fn main() {
    let args = std::env::args().skip(1).collect::<Vec<String>>();
    let (input, output) = (Path::new(&args[0]), Path::new(&args[1]));
    copy(input, output).unwrap();
}
